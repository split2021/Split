import React from 'react';
import API from '../../../components/Api/Api';
import Header from '../../Header/Header';

import Cookies from 'universal-cookie';
import Button from '../../../components/Button/Button';
import {
    Container,
    Login,
    Title,
    LoginButton,
    InputContainer,
    InputName,
    Input,
    LoginForm
} from '../Password/Password.styles.js';



export default class ChangePassword extends React.Component {
    constructor(props) {
        super(props);

        
        this.state = {
 
            password: "",
            passwordBis: "",
        };

        this.cookies = new Cookies();
        if (this.cookies !== undefined && (this.cookies.get('auth')) !== undefined) {
            console.log('cookie présent');
            this.state = {
                connected: true,
                token: this.cookies.cookies.auth,
            };
        } else {
            console.log('cookie non présent');
            this.handleRedirect('/');
        }
    }

    componentDidMount() {
        this.setState({ isLoading: true });
        let data = {
            email: 'split_2021@labeip.epitech.eu',
            password: 'X#9q@XCy7qy&',
        };
        this.request('login', data);
    }

    componentDidUpdate(prevState, prevProps) {
        if (prevProps.data !== this.state.data) {
            this.setState({ token: this.state.data.data.token });
             if (this.state.data.statuscode !== 200) {
                console.log(this.state.data.statuscode, this.state.data.reason);
                if (this.state.error) console.log(this.state.error);
            }
        }
    }

    /*componentDidUpdate(prevState, prevProps) {
        if (prevProps.data !== this.state.data) {
            this.setState({ token: this.state.data.data.token });
            console.log(this.state.data.statuscode, this.state.data.reason);
           //this.props.history.push('/account');
            if (this.state.error) console.log(this.state.error);
        }
    }*/

    subscribe = () => {
        this.setState({ isLoading: true });
        let data = {
            password: this.state.password,
        };
        this.request('users/2', data);
    };

    handleRedirect(direction) {
        this.props.history.push(direction);
    }

    request = (call, data) => {
        let header = {
            Accept: 'application/json',
            'Content-Type': 'application/json',
        };
        if (call === 'users/2') {
            header = {
                Accept: 'application/json',
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ' + this.state.token,
                'Access-Control-Allow-Origin': '*',
            };
            API.patch(call, JSON.stringify(data), { headers: header })
                .then(response => this.setState({ data: response.data, isLoading: false }))
                .catch(error => this.setState({ error, isLoading: false }));
        } else if (call === 'login') {
            API.post(call, JSON.stringify(data), { headers: header })
                .then(response => this.setState({ data: response.data, isLoading: false }))
                .catch(error => this.setState({ error, isLoading: false }));
        }

    };

    render() {
        const { password, passwordBis } = this.state;
        return (
            <Container>
                <Header {...this.props} />
                <Login>
                    <Title> Change Password </Title>
                    
                    <LoginForm onSubmit={this.handleSubmit}>

                    <InputContainer>
                        <InputName> Nouveau mot de passe </InputName>
                        <Input
                            name="password"
                            type="password"
                            value={password}
                            onChange={this.handleChange}
                         />
                    </InputContainer>

                        <InputContainer>
                            <InputName> Confirmation mot de passe </InputName>
                        <Input
                            name="passwordBis"
                            type="password"
                            value={passwordBis}
                            onChange={this.handleChange}
                         />
                    </InputContainer>
                        <LoginButton>
                          <Button type="submit" form={true}>Enregistrer</Button>
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
        console.log('bonjour');
    };


    handleSubmit = (event) => {
        if (this.state.password !== this.state.passwordBis) {
            alert('le mot de passe n est pas identique');
            this.setState({ isLoading: false });
        }
        else if (this.state.password.length < 8 && this.state.passwordBis < 8) {
            alert('8 characters minimum');
            this.setState({ isLoading: false });

        }

        else if (this.state.password === this.state.passwordBis) {
            event.preventDefault();
            this.setState({ isLoading: true });
            this.subscribe();
            this.props.history.push('/account');
        };
    };
}