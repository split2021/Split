import React from 'react';
import Case from '../../components/Case/Case';
import Cookies from 'universal-cookie';
import {
  Tab,
  Container,
  Title,
  Icon,
  HistoryList,
} from './Account.styles.js';

export default class SettingsTab extends React.Component {

  constructor(props) {
    super(props);
    this.cookies = new Cookies();
    if ( this.cookies !== undefined && (this.cookies.get('auth')) !== undefined) {
      console.log('cookie présent');
      this.state = {
        connected: true,
        token: this.cookies.cookies.auth,
        data: JSON.parse(localStorage.getItem('userData')) || '',
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
          <Icon />
          <Title>{this.state.data.user.first_name + ' ' + this.state.data.user.last_name}</Title>
          <Case
            onClick={() => this.handleRedirect('/amis')}
            Title={'Amis'}
            Number={ this.state.data.user.friends_count }
          />
          <Case
            onClick={() => this.handleRedirect('/groupes')}
            Title={'Groupes'}
            Number={ this.state.data.user.payment_groups.length }
          />
          {/*<Case
            onClick={() => this.handleRedirect('/history')}
            Title={'Historique de paiements'}
          />
          <Case
            onClick={() => this.handleRedirect('/settings')}
            Title={'Paramètres de mon compte'}
          />*/}
        </Tab>
        <HistoryList />
      </Container>
    )
  }
}
