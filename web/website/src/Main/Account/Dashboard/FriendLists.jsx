import React from "react";
import Cookies from "universal-cookie";
import Request from "../../../components/Api/Request";
import {CollumnFriend, Friend, Tableau} from "../Amis/Amis.styles";
import {Collumn, Collumns, Container, Goback, Loader, Tab, Title} from "../Global.styles";
import LinearProgress from "@material-ui/core/LinearProgress";

export default class FriendLists extends React.Component {

    constructor(props) {
        super(props);
        this.cookies = new Cookies();
        if ( this.cookies !== undefined && (this.cookies.get('auth')) !== undefined) {
            console.log('cookie présent');
            this.state = {
                connected: true,
                elem: 0,
                data: JSON.parse(localStorage.getItem('userData')) || '',
                adminData: JSON.parse(localStorage.getItem('adminData')) || '',
                loader: true,
                loadPercentage: 0,
                friends: '',
            };
        } else {
            console.log('cookie non présent');
            this.handleRedirect('/');
        }
    }

    componentDidMount() {
        this.getFriends();
    }

    handleRedirect(direction) {
        this.props.history.push(direction);
    }

    async retrieveFriends() {
        let friend;
        let result = [];
        for (let i = 0; i < (this.state.data.user.friends).length; i++) {
            this.setState({ loadPercentage : (((i + 0.1) * 100) / (this.state.data.user.friends).length) });
            friend = await Request(
                'users/' + this.state.data.user.friends[i].id,
                {},
                this.state.adminData.token,
                'get'
            );

            this.setState({ loadPercentage : (((i + 1.5) * 100) / (this.state.data.user.friends).length) });
            if (friend.data.data) {
                result.push(
                    <Friend>
                        <CollumnFriend>
                            { friend.data.data.first_name + ' ' + friend.data.data.last_name }
                        </CollumnFriend>
                        <CollumnFriend>
                            { friend.data.data.email }
                        </CollumnFriend>
                    </Friend>
                );
            }
        }
        return result;
    }

    async getFriends() {
        let friendList = this.state ? await this.retrieveFriends() : [];
        this.setState({ loader : false });
        this.setState({ friends : friendList });
    }

    render() {
        return (
            <Container>
                <Tab>
                    <div style={ { overflow: 'auto' } }>
                        <Tableau>
                            <Collumns>
                                <Collumn>Nom</Collumn>
                                <Collumn>E-mail</Collumn>
                            </Collumns>
                            {
                                this.state && this.state.friends ? this.state.friends :
                                    <Loader>
                                        <LinearProgress
                                            variant="determinate"
                                            value={ this.state ? this.state.loadPercentage : 0 } />
                                    </Loader>
                            }

                        </Tableau>
                    </div>
                </Tab>

            </Container>
        )
    }
}