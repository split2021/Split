import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {
  Container,
  Explaination,
  Title,
  Text,
  Devise,
  DeviseTxt,
  Discover
} from './Home.styles.js';
import { faCheck, faMobileAlt, faRocket } from '@fortawesome/free-solid-svg-icons';

export default class Home extends React.Component {

  render() {
    return (
      <Container>
        <Explaination>
          <Title>Le paiement à plusieurs repensé</Title>
          <Text>Le service le plus rapide pour diviser les paiements en groupe</Text>
          <Devise>
            <FontAwesomeIcon icon={faMobileAlt} size="3x" color="#e51d1d" />
            <DeviseTxt>Payez en 3 cliques</DeviseTxt>
          </Devise>
          <Devise>
            <FontAwesomeIcon icon={faCheck} size="3x" color="#00bcd4" />
            <DeviseTxt>Un service toujours fonctionnel</DeviseTxt>
          </Devise>
          <Devise>
            <FontAwesomeIcon icon={faRocket} size="3x" color="#4caf50" />
            <DeviseTxt>Aucune attente de paiement</DeviseTxt>
          </Devise>
          <Discover>Découvrir</Discover>
        </Explaination>
      </Container>
    )
  }
}
