import styled from 'styled-components';

export const Container = styled.div`
  background-color: #5570dd;
  display: inline-block;
  width: 300px;
  height: 150px;
  margin: 40px;
  border-radius: 6px;
  cursor: pointer;
  box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
`;

export const CaseBackground = styled.div`
  width: 100%;
  height: 70%;
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
  background-size: cover;
`;

export const CaseTitle = styled.div`
  width: 100%;
  height: 30%;
  padding: 10px;
  padding-left: 20px;
  color: white;
  font-size: 16px;
`;
