import styled from 'styled-components';

export const Container = styled.button`
  width: ${props => props.form ? '450px' : '150px'};
  height: 45px;
  border: none;
  border-radius: 24px;
  box-shadow: 0 4px 32px 0 #cecece;
  background-color: #5570dd;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  color: #ffffff;
  cursor: pointer;
  outline: none;
  position: relative;
  margin-left: auto;
  margin-right: auto;
 
  &::before {
    display:block;
    position: absolute;
    left: 0px;
    right: 0px;
    top: 0px;
    bottom: 0px;
    content: "";
    border-radius: 24px;
    background-color: #5570dd;
    transition: 0.1s linear;
    z-index: 5;
  }
  
  &:hover {
    &::before {
      left: -3px;
      right: -3px;
      top: -3px;
      bottom: -3px;
      transition: 0.1s linear;
    }
  }
`;

export const Text = styled.span`
  position: relative;
  z-index: 10;
`;