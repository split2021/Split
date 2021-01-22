import React from 'react';
import Case from '../../components/Case/Case';
import TextCase from '../../components/Case/TextCase';
import Cookies from 'universal-cookie';
import {
  Tab,
  Container,
  Title,
  Icon,
  //HistoryList,
  FlexContainer,
  Tableau,
} from './Account.styles.js';
import History from "./History/History";
import {
  Collumn,
  Collumns,
  //Goback
} from "./Global.styles";

export default class SettingsTab extends React.Component {

  constructor(props) {
    super(props);
    this.cookies = new Cookies();
    if (this.cookies !== undefined && (this.cookies.get('auth')) !== undefined) {
      console.log('cookie présent');
      this.state = {
        connected: true,
        token: this.cookies.cookies.auth,
        data: JSON.parse(localStorage.getItem('userData')) || '',
      };
    } else {
      console.log('cookie non présent');
      this.handleRedirect('/');
    }
  }

  handleRedirect(direction) {
    this.props.history.push(direction);
  }

  render() {
    if (this.state) {
      return (
        <Container>
          <Tab>
            <Icon/>
            <Title>{this.state.data.user.first_name + ' ' + this.state.data.user.last_name}</Title>
            <FlexContainer>
              <Case
                onClick={() => this.handleRedirect('/amis')}
                Title={'Amis'}
                Number={this.state.data.user.friends_count}
              />
              <Case
                onClick={() => this.handleRedirect('/groupes')}
                Title={'Groupes'}
                Number={this.state.data.user.payment_groups.length}
              />
            </FlexContainer>
            <TextCase
              onClick={() => this.handleRedirect('/siderbar')}
              Title={'Mes statistiques'}
            />
          </Tab>
          <Title>Mes derniers paiements</Title>
          <div style={ { overflow: 'auto' } }>
            <Tableau>
              <Collumns>
                <Collumn>Mes paiements</Collumn>
                {/*<Collumn>Nb de personne (montant de chaque participant)</Collumn>*/}
              </Collumns>
              <History />
            </Tableau>
          </div>
        </Container>
      );
    } else {
      return '';
    }
  }
}
