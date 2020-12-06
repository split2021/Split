import styled from "styled-components";

export const GoBackText = styled.div`
  display: flex;
  height: 40px;
  width: 100%;
  align-items: center;
  padding-left: 0px;
  
`;

export const SiderbarContainer = styled.div`
  display: flex;
  height: 100vh;
  width: 270px;
  background: #fff;
  color: #fff;
  font-family: 'Open sans', sans-serif;
  border: 1px dotted black;
`;

export const SiderbarMenu = styled.ul `
  display: flex;
  align-items: center;
  flex-direction: column;
  list-style: none;
  width: 100%;
  padding: 0px 30px;
`;

export const SiderbarMenuItem = styled.li `
  display: flex;      
  height: 40px;
  width: 100%;
  align-items: center;
  padding-left: 30px;
  &:hover {
    background: rgba(255, 255, 255, 0.05);
    box-shadow: inset 3px 0 0 0 black;
    cursor: pointer;
  }
`;

export const Icon = styled.svg`
  width: 20px;
  height: 20px;
`;

export const SiderbarMenuItemLabel = styled.p `
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  font-weight: 600;
  line-height: 1.3;
  text-align: left;
  color: #252529;
  margin-left: 20px;
  
`;
