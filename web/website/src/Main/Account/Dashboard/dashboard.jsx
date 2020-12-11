import React from 'react';
import { Container } from './Dashboard.style';


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