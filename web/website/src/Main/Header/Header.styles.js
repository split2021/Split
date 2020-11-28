import styled from 'styled-components';

export const Container = styled.div`
  height: 100px;
  top: 0;
  background-color: white;
  
  @media (max-width: 768px) {
    height: 260px;
  }
`;

export const Elements = styled.div`
  width: 100%;
  height: 100%;
  margin-left: auto;
  margin-right: auto;
  
  @media (max-width: 768px) {
    text-align: center;
  }
`;

export const Logo = styled.div`
  float: left;
  width: 60px;
  height: 60px;
  margin-left: 40px;
  margin-top: 20px;
  background-image: url(${process.env.PUBLIC_URL + "logo-split.png"});
  background-position: top left;
  background-size: contain;
  
  @media (max-width: 768px) {
    float: left;
    margin-left: 20px;
    margin-bottom: 40px;
  }

  &:hover {
    cursor: pointer;
  }
`;

export const Title = styled.div`
  float: left;
  height: 60px;
  margin-top: 10px;
  margin-left: 2px;
  font-size: 48px;
  font-weight: 600;

  &:hover {
    cursor: pointer;
  }
  
  @media (max-width: 768px) {
    float: left;
    margin-top: 8px;
  }
`;

export const MenuTab = styled.div`
  margin-top: 20px;
  margin-right: 40px;
  margin-left: 40px;
  position: relative;
  float: right;
  display: inline-block;
  cursor: pointer;
  color: #FFFFFF;
  font-size: 24px;
  font-weight: 500;
  text-decoration: none;
  
  @media (max-width: 768px) {
    float: none;
  }
`;

export const MenuTxt = styled.span`
    text-transform: none;
    font-size: 18px;
    font-weight: 600;
    padding: 8px 16px 8px 16px;
`;