import * as React from 'react';
import People from './People/People';
import { Container } from './Trombi.styles';

export default class Trombi extends React.Component {
  render() {
    return (
      <Container>
        <People
          Img={process.env.PUBLIC_URL + 'tiphaine.jpg'}
          Name={'Tiphaine Laurent'}
          Job={'ETUDIANT EPITECH'}
        />
        <People
          Img={process.env.PUBLIC_URL + 'nicolas.jpg'}
          Name={'Nicolas Djurovic'}
          Job={'ETUDIANT EPITECH'}
        />
        <People
          Img={process.env.PUBLIC_URL + 'Matthieu.png'}
          Name={'Matthieu Lachenait'}
          Job={'ETUDIANT EPITECH'}
        />
        <People
          Img={process.env.PUBLIC_URL + 'alex.jpg'}
          Name={'Alex Sauvade'}
          Job={'ETUDIANT EPITECH'}
        />
        <People
          Img={process.env.PUBLIC_URL + 'hugo.jpg'}
          Name={'Hugo Martin'}
          Job={'ETUDIANT EPITECH'}
        />
        <People
          Img={process.env.PUBLIC_URL + 'valentin.jpg'}
          Name={'Valentin Rubio'}
          Job={'ETUDIANT EPITECH'}
        />
        <People
          Img={process.env.PUBLIC_URL + 'thibault.jpg'}
          Name={'Thibault Lecointe'}
          Job={'ETUDIANT EPITECH'}
        />
      </Container>
    )
  }
};