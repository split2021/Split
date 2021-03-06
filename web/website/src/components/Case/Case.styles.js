import styled from 'styled-components';

export const Container = styled.div`
  background-color: #FFFFFF;
  width: 150px;
  height: 150px;
  margin-left: 20px;
  margin-right: 20px;
  margin-top: 20px;
  border-radius: 6px;
  cursor: pointer;
  box-shadow: 0px 2px 8px rgba(17, 17, 29, 0.12);
  border: 1px solid #E9E7EB;
  
  &:hover {
    background-color: #E9E7EB;
  }
`;

export const ContainerBis = styled.div`
  background-color: #FFFFFF;
  display: block;
  max-width: 340px;
  min-width: 150px;
  height: 70px;
  margin: 0 auto;
  margin-top: 40px;
  border-radius: 6px;
  cursor: pointer;
  box-shadow: 0px 2px 8px rgba(17, 17, 29, 0.12);
  border: 1px solid #E9E7EB;
  vertical-align: middle;
  word-wrap: break-word;
  overflow: visible;
  
  &:hover {
    background-color: #E9E7EB;
  }
`;

export const CaseNumber = styled.div`
  width: 100%;
  font-size: 42px;
  font-weight: 700;
  padding-top: 20px;
  text-align: center;
`;

export const CaseTitle = styled.div`
  width: calc(100% - 20px);
  height: 60px;
  font-size: 18px;
  font-weight: 700;
  text-align: center;
  overflow: visible;
  padding: 0 10px;
`;

export const TextCaseTitle = styled.div`
  width: 100%;
  height: 100%;
  margin-top: 20px;
  font-size: 18px;
  font-weight: 700;
  text-align: center;
`;

export const Span = styled.div`
  margin-top: auto;
`;
