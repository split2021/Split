import React from 'react';
import Header from '../../Header/Header';
import {
    Container,
    Tab,
    Title,
    Goback,
} from '../Global.styles.js';
import Cookies from 'universal-cookie';
import {
    NbElem, Tableau
} from "./Payements.styles";

export default class Payements extends React.Component {

    constructor(props) {
        super(props);
        this.cookies = new Cookies();
        if ( this.cookies !== undefined && (this.cookies.get('auth')) !== undefined) {
            console.log('cookie présent');
            this.state = {
                connected: true,
                elem: 0,
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
                <Tab>
                    <Title>Historique de paiement</Title>
                    <Goback onClick={() => {this.handleRedirect('/account')}}>&larr;  Retourner vers mon Compte</Goback>
                    <Tableau>
                        <NbElem>Vous avez : {this.state.elem} historique de paiement</NbElem>

                    </Tableau>
                </Tab>

            </Container>
        )
    }
}
