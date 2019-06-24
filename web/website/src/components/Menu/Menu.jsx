import * as React from 'react';
import { Container } from './Menu.styles';

const Menu = ({ children }) => {
    return (
        <Container children={children}/>
    );
};

export default Menu;