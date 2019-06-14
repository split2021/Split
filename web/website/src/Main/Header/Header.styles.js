import styled from 'styled-components';
import Menu from "../../components/Menu/Menu";

export const Container = styled.div`
        width: 100%;
        height: 60px;
        background-color: rgba(223, 216, 239, 0.80);
        display: inline-block;
`;

export const Logo = styled.img`
        float: left;
        width: 40px;
        height: 40px;
        margin-left: 20px;
        margin-top: 10px;
        object-fit: contain;
`;

export const MenuTab = styled(Menu)`
`;


export const Account = styled.button`
`;