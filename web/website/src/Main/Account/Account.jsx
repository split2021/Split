import React from 'react';
import Header from '../Header/Header';
import Case from '../../components/Case/Case';
import {
  Tab,
  Container,
  Title,
} from './Account.styles.js';
import Cookies from "universal-cookie";

export default class SettingsTab extends React.Component {

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
            <Title>Mon Compte</Title>
            <Case
                Title={'Groupes'}
                Background={process.env.PUBLIC_URL + 'groupes.jpg'}
            />
            <Case
                Title={'Historique de paiements'}
                Background={process.env.PUBLIC_URL + 'historique.jpg'}
            />
            <Case
                Title={'Moyens de paiement'}
                Background={process.env.PUBLIC_URL + 'paiements.png'}
            />
            <Case
                Title={'Paramètres de mon compte'}
                Background={process.env.PUBLIC_URL + 'settings.jpg'}
            />
          </Tab>
      </Container>
    )
  }
}
