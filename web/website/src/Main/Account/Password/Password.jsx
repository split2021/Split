import React from 'react';
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
            };
        } else {
            console.log('cookie non présent');
            this.handleRedirect('/');
        }
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
            method: 'PATCH',
            headers: header,
            body: JSON.stringify(data),
            redirect: 'follow'
        };

        fetch('http://52.178.136.18:443/api/' + call, requestOptions)
            .then(response => response.json())
            .then(result => this.setState({ data: result, isLoading: false }))
            .catch(error => this.setState({ error, isLoading: false }));
    };


    componentDidUpdate(prevState, prevProps) {
        if (prevProps.data !== this.state.data) {
            console.log(this.state.data.statuscode, this.state.data.reason);
            //this.props.history.push('/account');
                if (this.state.error) console.log(this.state.error);
        }
    }

    subscribe = () => {
        this.setState({ isLoading: true });
        let data = {
            password: this.state.password,
        };
        this.request('users/', data);
    };

    handleRedirect(direction) {
        this.props.history.push(direction);
    }

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
        else if (this.state.password === this.state.passwordBis) {
            event.preventDefault();
            this.setState({ isLoading: true });
            let data = {
                password: this.state.password
            };
            console.log('hello');
            this.request('users/', data);
        };
    };
}