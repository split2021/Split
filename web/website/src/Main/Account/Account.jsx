import React from 'react';
import Header from '../Header/Header';
import Case from '../../components/Case/Case';
import Cookies from 'universal-cookie';
import {
  Tab,
  Container,
  Title,
} from './Account.styles.js';

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
        <Tab>
            <Title>Mon Compte</Title>
            <Case
                onClick={() => this.handleRedirect('/amis')}
                Title={'Amis'}
                Background={process.env.PUBLIC_URL + 'groupes.jpg'}
            />
            <Case
                onClick={() => this.handleRedirect('/groupes')}
                Title={'Groupes'}
                Background={process.env.PUBLIC_URL + 'groupes.jpg'}
            />
            <Case
                onClick={() => this.handleRedirect('/history')}
                Title={'Historique de paiements'}
                Background={process.env.PUBLIC_URL + 'historique.jpg'}
            />
            <Case
                onClick={() => this.handleRedirect('/payementmethods')}
                Title={'Moyens de paiement'}
                Background={process.env.PUBLIC_URL + 'paiements.png'}
            />
            <Case
                onClick={() => this.handleRedirect('/settings')}
                Title={'Paramètres de mon compte'}
                Background={process.env.PUBLIC_URL + 'settings.jpg'}
            />
      </Tab>
      </Container>
    )
  }
}
