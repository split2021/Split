import React from 'react';
import { shallow } from 'enzyme';
import Trombi from './Trombi';
import People from './People/People';


describe('Test Components People', () => {
    it('Exist People', () => {
        const peopleWrapper = shallow(<Trombi />);
        const findPeopleWrapper = peopleWrapper.find(People);
        expect(findPeopleWrapper).toHaveLength(7);
    });

});