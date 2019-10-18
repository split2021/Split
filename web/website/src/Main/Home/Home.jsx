import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {
  Container,
  Block,
  Title,
  Text,
  Devise,
  DeviseTxt,
  Animation,
  Phone,
  Terminal,
} from './Home.styles.js';
import {
  faCheck,
  faMobileAlt,
  faRocket
} from '@fortawesome/free-solid-svg-icons';
import Button from '../../components/Button/Button';
import Trombi from '../../components/Trombi/Trombi'

export default class Home extends React.Component {
  constructor(props) {
    super(props);
    this.myRef = React.createRef();
    this.animRef = React.createRef();
    this.handleScroll = this.handleScroll.bind(this);
    this.discover = this.discover.bind(this);
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
    if (this.myRef && this.myRef.current && - this.myRef.current.getBoundingClientRect().y < 450) {
      this.setState({scroll : -this.myRef.current.getBoundingClientRect().y});
    }
  }

  discover() {
    if (this.animRef) {
      this.animRef.current.scrollIntoView({
        behavior: 'smooth',
        block: 'start',
      });
    }
  }

  render() {
    return (
      <Container ref={this.myRef}>

        <Block first={true}>
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
          <Button onclick={this.discover}>Découvrir</Button>
        </Block>

        <Animation ref={this.animRef}>
          <Phone right={this.state.scroll} src={process.env.PUBLIC_URL + 'phone.png'}/>
          <Terminal left={this.state.scroll} src={process.env.PUBLIC_URL + 'terminal.png'}/>
        </Animation>

        <Block>
          <Title>Un projet Epitech</Title>
          <Text>Split est un projet de fin d’études Epitech ayant pour but de faciliter les paiements à plusieurs sans avoir à faire de pot commun.</Text>
        </Block>

        <Block>
          <Title>Notre équipe</Title>
          <Trombi/>
        </Block>

        <Block contact={true}>
          <Title>Contact</Title>
          <Title contact={true}>Retrouvez nous dans les locaux d'Epitech</Title>
          <Text>24 Rue Pasteur, 94270 Le Kremlin-Bicêtre, France</Text>
          <Title contact={true}>Contactez nous directement</Title>
          <Text>contact@split-pay.fr</Text>
        </Block>
      </Container>
    )
  }
}
