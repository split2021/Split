import React from 'react';
import Header from '../../Header/Header';
import {
    Container,
    Tab,
    Title,
} from './Payements.styles.js';
import Cookies from 'universal-cookie';

export default class Payements extends React.Component {

    constructor(props) {
        super(props);
        this.cookies = new Cookies();
        if ( this.cookies !== undefined && (this.cookies.get('auth')) !== undefined) {
            console.log('cookie présent');
            this.state = {
                connected: true,
            };
        } else {
            console.log('cookie non présent');
            this.handleRedirect('/');
        }
    }

    handleRedirect(direction) {
        this.props.history.push(direction);
    }

    render() {
        return (
            <Container>
                <Header {...this.props}/>
                <Tab>
                    <Title>Historique de paiement</Title>
                </Tab>

            </Container>
        )
    }
}
