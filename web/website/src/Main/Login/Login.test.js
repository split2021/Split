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

    /*test('username check', () => {
        const wrappeUsername = shallow(<SignIn />);
        wrappeUsername.find('input[type="text"]').simulate('change', { target: { name: 'email', value: 'test@split.fr' } });
        expect(wrappeUsername.state('email')).toEqual('test@split.fr');
    });*/

   /* it('password check', () => {
        const passwordWrapper = shallow(<SignIn />);
        passwordWrapper.find('input[type="password"]').simulate('change', {
            target: {
                name: 'password', value: '93BaqTWsM0GH'
            }
        });
        expect(passwordWrapper.state('password')).toEqual('93BaqTWsM0GH');
    });

    it('login check with right data', () => {
        const wrapper = shallow(<SignIn />);
        wrapper.find('input[type="text"]').simulate('change', { target: { name: 'email', value: 'test@split.fr' } });
        wrapper.find('input[type="password"]').simulate('change', { target: { name: 'password', value: '93BaqTWsM0GH' } });
        wrapper.find('button').simulate('click');
        expect(wrapper.state('isLogined')).toBe(true);
    });*/
});