import styled from "styled-components";

export const Tableau = styled.div`
  background-color: #FFFFFF;
  min-height: 10px;
  margin-left: 10px;
  border-radius: 10px;
  border: 1px solid #dadce0;
  text-align: center;
`;

export const Collumn = styled.div`
  display: grid;
  padding: 12px;
  white-space: nowrap;
  font-weight: 600;
  color: #5f6368;
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
  overflow: hidden;
  table-layout: fixed;
  width: 100%;
`;

export const Tab = styled.div`
  margin-top: 50px;
  max-width: 200px;
  margin-left: 100px;
  margin-right: auto;
  text-align: center;
  overflow: auto;
`;
