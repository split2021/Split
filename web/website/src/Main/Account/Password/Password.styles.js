import styled from 'styled-components';

export const Container = styled.div`
  color: #5570dd;
  width: 100%;
  top: 0px;
  min-height: calc(100% - 280px);
`;

export const Login = styled.div`
  margin: 120px auto 40px;
  width: 600px;
  background-color: white;
  border-radius: 6px;
  box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
`;


export const Title = styled.div`
  margin-top: 150px;
  margin-left: 40px;
  margin-bottom: 40px;
  text-align: left;
  font-size: 30px;
`;

export const Tab = styled.div`
  margin-top: 100px;
  max-width: 1140px;
  margin-left: auto;
  margin-right: auto;
  text-align: left;
`;

export const Case = styled.div`
  background-color: #5570dd;
  display: inline-block;
  width: 300px;
  height: 150px;
  margin: 40px;
  border-radius: 6px;
  cursor: pointer;
  box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
`;

export const CaseBackground = styled.div`
  width: 100%;
  height: 70%;
  background-color: #5EADDE;
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
`;


export const InputName = styled.span`
  color: #333333;
  font-size: 16px;
  font-weight: 600;
  line-height: 1.5;
  padding-left: 7px;
`;

export const LoginForm = styled.form`
  margin: auto;
  width: 80%;
`;


export const LoginButton = styled.div`
  width: min-content;
  margin-left: auto;
  margin-right: auto;
  padding-bottom: 25px;
  padding-top: 25px;
`;

export const InputContainer = styled.div`
  display: inline-block;
  width: ${props => props.name === "nom" ? '213px' : '450px'};
  margin-right: 2.5%;
  margin-left: 2.5%;
  margin-bottom: 10px;
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
