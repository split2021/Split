import React from 'react';
import {
  Container,
  Logo,
  Elements,
  MenuTab
} from './Header.styles';

export default class Header extends React.Component {
  render() {
    return (
      <Container>
        <Elements>
          <Logo to={'/'}/>
          <MenuTab redirect={'/login'}>MON COMPTE</MenuTab>
          <MenuTab redirect={'/subscribe'}>S'INSCRIRE</MenuTab>
        </Elements>
      </Container>
    )
  }
}