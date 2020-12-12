import React from 'react';
import {Tableau, Collumn,  Collumns, Tab} from "./chart.style";
import Cookies from "universal-cookie";
import {Container, Loader} from "../Global.styles";
import LinearProgress from "@material-ui/core/LinearProgress";

export default class Charts extends React.Component {
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
        this.state.data && this.getDate();
        console.log(this.state.data.user);
    }



    async getDate() {
        let date = this.state.data.user.date_joined;
        this.setState({ loader : false });
        this.setState({ date_joined : date });
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
    }}