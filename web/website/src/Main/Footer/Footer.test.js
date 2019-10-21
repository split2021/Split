import React from 'react';
import { shallow } from 'enzyme';
import Footer from './Footer';
import { Container, Inner } from './Footer.styles';

describe('First test Footer Text', () => {
    it('existe text', () => {
        const wrapper = shallow(<Footer />);
        const textWrapper = wrapper.find(Inner);
        expect(textWrapper).toHaveLength(1);
        expect(textWrapper.text()).toEqual('@Split 2019')
    });

});