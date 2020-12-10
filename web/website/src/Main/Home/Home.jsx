import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import "react-responsive-carousel/lib/styles/carousel.min.css";
import { Carousel } from 'react-responsive-carousel';
import {
  Container,
  Block,
  Title,
  Text,
  TextContact,
  Devise,
  DeviseTxt,
  Animation,
  Phone,
  Terminal,
  BigText,
  Back,
  BtnText,
  Sliders,
  TwoElements,
  TwoText
} from './Home.styles.js';
import {
  faCheck,
  faMobileAlt,
  faRocket
} from '@fortawesome/free-solid-svg-icons';
import Button from '@material-ui/core/Button';
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

  handleClick(direction) {
    this.props.history.push(direction);
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
          <Title first={true}>Payer au restaurant n'a jamais été aussi rapide</Title>
          <Button
            style={{borderRadius: '30px'}}
            variant="contained"
            color="primary"
            onClick={ () => this.handleClick('/subscribe') }
          >
            <BtnText>Découvrir</BtnText>
          </Button>
          <Animation ref={this.animRef}>
            <Phone right={this.state.scroll} src={process.env.PUBLIC_URL + 'phone.png'}/>
            <Terminal left={this.state.scroll} src={process.env.PUBLIC_URL + 'terminal.png'}/>
          </Animation>

          <BigText>Le service le plus rapide pour diviser les paiements de groupe au restaurant</BigText>
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
        </Block>
        <Back />


        <Block>
          <Title>Un projet Epitech</Title>
          <TwoElements>
            <Sliders>
              <Carousel showThumbs={ false } showIndicators={ false } showStatus={ false } autoPlay={ true }>
                <div>
                  <img src={ process.env.PUBLIC_URL + 'X - 6.PNG' } />
                </div>
                <div>
                  <img src={ process.env.PUBLIC_URL + 'X - 7.PNG' } />
                </div>
                <div>
                  <img src={ process.env.PUBLIC_URL + 'X - 8.PNG' } />
                </div>
                <div>
                  <img src={ process.env.PUBLIC_URL + 'X - 9.PNG' } />
                </div>
                <div>
                  <img src={ process.env.PUBLIC_URL + 'X - 10.PNG' } />
                </div>
                <div>
                  <img src={ process.env.PUBLIC_URL + 'X - 5.PNG' } />
                </div>
                <div>
                  <img src={ process.env.PUBLIC_URL + 'X - 11.PNG' } />
                </div>
              </Carousel>
            </Sliders>
            <TwoText>
              <Text style={ { marginBottom: '30px' } }>L’application Split permettra à un groupe de personnes de diviser une addition au restaurant. Un seul membre du groupe se chargera de régler l'addition, et chaque personne sera débitée d'une somme équitable ou modulable individuellement. Il n’y a aucun système de cagnotte, ni de remboursement : le paiement sera effectué instantanément</Text>
              <Text>Les principaux concernés par notre application seront les personnes qui iront consommer dans des lieux de restauration. Également à l’avenir le champ d’action de notre application pourrait s’élargir à d’autres secteurs comme le divertissement, les activités sportives...</Text>
            </TwoText>
          </TwoElements>
        </Block>

        <div style={{backgroundColor: '#f6f6f8'}}>
          <Block Trombi={true}>
            <Title>Notre équipe</Title>
            <Trombi/>
          </Block>
        </div>

        <Block contact={true}>
          <Title>Contact</Title>
          <Title contact={true}>Retrouvez nous dans les locaux d'Epitech</Title>
          <TextContact>24 Rue Pasteur, 94270 Le Kremlin-Bicêtre, France</TextContact>
          <Title contact={true}>Contactez nous directement</Title>
          <TextContact>contact@split-pay.fr</TextContact>
        </Block>
      </Container>
    )
  }
}
