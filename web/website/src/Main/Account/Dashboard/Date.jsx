import React from 'react';
import {Tableau, Collumn,  Collumns, Tab} from "./Date.style";
import {Container, Loader} from "../Global.styles";
import LinearProgress from "@material-ui/core/LinearProgress";
import moment from "moment";

export default class Dates extends React.Component {
    constructor(props) {
        super(props);
            this.state = {
                connected: true,
                elem: 0,
                data: JSON.parse(localStorage.getItem('userData')) || '',
                adminData: JSON.parse(localStorage.getItem('adminData')) || '',
                loader: true,
                loadPercentage: 0,
                date_joined: '',
            };
        }


    componentDidMount() {
        this.getDate();
    }


    async getDate() {
        if (this.state.data.user !== undefined && this.state.data.user.date_joined !== undefined ) {
            let date = this.state.data.user.date_joined;
            const dates = moment(date).format('DD/MM/YYYY HH:mm')
            this.setState({ loader : false });
            this.setState({ date_joined : dates });

        }
    }

    render() {
        return (
            <Container>
                <Tab>
                    <Tableau >
                        <Collumns>
                            <Collumn>Date D'arrivée</Collumn>
                        </Collumns>
                        {
                            this.state && this.state.date_joined ? this.state.date_joined :
                                <Loader>
                                    <LinearProgress

                                        variant="determinate"
                                        value={ this.state ? this.state.loadPercentage : 0 } />
                                </Loader>
                        }
                    </Tableau>
                </Tab>
            </Container>
        )
    }
}
