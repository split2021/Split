import React from 'react';
import { Container } from './Main.styles.js';
import Home from './Home/Home.jsx';
import Subscribe from './Subscribe/Subscribe.jsx';
import Login from './Login/Login';
import Footer from './Footer/Footer';
import Account from './Account/Account';
import Amis from './Account/Amis/Amis';
import Groupes from './Account/Groupes/Groupes';
import Settings from './Account/Settings/Settings';
import { Router, Route } from 'react-router-dom';
import History from '../components/History/History';
import ReactNotification from 'react-notifications-component';
import 'react-notifications-component/dist/theme.css';
import { ThemeProvider } from "@material-ui/core";
import ChangePassword from './Account/Password/Password.jsx';
import theme from '../components/Theme/Theme';
import Header from './Header/Header';

export default class App extends React.Component {
  render() {
    return (
      <ThemeProvider theme={theme}>
        <Container>
          <ReactNotification />
          <Router history={History}>
            <Header history={History} {...this.props}/>
            <Route exact path="/" component={Home}/>
            <Route path="/subscribe" component={Subscribe}/>
            <Route path="/login" component={Login}/>
            <Route path="/account" component={Account}/>
            <Route path="/amis" component={Amis}/>
            <Route path="/groupes" component={Groupes}/>
            <Route path="/settings" component={Settings}/>
            <Route path="/password" component={ChangePassword} />
            <Footer/>
          </Router>
        </Container>
      </ThemeProvider>
    )
  }
}
