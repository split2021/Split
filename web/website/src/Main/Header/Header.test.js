import React from 'react';
import { shallow } from 'enzyme';
import Header from './Header';
import { Elements, Logo, MenuTab } from './Header.styles';

describe('Test Header', () => {
    it('Exist Elements for test', () => {
        const headerWrapper = shallow(<Header />);
        expect(headerWrapper.find(Elements)).toHaveLength(1);
    });

    it('Logo exist', () => {
        const logoWrapper = shallow(<Header />);
        const findLogoWrapper = logoWrapper.find(Logo);
        expect(findLogoWrapper).toHaveLength(1);
    });

    it('test MenuTab exist', () => {
        const menuTabWrapper = shallow(<Header />);
        const findMenuTabWrapper = menuTabWrapper.find(MenuTab);

        expect(findMenuTabWrapper).toHaveLength(2);
    });
});