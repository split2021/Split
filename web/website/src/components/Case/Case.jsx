import * as React from 'react';
import { Container, CaseNumber, CaseTitle, Span } from './Case.styles';

const Case = ({onClick, Title, Number}) => {

  return (
    <Container onClick={onClick}>
      <CaseNumber>
        <Span>{Number}</Span>
      </CaseNumber>
      <CaseTitle>
        <Span>{Title}</Span>
      </CaseTitle>
    </Container>
  )
};

export default Case;