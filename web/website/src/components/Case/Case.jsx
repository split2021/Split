import * as React from 'react';
import { Container, CaseBackground, CaseTitle } from './Case.styles';

const Case = ({onClick, Title, Background}) => {

  return (
    <Container onClick={onClick}>
      <CaseBackground style={{backgroundImage: `url(${Background})`}}/>
      <CaseTitle>
          {Title}
      </CaseTitle>
    </Container>
  )
};

export default Case;