import React from 'react';
import {
  Container,
  Logo,
  Elements,
  MenuTab
} from './Header.styles';

export default class Header extends React.Component {
  handleClick(direction) {
    this.props.history.push(direction);
  }

  render() {
    return (
      <Container>
        <Elements>
          <Logo onClick={() => {this.handleClick('/')}}/>
          <MenuTab onClick={() => {this.handleClick('/login')}}>MON COMPTE</MenuTab>
          <MenuTab onClick={() => {this.handleClick('/subscribe')}}>S'INSCRIRE</MenuTab>
        </Elements>
      </Container>
    )
  }
}