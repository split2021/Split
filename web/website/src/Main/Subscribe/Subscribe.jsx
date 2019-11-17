import React from 'react';
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
import Button from '../../components/Button/Button';
import Header from '../Header/Header';

export default class Subscribe extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      nom: "",
      prenom: "",
      email: "",
      phone: "",
      password: "",
      passwordBis: "",
    };
  }

  request = (call, data) => {
    let header = {
    Accept: 'application/json',
    'Content-Type': 'application/json',
    };
    if (call === 'users/') {
      header = {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + this.state.token,
      };
    }
    let requestOptions = {
      method: 'POST',
      headers: header,
      body: JSON.stringify(data),
      redirect: 'follow'
    };
    fetch('http://52.178.136.18:443/api/' + call, requestOptions)
        .then(response => response.json())
        .then(result => this.setState({data: result, isLoading: false}))
        .catch(error => this.setState({error, isLoading: false}));
  };

  componentDidMount() {
    this.setState({ isLoading: true });
    let data = {
      email: 'test@split.fr',
      password: '93BaqTWsM0GH',
    };
    this.request('login', data);
  }

  componentDidUpdate(prevState, prevProps) {
    if (prevProps.data !== this.state.data) {
      this.setState({token: this.state.data.data.token});
      if (this.state.data.statuscode === 201) {
        this.props.history.push('/login');
      } else if (this.state.data.statuscode !== 200) {
        console.log(this.state.data.statuscode, this.state.data.reason);
        if (this.state.error) console.log(this.state.error);
      }
    }
  }

  subscribe = () => {
    this.setState({ isLoading: true });
    let data = {
      email: this.state.email,
      password: this.state.password,
      username: this.state.prenom,
      first_name: this.state.prenom,
      last_name: this.state.nom,
      phone: this.state.phone,
    };
    this.request('users/', data);
  };

  render() {
    const { nom, prenom, email, phone, password, passwordBis } = this.state;
    return (
      <Container>
        <Header {...this.props}/>
        <Login>
          <Title>Inscription</Title>
          <LoginForm onSubmit={this.handleSubmit}>
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
              <Button type="submit" form={true}>Inscription</Button>
            </LoginButton>
          </LoginForm>
          <AlreadySignUp>Déjà inscrit ? <SignUpLink to={'/login'}>Connectez-vous ici</SignUpLink></AlreadySignUp>
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
        && !this.state.isLoading
        && this.state.token) {
      this.subscribe();
    }
  };
}
