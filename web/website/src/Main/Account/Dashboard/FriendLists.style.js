import styled from "styled-components";

export const Tableau = styled.div`
  background-color: #FFFFFF;
  max-width: 1200px;
  min-width: 550px;
  min-height: 10px;
  margin: 40px auto;
  border-radius: 6px;
  border: 1px solid #dadce0;
  text-align: left;
`;

export const Friend = styled.div`
  box-sizing: border-box;
  cursor: default;
  display: table;
  height: 50px;
  overflow: hidden;
  table-layout: fixed;
  width: 100%;
  
  &:hover {
    background-color: #E9E7EB;
  }
`;

export const CollumnFriend = styled.div`
  display: table-cell;
  padding: 12px;
  white-space: nowrap;
  font-weight: 500;
  overflow: auto;
`;

export const Container = styled.div`
  color: black;
  width: 100%;
  top: 0px;
  min-height: calc(100% - 280px);
`;

export const Title = styled.div`
  margin-bottom: 10px;
  text-align: center;
  font-size: 30px;
  font-weight: 700;
`;

export const Goback = styled.div`
  margin-top: 10px;
  text-align: left;
  font-size: 14px;
  white-space: nowrap;
  &:hover {
    cursor: pointer;
    text-decoration: underline;
  }
`;

export const Tab = styled.div`
  margin-top: 100px;
  max-width: 1200px;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
  overflow: auto;
`;

export const Collumns = styled.div`
  position: sticky;
  top: 0;
  z-index: 1;
  border-bottom: 1px solid rgba(0,0,0,0.12);
  box-sizing: border-box;
  cursor: default;
  display: table;
  height: 50px;
  overflow: hidden;
  table-layout: fixed;
  width: 100%;
`;

export const Collumn = styled.div`
  display: table-cell;
  padding: 12px;
  white-space: nowrap;
  font-weight: 600;
  color: #5f6368;
  overflow: auto;
`;

export const Loader = styled.div`
  width: 100%;
  text-align: center;
  border-radius: 6px;
`;