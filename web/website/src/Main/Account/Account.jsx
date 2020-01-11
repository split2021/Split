import React from 'react';
import Header from '../Header/Header';
import {
  Tab,
  Container
} from './Account.styles.js';

export default class SettingsTab extends React.Component {
  render() {
    return (
      <Container>
        <Header {...this.props}/>
          <Tab>
            Conception en cours de la page de votre compte
          </Tab>
      </Container>
    )
  }
}
