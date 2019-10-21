import * as React from 'react';
import { Container, Text } from './Button.styles';

export default class Button extends React.Component {
  render() {
    return (
      <Container form={this.props.form} onClick={this.props.onclick}>
        <Text children={this.props.children}/>
      </Container>
    )
  }
};