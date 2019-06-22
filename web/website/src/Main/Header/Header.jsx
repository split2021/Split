import React from 'react';
import { Container, Logo, Elements, MenuTab } from './Header.styles';

export default class Header extends React.Component {
  render() {
    return (
      <Container>
        <Elements>
          <Logo src={process.env.PUBLIC_URL + "logo-split.png"}/>
          <MenuTab>CONTACT</MenuTab>
          <MenuTab>MON COMPTE</MenuTab>
          <MenuTab>S'INSCRIRE</MenuTab>
        </Elements>
      </Container>
    )
  }
}