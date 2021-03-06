import React from 'react';
import { Container } from './Main.styles.js';
import Home from './Home/Home.jsx';
import Subscribe from './Subscribe/Subscribe.jsx';
import Login from './Login/Login';
import Footer from './Footer/Footer';
import Account from './Account/Account';
import Amis from './Account/Amis/Amis';
import Groupes from './Account/Groupes/Groupes';
import { Router, Route } from 'react-router-dom';
import History from '../components/History/History';
import ReactNotification from 'react-notifications-component';
import 'react-notifications-component/dist/theme.css';
import { ThemeProvider } from "@material-ui/core";
import theme from '../components/Theme/Theme';
import Header from './Header/Header';
import Siderbar from "./Account/Dashboard/siderbar";
import GroupsUsers from './Account/Groupes/GroupsUsers';
import Dates from "./Account/Dashboard/Date";
import FriendLists from "./Account/Dashboard/FriendLists";
import MobilePage from '../components/MobilePages/Result';


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
            <Route path="/groupsUsers" component={GroupsUsers}/>
            <Route path="/siderbar" component={Siderbar} />
            <Route path="/dates" component={Dates} />
            <Route path="/friendLists" component={FriendLists}/>
            <Route path="/result" component={MobilePage}/>
            <Footer/>
          </Router>
        </Container>
      </ThemeProvider>
    )
  }
}
