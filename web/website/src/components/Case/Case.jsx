import * as React from 'react';
import { Container, CaseBackground, CaseTitle } from './Case.styles';

const Case = ({Title, Background}) => {
  return (
    <Container>
      <CaseBackground style={{backgroundImage: `url(${Background})`}}/>
      <CaseTitle>
          {Title}
      </CaseTitle>
    </Container>
  )
};

export default Case;