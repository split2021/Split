import React from 'react';
import API from '../../components/Api/Api';
import Cookies from 'universal-cookie';
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
import Header from '../Header/Header';


export default class SignIn extends React.Component {

  constructor(props) {
    super(props);
    this.cookies = new Cookies();
    this.state = {
      email: "",
      password: "",
    };
  }

  componentDidMount() {
    if ( this.cookies !== undefined && (this.cookies.get('auth')) !== undefined) {
      this.props.history.push('/account');
    }
  }

  componentDidUpdate(prevState, prevProps) {
    if (prevProps.data !== this.state.data) {
      if (this.state.data.statuscode === 200) {
        this.cookies.set('auth', this.state.data.data.token, { path: '/', maxAge: 3540});
        this.props.history.push('/account');
      } else {
        console.log(this.state.data.statuscode, this.state.data.reason);
        if (this.state.error) console.log(this.state.error);
      }
    }
  }

  request = (call, data) => {
    let header = {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
    };
    API.post(call, JSON.stringify(data), {headers: header})
        .then(response => this.setState({data: response.data, isLoading: false}))
        .catch(error => this.setState({error, isLoading: false}));
  };

  render() {
    const { email, password } = this.state;
    return (
      <Container>
        <Header {...this.props}/>
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

  handleChange = (event) => {
    this.setState({
      [event.target.name]: event.target.value
    });
  };

  handleSubmit = (event) => {
    event.preventDefault();
    this.setState({ isLoading: true });
    let data = {
      email: this.state.email,
      password: this.state.password,
    };
    this.request('login', data);
  };
}
