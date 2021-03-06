import styled from "styled-components";

export const GoBackText = styled.div`
  display: flex;
  height: 40px;
  width: 100%;
  align-items: center;
  padding-left: 0px;
  
`;

export const SiderbarContainer = styled.div`
  display: block;
  grid-column: 1;
  grid-row: 1/5;
  height: 200px;
  width: 270px;
  background: #fff;
  color: #fff;
  font-family: 'Open sans', sans-serif;
`;



export const SiderbarMenuItem = styled.li `
  display: flex;      
  height: 40px;
  width: 100%;
  align-items: center;
  padding-left: 30px;
  &:hover {
    background: rgba(255, 255, 255, 0.05);
    box-shadow: inset 0px 0 0 0 black;
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
export const Container = styled.div`
  display: grid;
  gap: 10px;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: minmax(100px, auto);
  //grid-template-rows: repeat(6, 1fr);

`;

export const GridOne = styled.div`
  grid-column: 4;
  
  //grid-auto-columns: auto;
  grid-row: 1;
  width: 50ch;
  height: 0px;
`;

export const GridTwo = styled.div`
  grid-column: 6/3;
  grid-row: 2/-1;
  width: auto;
  //grid-auto-columns: auto;
`;

export const GridTree = styled.div`
  grid-column: 2/3;
  grid-row: 1/4;
  width: 80ch;
  height: 150px;
`;

