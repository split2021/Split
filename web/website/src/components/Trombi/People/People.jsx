import * as React from 'react';
import { Container, Profile, Title, Text } from './People.styles';

const People = ({ Img, Name, Job }) => {
  return (
    <Container>
      <Profile src={Img}/>
      <Title>
        {Name}
      </Title>
      <Text>
        {Job}
      </Text>
    </Container>
  );
};

export default People;