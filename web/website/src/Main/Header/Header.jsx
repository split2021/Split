import React from 'react';
import { Container, Logo, MenuTab } from './Header.styles';

export default class Header extends React.Component {
  render() {
    return (
      <Container>
        <Logo src={process.env.PUBLIC_URL + "logo-split.png"}/>
        <MenuTab>CONTACT</MenuTab>
        <MenuTab>S'INSCRIRE</MenuTab>
        <MenuTab>MON COMPTE</MenuTab>
      </Container>
    )
  }
}