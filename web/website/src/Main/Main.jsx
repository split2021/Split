import React from 'react';
import { Container } from './Main.styles.js';
import Home from './Home/Home.jsx';
import Subscribe from './Subscribe/Subscribe.jsx';
import Login from './Login/Login';
import Footer from './Footer/Footer';
import Account from './Account/Account';
import Groupes from './Account/Groupes/Groupes';
import PayementMethods from './Account/PaymentMethods/PayementMethods';
import Payements from './Account/Payments/Payements';
import Settings from './Account/Settings/Settings';
import { Router, Route } from 'react-router-dom';
import History from '../components/History/History';
import ChangePassword from './Account/Password/Password.jsx';

export default class App extends React.Component {
  render() {
    return (
      <Container>
        <Router history={History}>
          <Route exact path="/" component={Home}/>
          <Route path="/subscribe" component={Subscribe}/>
          <Route path="/login" component={Login}/>
          <Route path="/account" component={Account}/>
          <Route path="/groupes" component={Groupes}/>
          <Route path="/payementmethods" component={PayementMethods}/>
          <Route path="/history" component={Payements}/>
          <Route path="/settings" component={Settings}/>
          <Route path="/password" component={ChangePassword} />
          <Footer/>
        </Router>
      </Container>
    )
  }
}
