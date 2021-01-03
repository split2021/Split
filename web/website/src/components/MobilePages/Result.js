import React from 'react';
import queryString from 'query-string';
import {
  Container,
  Title,
  Message
} from './Result.styles';

export default class Result extends React.Component {
  render() {
    let url = this.props.location.search;
    let params = queryString.parse(url);
    console.log(params);
    return (
      <Container>
        <Title>{params.title || ''}</Title>
        <Message>{params.msg || ''}</Message>
      </Container>
    )
  }
}