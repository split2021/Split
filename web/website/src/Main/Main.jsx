import React from 'react';
import { Container } from './Main.styles.js';
import Header from './Header/Header';
import Home from './Home/Home.jsx';
import SettingsTab from './Settings/Settings.jsx';

export default class App extends React.Component {
  render() {
    return (
      <Container>
        <Header/>
        <Home/>
      </Container>
    )
  }
}
