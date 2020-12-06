import styled from 'styled-components';

export const Container = styled.div`
  color: #5570dd;
  width: 100%;
  top: 0px;
  color: black;
  min-height: calc(100% - 280px);
`;

export const Icon = styled.div`
  width: 96px;
  height: 96px;
  border-radius: 48px;
  text-align: center;
  margin-left: auto;
  margin-right: auto;
  background: #E6E6E6 url(Icon.svg) no-repeat center bottom;
`;

export const Title = styled.div`
  margin-bottom: 20px;
  text-align: center;
  font-size: 38px;
  font-weight: 700;
`;

export const Tab = styled.div`
  margin-top: 80px;
  max-width: 1140px;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
`;

export const FlexContainer = styled.div`
  display: flex;
  justify-content: center;
  padding: 10px;
`;

export const HistoryList = styled.div`
  background-color: #FFFFFF;
  max-width: 1200px;
  min-width: 150px;
  min-height: 150px;
  margin: 40px auto;
  border-radius: 6px;
  border: 1px solid #dadce0;
`;
