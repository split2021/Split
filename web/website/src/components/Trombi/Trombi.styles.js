import styled from 'styled-components';

export const Container = styled.div`
  width: 100%;
  display: grid;
  text-align: center;
  margin-top: 40px;
  margin-left: calc((100% - 401px) / 4);
  grid-template-columns: min-content min-content;
  grid-template-rows: auto auto auto auto;
  grid-gap: 30px;
`;