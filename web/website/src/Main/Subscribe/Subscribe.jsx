import React from 'react';
import Request from '../../components/Api/Request';
import Notification from '../../components/Notification/Notification';
import AdminData from '../../components/Api/AdminData';
import {
  Container,
  Login,
  Title,
  LoginForm,
  InputContainer,
  InputName,
  Input,
  LoginButton,
  AlreadySignUp,
  SignUpLink,
} from './Subscribe.styles.js';
import Button from '@material-ui/core/Button';
import CircularProgress from '@material-ui/core/CircularProgress';

export default class Subscribe extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      nom: "",
      prenom: "",
      username: "",
      email: "",
      phone: "",
      password: "",
      passwordBis: "",
      isLoading: false,
      connectedDb: !!localStorage.getItem('adminData'),
    };
  }

  componentDidUpdate(prevState, prevProps) {
    if (prevProps.data !== this.state.data) {

      switch (this.state.data.statuscode) {
        case 200:
          this.setState({token: this.state.data.data.token});
          this.setState({connectedDb: true});
          localStorage.setItem('adminData', JSON.stringify(this.state.data.data));
          break;

        case 201:
          this.props.history.push('/login');
          Notification('success', '', 'Votre compte a bien été créé !');
          break;

        case 400:
          console.log(this.state.data.statuscode, this.state.data.reason);
          Notification('danger', '', 'Erreur de requête veuillez contacter le support.');
          break;

        default:
          Notification('danger', '', this.state.connectedDb ?
              'Informations incorrectes ou compte déjà existant': 'API hors ligne, veuillez reesayer plus tard.');
          console.log(this.state.data.statuscode, this.state.data.reason);
          if (this.state.error) console.log(this.state.error);
          break;
      }
    }
  }

  async subscribe() {
    let data = {
      email: this.state.email,
      password: this.state.password,
      username: this.state.username,
      first_name: this.state.prenom,
      last_name: this.state.nom,
      phone: this.state.phone,
    };
    this.setState({ isLoading: true });
    this.setState( await Request('login', AdminData));
    if (this.state.data.data.token){
      this.setState( await Request('users/', data, this.state.data.data.token));
    }
    this.setState({ isLoading: false });
  };

  render() {
    const { username, nom, prenom, email, phone, password, passwordBis } = this.state;
    return (
      <Container>
        <Login>
          <Title>Inscription</Title>
          <AlreadySignUp>Déjà inscrit ? <SignUpLink to={'/login'}>Connectez-vous ici</SignUpLink></AlreadySignUp>
          <LoginForm onSubmit={this.handleSubmit}>
            <InputContainer>
              <InputName>Username</InputName>
              <Input
                name="username"
                type="text"
                value={username}
                onChange={this.handleChange}
              />
            </InputContainer>
            <InputContainer name={"nom"}>
              <InputName>Nom</InputName>
              <Input
                name="nom"
                type="text"
                value={nom}
                onChange={this.handleChange}
              />
            </InputContainer>
            <InputContainer name={"nom"}>
              <InputName>Prénom</InputName>
              <Input
                name="prenom"
                type="text"
                value={prenom}
                onChange={this.handleChange}
              />
            </InputContainer>
            <InputContainer>
              <InputName>Email</InputName>
              <Input
                name="email"
                type="text"
                value={email}
                onChange={this.handleChange}
              />
            </InputContainer>
            <InputContainer>
              <InputName>Téléphone</InputName>
              <Input
                name="phone"
                type="number"
                min="0"
                max="9999999999"
                value={phone}
                onChange={this.handleChange}
              />
            </InputContainer>
            <InputContainer>
              <InputName>Mot de passe</InputName>
              <Input
                name="password"
                type="password"
                value={password}
                onChange={this.handleChange}
              />
            </InputContainer>
            <InputContainer>
              <InputName>Confirmation mot de passe</InputName>
              <Input
                name="passwordBis"
                type="password"
                value={passwordBis}
                onChange={this.handleChange}
              />
            </InputContainer>
            <LoginButton>
              <Button style={{
                borderRadius: '30px',
                width: this.state.isLoading ? 'calc(100% - 86px)' : 'calc(100% - 6px)',
                transitionDuration: '1s',
                left: '0px',
                height: '45px',
                textTransform: 'none',
                fontWeight: '600',
                fontSize: '18px',
                float: 'left'
              }}
                      variant="contained"
                      color="primary"
                      type="submit"
                      form={true}
                      disabled={this.state.isLoading}
              >
                Inscription
              </Button>
              {this.state.isLoading && <CircularProgress style={{float: 'left', marginLeft: '20px'}} />}
            </LoginButton>
          </LoginForm>
        </Login>
      </Container>
    )
  }

  handleChange = (event) => {
    this.setState({
      [event.target.name]: event.target.value
    });
  };

  handleSubmit = (event) => {
    event.preventDefault();
    let fieldEmpty = false;
    for (let key in this.state) {
      if (this.state[key] === '') {
        fieldEmpty = true;
      }
    }
    if (!fieldEmpty
        && this.state.password === this.state.passwordBis
        && !this.state.isLoading) {
      this.subscribe();
    }
  };
}
