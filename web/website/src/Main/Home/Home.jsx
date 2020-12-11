import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import "react-responsive-carousel/lib/styles/carousel.min.css";
import { Carousel } from 'react-responsive-carousel';
import {
  Container,
  Block,
  Title,
  SubTitle,
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
  TwoText,
  Picture,
  Covid,
  CovidTitle,
  CovidText
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
          <SubTitle>Un projet Epitech</SubTitle>
          <TwoElements>
            <Sliders>
              <Carousel showThumbs={ false } showIndicators={ false } showStatus={ false } autoPlay={ true }>
                <div>
                  <img alt={''} src={ process.env.PUBLIC_URL + 'X - 6.png' } />
                </div>
                <div>
                  <img alt={''} src={ process.env.PUBLIC_URL + 'X - 7.png' } />
                </div>
                <div>
                  <img alt={''} src={ process.env.PUBLIC_URL + 'X - 8.png' } />
                </div>
                <div>
                  <img alt={''} src={ process.env.PUBLIC_URL + 'X - 9.png' } />
                </div>
                <div>
                  <img alt={''} src={ process.env.PUBLIC_URL + 'X - 10.png' } />
                </div>
                <div>
                  <img alt={''} src={ process.env.PUBLIC_URL + 'X - 5.png' } />
                </div>
                <div>
                  <img alt={''} src={ process.env.PUBLIC_URL + 'X - 11.png' } />
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
          <Block>
            <SubTitle>Une application pensée pour vous</SubTitle>
            <TwoElements>
              <Text left={ true }>En premier lieu chaque membre d’un groupe créera un compte sur notre application et ils ajouteront leurs informations de paiement. Ensuite un de ces membres rajoutera ces derniers dans un groupe sur l’application crée pour les paiements à venir. Lorsque le groupe doit payer une addition, seul un de ces membres se présentera pour payer avec notre application. Enfin celle-ci répartira équitablement les frais entre les individus qui valideront le paiement</Text>
              <Picture src={ process.env.PUBLIC_URL + 'resto.jpg' } />
            </TwoElements>
          </Block>
        </div>

        <Covid>
          <CovidTitle>Info covid : </CovidTitle>
          <CovidText>Avec le COVID permettre à un groupe entier de payer uniquement avec 1 intermédiaire aide à réduire les risques de propagation</CovidText>
        </Covid>

        <Block Trombi={true}>
          <SubTitle>Notre équipe</SubTitle>
          <Trombi/>
        </Block>

        <Block contact={true}>
          <Title>Contact</Title>
          <Title contact={true}>Retrouvez nous dans les locaux d'Epitech</Title>
          <TextContact><a style={ { textDecoration: 'none', color: 'white' } } target="_blank" rel="noopener noreferrer" href="https://www.google.fr/maps/place/24+Rue+Pasteur,+94270+Le+Kremlin-Bicêtre/@48.8153291,2.360979,17z/data=!3m1!4b1!4m5!3m4!1s0x47e6717ff94e4521:0x24f4c7dfecbb39c3!8m2!3d48.8153291!4d2.3631677">
            24 Rue Pasteur, 94270 Le Kremlin-Bicêtre, France</a></TextContact>
          <Title contact={true}>Contactez nous directement</Title>
          <TextContact><a style={ { textDecoration: 'none', color: 'white' } } target="_blank" rel="noopener noreferrer" href="mailto:split_2021@labeip.epitech.eu">
            split_2021@labeip.epitech.eu</a></TextContact>
        </Block>
      </Container>
    )
  }
}
