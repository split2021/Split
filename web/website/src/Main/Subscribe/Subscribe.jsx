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

  render() {
    const { nom, prenom, email, phone, password, passwordBis } = this.state;
    return (
      <Container>
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

  handleChange = event => {
    this.setState({
      [event.target.name]: event.target.value
    });
  };

  handleSubmit = () => {
    console.log("Submitting");
    console.log(this.state);
  };
}
