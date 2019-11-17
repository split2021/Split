import styled from 'styled-components';

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

export const Logo = styled.div`
  float: left;
  width: 40px;
  height: 40px;
  margin-left: 20px;
  margin-top: 10px;
  background-image: url(${process.env.PUBLIC_URL + "logo-split.png"});
  background-position: top left;
  background-size: contain;

  &:hover {
    cursor: pointer;
  }
`;

export const MenuTab = styled.div`
  height: calc(60px - 21px);
  padding-top: 21px;
  margin-right: 40px;
  position: relative;
  float: right;
  display: inline-block;
  cursor: pointer;
  color: #FFFFFF;
  font-weight: 500;
  text-decoration: none;
  
  &::after {
    width: 0%;
    position: absolute;
    left: 0px;
    bottom: 0px;
    content: "";
    height: 3px;
    background: #dfd8ef;
    transition: 0.2s ease-in-out 0s;
  }

  &:hover {
    cursor: pointer;
    &::after {
      width: 100% !important;
    }
  }
`;