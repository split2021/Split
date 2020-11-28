import styled from 'styled-components';

export const Container = styled.div`
  position: relative;
  padding: 15px;
  text-align: left;
  height: 150px;
  white-space: nowrap;
  display: inline-block;
  margin-left: 20px;
  margin-right: 20px;
  margin-bottom: 40px;
  width: 300px;
`;

export const Profile = styled.img`
  float: left;
  width: 150px;
  height: 150px;
  filter: drop-shadow(0px 0px 10px #555555);
`;

export const Title = styled.div`
  margin-left: 170px;
  font-size: 20px;
  font-weight: 700;
`;

export const Text = styled.div`
  margin-left: 170px;
`;