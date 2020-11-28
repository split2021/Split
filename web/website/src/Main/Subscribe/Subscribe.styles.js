import styled from 'styled-components';
import { Link } from 'react-router-dom';

export const Container = styled.div`
  color: ##556DFF;
  width: 100%;
  min-height: calc(100% - 250px);
`;

export const Login = styled.div`
  margin: 0px auto 40px;
  width: 600px;
  background-color: white;
  border-radius: 6px;
  box-shadow: 0px 2px 8px rgba(17, 17, 29, 0.12);
  border: 1px solid #E9E7EB;
`;

export const Title = styled.div`
  width: 100%;
  text-align: center;
  padding-top: 100px;
  padding-bottom: 20px;
  font-size: 42px;
  font-weight: 800;
`;

export const LoginForm = styled.form`
  margin: auto auto 100px auto;
  width: 80%;
`;

export const InputContainer = styled.div`
  display: inline-block;
  width: ${props => props.name === "nom" ? '213px' : '450px'};
  margin-right: 2.5%;
  margin-left: 2.5%;
  margin-bottom: 10px;
`;

export const InputName = styled.span`
  color: #333333;
  font-size: 16px;
  font-weight: 600;
  line-height: 1.5;
  padding-left: 7px;
`;

export const Input = styled.input`
  line-height: 1.2;
  font-size: 16px;
  color: #333333;
  font-weight: 600;
  display: block;
  width: calc(100% - 36px);
  margin-top: 6px;
  margin-left: auto;
  margin-right: auto;
  height: 45px;
  background: #f7f7f7;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 22.5px;
  padding: 0 17px 0 17px;
  outline: none;
  transition: all 0.2s linear;
  
  &:focus {
    border: 1px solid rgba(0, 0, 0, 0.4);;
  }
`;

export const LoginButton = styled.div`
  margin-left: 2.5%;
  margin-right: 2.5%;
  padding-bottom: 25px;
  padding-top: 25px;
`;

export const AlreadySignUp = styled.div`
  margin-left: auto;
  margin-right: auto;
  width: 100%;
  text-align: center;
  padding-bottom: 50px;
`;

export const SignUpLink = styled(Link)`
`;