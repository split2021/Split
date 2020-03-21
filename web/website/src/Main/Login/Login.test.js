import React from 'react';
import { shallow } from 'enzyme';
import SignIn from './Login';
import { Title } from '../Subscribe/Subscribe.styles';

describe('Test Login', () => {
    it('Test composent login', () => {
        const loginWrapper = shallow(<SignIn />);
        const textWrapper = loginWrapper.find(Title);
        expect(textWrapper).toHaveLength(1);
        expect(textWrapper.text()).toEqual('Connexion');
    });
});