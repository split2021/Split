import styled from 'styled-components';
import Button from '../../components/Button/Button';

export const Container = styled.div`
  color: #5570dd;
  width: 100%;
`;

export const Animation = styled.div`
  text-align: center;
  width: 100%;
  height: 400px;
`;

export const Terminal = styled.img`
  position: relative;
  width: 400px;
  height: auto;
  object-fit: contain;
  filter: drop-shadow(0px 0px 16px #000000);
  margin-left: calc(-1400px + ${props => props.left ? props.left : 0}px);
  z-index: 10;
`;

export const Phone = styled.img`
  position: relative;
  width: 400px;
  height: auto;
  filter: drop-shadow(0px 0px 16px #777777);
  margin-right: ${props => props.right ? props.right : 0}px;
  object-fit: contain;
  z-index: 20;
`;

export const Block = styled.div`
  margin: 90px auto;
  max-width: 1120px;
  width: 100%;
  border-radius: 6px;
  background-color: white;
  text-align: center;
  padding-top: 5%;
  padding-bottom: 5%;
  box-shadow: 0px 0px 100px 0px #efefef;
`;

export const Title = styled.div`
  font-size: 30px;
  font-weight: 700;
`;

export const Text = styled.div`
  font-size: 20px;
  font-weight: 500;
  margin-top: 30px;
  width: 60%;
  margin-left: 20%;
`;

export const Devise = styled.div`
  padding: 10px;
  margin-top: 60px;
  margin-bottom: 60px;
  display: inline-block;
  width: 30%;
`;

export const DeviseTxt = styled.div`
  padding: 20px;
  font-size: 18px;
  font-weight: 700;
  opacity: 0.9;
  color: #5570dd;
`;

export const Discover = styled(Button)`
  margin-left: auto;
  margin-right: auto;
`;
