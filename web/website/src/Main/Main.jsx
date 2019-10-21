import React from 'react';
import { Container } from './Main.styles.js';
import Header from './Header/Header';
import Home from './Home/Home.jsx';
import Subscribe from './Subscribe/Subscribe.jsx';
import Login from './Login/Login';
import Footer from './Footer/Footer';
import { BrowserRouter as Router, Route } from 'react-router-dom';
// import SettingsTab from './Settings/Subscribe.jsx';

export default class App extends React.Component {
  render() {
    return (
      <Container>
        <Router>
          <Header/>
          <Route exact path="/" component={Home}/>
          <Route path="/subscribe" component={Subscribe}/>
          <Route path="/login" component={Login}/>
          <Footer/>
        </Router>
      </Container>
    )
  }
}
