import styled from 'styled-components';
import Menu from '../../components/Menu/Menu';

export const Container = styled.div`
        width: 100%;
        height: 60px;
        background-color: #5570dd;
        display: inline-block;
        border-bottom: solid 1px #dfd8ef;
        position: fixed;
        top: 0;
`;

export const Elements = styled.div`
        width: 100%;
        max-width: 1120px;
        height: 100%;
        margin-left: auto;
        margin-right: auto;
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