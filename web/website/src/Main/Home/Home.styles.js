import styled from 'styled-components';

export const Container = styled.div`
  color: #556DFF;
  width: 100%;
`;

export const Animation = styled.div`
  text-align: center;
  padding-top: 100px;
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
  display: block;
  margin: 0px auto;
  padding: ${props => props.first ? '100px 0px' : '100px 0px 100px'};
  max-width: ${props => props.Trombi || props.contact ? '100%' : '1120px'};
  width: 100%;
  color: ${props => props.contact ? 'white' : '#556DFF'};
  background-position: center;
  ${props => props.contact ? `background-image: url(${process.env.PUBLIC_URL + 'epitech-img.jpg'})` : 'background-color: transparent'};
  text-align: center;
`;

export const Title = styled.div`
  font-size: ${props => props.contact ? 20 : 80}px;
  font-weight: 700;
  margin-top: ${props => props.contact ? 40 : 0}px;
  margin-bottom: ${props => props.first ? '150px' : '10 0px'};
  
  @media (max-width: 768px) {
    font-size: 30px;
    margin-bottom: 20px;
  }
`;

export const Text = styled.div`
  font-size: 20px;
  font-weight: 700;
  margin-top: 30px;
  width: 60%;
  margin-left: 20%;
`;

export const BtnText = styled.div`
  font-size: 20px;
  font-weight: 600;
  padding: 8px 16px 8px 16px;
  text-transform: none;
`;

export const BigText = styled.div`
  font-size: 40px;
  font-weight: 600;
  margin-top: 30px;
  width: 60%;
  margin-left: 20%;
  
  @media (max-width: 768px) {
    font-size: 20px;
  }
`;

export const Devise = styled.div`
  padding: 10px;
  margin-top: 60px;
  margin-bottom: 60px;
  display: inline-block;
  width: 30%;
  
  @media (max-width: 768px) {
    margin-bottom: 0px;
  }
`;

export const DeviseTxt = styled.div`
  padding: 20px;
  font-size: 18px;
  font-weight: 700;
  opacity: 0.9;
  color: #5570dd;
`;

export const Back = styled.div`
  background-color: #f6f6f8;
  height: 700px;
  width: 100%;
  position: absolute;
  z-index: -1;
  margin-top: -700px;
  
  @media (max-width: 768px) {
    margin-top: -1000px;
    height: 1000px;w
  }
`;
