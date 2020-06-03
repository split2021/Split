import styled from 'styled-components';

export const Container = styled.div`
  color: #5570dd;
  width: 100%;
  top: 0px;
  min-height: calc(100% - 280px);
`;

export const Title = styled.div`
  margin-top: 150px;
  margin-left: 40px;
  margin-bottom: 10px;
  text-align: left;
  font-size: 30px;
`;

export const Goback = styled.div`
  margin-top: 10px;
  margin-left: 40px;
  margin-bottom: 40px;
  text-align: left;
  font-size: 14px;
  &:hover {
    cursor: pointer;
    text-decoration: underline;
  }
`;

export const Tab = styled.div`
  margin-top: 100px;
  max-width: 1140px;
  margin-left: auto;
  margin-right: auto;
  text-align: left;
`;