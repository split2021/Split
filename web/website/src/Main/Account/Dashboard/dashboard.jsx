import React from 'react';
import { Container } from './Dashboard.style';

import Charts from "./chart";

export default class Dashboard extends React.Component {


    handleRedirect(direction) {
        this.props.history.push(direction);
    }

    render() {
        return (
            <Container>

            </Container>
        );
    }
}