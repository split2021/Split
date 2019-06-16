import styled from 'styled-components';
import Button from '../../components/Button/Button';

export const Container = styled.div`
  width: 100%;
  padding-top: 16px;
`;

export const Explaination = styled.div`
  margin-left: auto;
  margin-right: auto;
  max-width: 1120px;
  width: 100%;
  border-radius: 6px;
  background-color: white;
  text-align: center;
  color: #5570dd;
  padding-top: 7%;
  padding-bottom: 7%;
  box-shadow: 0px 0px 100px 0px #efefef;
`;

export const Title = styled.div`
  font-size: 37px;
  font-weight: 700;
`;

export const Text = styled.div`
  padding-top: 10px;
  padding-bottom: 30px;
  opacity: 0.7;
`;

export const Devise = styled.div`
  padding: 10px;
  margin-top: 60px;
  margin-bottom: 90px;
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
