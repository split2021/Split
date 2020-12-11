import React from 'react';
import {
    Container,
    Tab,
    Title,
    Goback,
} from '../Global.styles.js';
import Cookies from 'universal-cookie';
import CircularProgress from '@material-ui/core/CircularProgress';
import Request from "../../../components/Api/Request";
import Case from '../../../components/Case/Case';
import { FlexContainer } from '../Account.styles';

export default class Groupes extends React.Component {

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
                groups: '',
                groupData: [],
            };
        } else {
            console.log('cookie non présent');
            this.handleRedirect('/');
        }
    }

    componentDidMount() {
        this.getGroups();
    }

    handleRedirect(direction, groupData) {
        this.props.history.push({
            pathname: direction,
            state: groupData,
        });
    }

    async retrieveGroups() {
        let group;
        let result = [];
        let data = [];
        for (let i = 0; i < (this.state.data.user.payment_groups).length; i++) {
            group = await Request(
              'paymentgroups/' + this.state.data.user.payment_groups[i].id,
              {},
              this.state.adminData.token,
              'get'
            );
            this.setState({ loadPercentage : (((i + 1) * 100) / (this.state.data.user.payment_groups).length) })
            if (group.data.data) {
                data.push(group.data.data);
                result.push(
                  <Case
                    key={ this.state.data.user.payment_groups[i].id }
                    onClick={
                        () => this.handleRedirect('/groupsUsers',
                      { groupData: this.state.groupData, id: i })
                    }
                    Title={group.data.data.name}
                    Number={(group.data.data.users).length}
                  />
                );
            }
        }
        this.setState( { groupData : data } )
        return result;
    }

    async getGroups() {
        let groupList = this.state ? await this.retrieveGroups() : [];
        this.setState({ loader : false });
        this.setState({ groups : groupList });
    }

    render() {
        return (
            <Container>
                <Tab>
                    <Goback onClick={() => {this.handleRedirect('/account')}}>&larr;  Retourner vers mon Compte</Goback>
                    <Title>Mes Groupes</Title>
                    {
                        this.state && this.state.groups ?
                          <FlexContainer>{ this.state.groups }</FlexContainer> :
                          <div style={ { marginTop: '80px', overflow: 'hidden' } }><CircularProgress /></div>
                    }
                </Tab>

            </Container>
        )
    }
}
