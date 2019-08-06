import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {
  Container,
  Block,
  Title,
  Text,
  Devise,
  DeviseTxt,
  Discover,
  Animation,
  Phone,
  Terminal,
} from './Home.styles.js';
import {
  faCheck,
  faMobileAlt,
  faRocket
} from '@fortawesome/free-solid-svg-icons';

export default class Home extends React.Component {
  constructor(props) {
    super(props);
    this.myRef = React.createRef();
    this.handleScroll = this.handleScroll.bind(this);
    this.state = {
      scroll : 0,
    };
  }

  componentDidMount() {
    window.addEventListener('scroll', this.handleScroll, true);
  }

  componentWillUnmount() {
    window.removeEventListener('scroll', this.handleScroll);
  }

  handleScroll() {
    if (this.myRef && -this.myRef.current.getBoundingClientRect().y + 90 < 450) {
      this.setState({scroll : -this.myRef.current.getBoundingClientRect().y + 90});
    }
  }

  render() {
    return (
      <Container ref={this.myRef}>

        <Block>
          <Title>Le paiement à plusieurs repensé</Title>
          <Text>Le service le plus rapide pour diviser les paiements en groupe</Text>
          <Devise>
            <FontAwesomeIcon icon={faMobileAlt} size="3x" color="#e51d1d" />
            <DeviseTxt>Payez en 3 cliques</DeviseTxt>
          </Devise>
          <Devise>
            <FontAwesomeIcon icon={faCheck} size="3x" color="#00bcd4" />
            <DeviseTxt>Un service toujours fonctionnel</DeviseTxt>
          </Devise>
          <Devise>
            <FontAwesomeIcon icon={faRocket} size="3x" color="#4caf50" />
            <DeviseTxt>Aucune attente de paiement</DeviseTxt>
          </Devise>
          <Discover>Découvrir</Discover>
        </Block>
        <Animation>
          <Phone right={this.state.scroll} src={process.env.PUBLIC_URL + 'phone.png'}/>
          <Terminal left={this.state.scroll} src={process.env.PUBLIC_URL + 'terminal.png'}/>
        </Animation>

        <Block>
          <Title>Un projet Epitech</Title>
          <Text>Split est un projet de fin d’études Epitech ayant pour but de faciliter les paiements à plusieurs sans avoir à faire de pot commun.</Text>
        </Block>

        <Block>
          <Title>Notre équipe</Title>
        </Block>

        <Block>
          <Title>Contact</Title>
        </Block>
      </Container>
    )
  }
}
