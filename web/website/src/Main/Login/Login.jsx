import React from 'react';
import Request from '../../components/Api/Request';
import Notification from '../../components/Notification/Notification';
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
import Button from '@material-ui/core/Button';
import CircularProgress from '@material-ui/core/CircularProgress';
import AdminData from '../../components/Api/AdminData';


export default class SignIn extends React.Component {

  constructor(props) {
    super(props);
    this.cookies = new Cookies();
    this.state = {
      email: "",
      password: "",
      isLoading: false,
      connectedDb: false,
    };
  }

  componentDidMount() {
    if ( this.cookies !== undefined && (this.cookies.get('auth')) !== undefined) {
      this.props.history.push('/account');
    }
  }

  componentDidUpdate(prevState, prevProps) {
    if (prevProps.data !== this.state.data) {
      switch (this.state.data.statuscode) {
        case 200:
          if (this.state.connectedDb) {
            Notification('success', '', 'Connexion effectuée !');
            this.cookies.set('auth', this.state.data.data.token, { path: '/', maxAge: 3540});
            localStorage.setItem('userData', JSON.stringify(this.state.data.data));
            this.props.history.push('/account');
          } else {
            this.setState({connectedDb: true});
            localStorage.setItem('adminData', JSON.stringify(this.state.data.data));
          }
          break;

        case 400:
          console.log(this.state.data.statuscode, this.state.data.reason);
          Notification('danger', '', 'Erreur de requête veuillez contacter le support.');
          break;

        default:
          Notification('danger', '', this.state.connectedDb ?
            'Mauvais email ou mot de passe !': 'API hors ligne, veuillez reesayer plus tard.');
          console.log(this.state.data.statuscode, this.state.data.reason);
          if (this.state.error) console.log(this.state.error);
          break;
      }
    }
  }

  render() {
    const { email, password } = this.state;
    return (
      <Container>
        <Login>
          <Title>Connexion</Title>
          <AlreadySignUp>Pas encore inscrit ? <SignUpLink to={'/subscribe'}>
            Inscrivez-vous ici
          </SignUpLink></AlreadySignUp>
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
              <Button style={{
                borderRadius: '30px',
                width: this.state.isLoading ? 'calc(100% - 76px)' : 'calc(100% - 6px)',
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
                Connexion
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

  handleSubmit = async(event) => {
    event.preventDefault();
    this.setState({ isLoading: true });
    let data = {
      email: this.state.email,
      password: this.state.password,
    };
    this.setState( await Request('login', AdminData, '', 'post'));
    if (this.state.data.data && this.state.data.data.token) {
      this.setState(await Request('login', data, '', 'post'));
    }
    this.setState({ isLoading: false });
  };
}
