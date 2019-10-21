import * as React from 'react';
import { Container } from './Menu.styles';

const Menu = ({ redirect, children }) => {
    return (
        <Container to={redirect} children={children}/>
    );
};

export default Menu;