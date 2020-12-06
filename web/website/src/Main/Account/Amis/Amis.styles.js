import styled from 'styled-components';

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