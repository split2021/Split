import styled from 'styled-components';
import Menu from '../../components/Menu/Menu';
import { Link } from 'react-router-dom';

export const Container = styled.div`
  width: 100%;
  height: 60px;
  background-color: #5570dd;
  display: inline-block;
  position: fixed;
  top: 0;
  z-index: 100;
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
`;

export const Elements = styled.div`
  width: 100%;
  max-width: 1120px;
  height: 100%;
  margin-left: auto;
  margin-right: auto;
`;

export const Logo = styled(Link)`
  float: left;
  width: 40px;
  height: 40px;
  margin-left: 20px;
  margin-top: 10px;
  background-image: url(${process.env.PUBLIC_URL + "logo-split.png"});
  background-position: top left;
  background-size: contain;
`;

export const MenuTab = styled(Menu)`
`;