import React from 'react';
import Cookies from 'universal-cookie';
import Notification from '../../components/Notification/Notification';
import {
  Container,
  Logo,
  Elements,
  MenuTab,
  MenuTxt,
  Title
} from './Header.styles';
import Button from '@material-ui/core/Button';
import History from "../../components/History/History";

export default class Header extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      connected: false,
    }
  }

  handleClick(direction) {
    this.props.history.push(direction);
  }

  componentDidMount() {
    this.unlisten = History.listen( location =>  {
      this.cookies = new Cookies();
      if ( this.cookies !== undefined && (this.cookies.get('auth')) !== undefined) {
        console.log('cookie présent');
        this.setState({
          connected: true,
        });
      } else {
        console.log('cookie non présent');
        this.setState({
          connected: false,
        });
      }
    });
  }

  componentWillUnmount() {
    this.unlisten();
  }

  async disconnection() {
    this.cookies.remove('auth');
    this.setState({connected: false});
    Notification('default','', 'Vous êtes maintenant déconnecté.');
    this.handleClick('/');
  }

  render() {
    return(
      <Container>
        <Elements>
          <Logo onClick={() => {this.handleClick('/')}}/>
          <Title onClick={() => {this.handleClick('/')}}>plit</Title>
          <MenuTab>
            {this.state.connected ?
              [<Button style={{marginRight: '16px', borderRadius: '30px'}} color="primary" onClick={() => {this.disconnection()}}>
                <MenuTxt>Déconnexion</MenuTxt></Button>,
                <Button style={{borderRadius: '30px'}} variant="contained" color="primary" onClick={() => {this.handleClick('/account')}}>
                  <MenuTxt>Mon compte</MenuTxt></Button>]
              :
                [<Button style={{marginRight: '16px', borderRadius: '30px'}} color="primary" onClick={() => {this.handleClick('/login')}}>
                  <MenuTxt>Se connecter</MenuTxt></Button>,
                <Button style={{borderRadius: '30px'}} variant="contained" color="primary" onClick={() => {this.handleClick('/subscribe')}}>
                  <MenuTxt>S'inscrire</MenuTxt></Button>]
            }
          </MenuTab>
        </Elements>
      </Container>
    )
  }
}