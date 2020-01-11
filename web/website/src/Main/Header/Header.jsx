import React from 'react';
import Cookies from 'universal-cookie';
import {
  Container,
  Logo,
  Elements,
  MenuTab
} from './Header.styles';

export default class Header extends React.Component {

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
      this.state = {
        connected: false,
      };
    }
  }

  handleClick(direction) {
    this.props.history.push(direction);
  }

  disconnection() {
    this.cookies.remove('auth');
    this.setState({connected: false});
    this.handleClick('/');
  }

  render() {
    return (
      <Container>
        <Elements>
          <Logo onClick={() => {this.handleClick('/')}}/>
          {this.state.connected ?
              [<MenuTab onClick={() => {this.disconnection()}}>DECONNEXION</MenuTab>,
                  <MenuTab onClick={() => {this.handleClick('/account')}}>MON COMPTE</MenuTab>]
              :
              [<MenuTab onClick={() => {this.handleClick('/login')}}>SE CONNECTER</MenuTab>,
                  <MenuTab onClick={() => {this.handleClick('/subscribe')}}>S'INSCRIRE</MenuTab>]
          }
        </Elements>
      </Container>
    )
  }
}