import styled from 'styled-components';

export const Container = styled.div`
  height: 100px;
  top: 0;
  background-color: white;
`;

export const Elements = styled.div`
  width: 100%;
  height: 100%;
  margin-left: auto;
  margin-right: auto;
`;

export const Logo = styled.div`
  float: left;
  width: 60px;
  height: 60px;
  margin-left: 20px;
  margin-top: 20px;
  background-image: url(${process.env.PUBLIC_URL + "logo-split.png"});
  background-position: top left;
  background-size: contain;

  &:hover {
    cursor: pointer;
  }
`;

export const MenuTab = styled.div`
  margin-top: 20px;
  margin-right: 40px;
  position: relative;
  float: right;
  display: inline-block;
  cursor: pointer;
  color: #FFFFFF;
  font-size: 24px;
  font-weight: 500;
  text-decoration: none;
`;

export const MenuTxt = styled.span`
    text-transform: none;
    font-size: 18px;
    font-weight: 600;
    padding: 8px 16px 8px 16px;
`;

export const Title = styled.div`
    float: left;
    margin-top: 10px;
    margin-left: 2px;
    font-size: 48px;
    font-weight: 600;

  &:hover {
    cursor: pointer;
  }
`;