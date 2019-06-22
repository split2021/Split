import * as React from 'react';
import { Container, Text } from './Button.styles';

const Button = ({ children }) => {
  return (
    <Container>
      <Text children={children}/>
    </Container>
  );
};

export default Button;