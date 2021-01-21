import styled from 'styled-components';

export const Paiment = styled.div`
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

export const CollumnPaiment = styled.div`
  display: table-cell;
  padding: 12px;
  white-space: nowrap;
  font-weight: 500;
  overflow: auto;
`;