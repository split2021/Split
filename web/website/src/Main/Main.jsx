import React from 'react';
import { Container } from './Main.styles.js';
import Home from './Home/Home.jsx';
import Subscribe from './Subscribe/Subscribe.jsx';
import Login from './Login/Login';
import Footer from './Footer/Footer';
import { Router, Route } from 'react-router-dom';
import History from '../components/History/History';
// import SettingsTab from './Settings/Subscribe.jsx';

export default class App extends React.Component {
  render() {
    return (
      <Container>
        <Router history={History}>
          <Route exact path="/" component={Home}/>
          <Route path="/subscribe" component={Subscribe}/>
          <Route path="/login" component={Login}/>
          <Footer/>
        </Router>
      </Container>
    )
  }
}
