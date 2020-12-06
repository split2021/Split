import * as React from 'react';
import { ContainerBis, TextCaseTitle, Span } from './Case.styles';

const TextCase = ({onClick, Title, Number}) => {

  return (
    <ContainerBis onClick={onClick}>
      <TextCaseTitle>
        <Span>{Title}</Span>
      </TextCaseTitle>
    </ContainerBis>
  )
};

export default TextCase;