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
} from '../Subscribe/Subscribe.styles';
import Button from '../../components/Button/Button';

export default class SignIn extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      email: "",
      password: "",
    };
  }

  render() {
    const { email, password } = this.state;
    return (
      <Container>
        <Login>
          <Title>Connexion</Title>
          <LoginForm onSubmit={this.handleSubmit}>
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
              <InputName>Mot de passe</InputName>
              <Input
                name="password"
                type="password"
                value={password}
                onChange={this.handleChange}
              />
            </InputContainer>
            <LoginButton>
              <Button type="submit" form={true}>Connexion</Button>
            </LoginButton>
          </LoginForm>
          <AlreadySignUp>Pas encore inscrit ? <SignUpLink to={'/subscribe'}>Inscrivez-vous ici</SignUpLink></AlreadySignUp>
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
