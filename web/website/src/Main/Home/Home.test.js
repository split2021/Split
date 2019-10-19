import React from 'react';
import { shallow } from 'enzyme';
import Home from './Home';
import { Block, Text, Title, DeviseTxt, Devise } from './Home.styles';


describe('Test Block exist', () => {
    it('Exist test', () => {
        const homeWrapper = shallow(<Home />);
        expect(homeWrapper.find(Block)).toHaveLength(4);

    });

    it('Devise Exist', () => {
        const deviseWrapper = shallow(<Home />);
        expect(deviseWrapper.find(Devise)).toHaveLength(3);
    });

    it('Text exist', () => {
        const baliseTextWrapper = shallow(<Home />);
        const textFindWrapper = baliseTextWrapper.find(Text);
        const textTable = ['Le service le plus rapide pour diviser les paiements en groupe', 'Split est un projet de fin d’études Epitech ayant pour but de faciliter les paiements à plusieurs sans avoir à faire de pot commun.', '24 Rue Pasteur, 94270 Le Kremlin-Bicêtre, France', 'contact@split-pay.fr'];
        expect(textFindWrapper).toHaveLength(4);
        expect(textFindWrapper.contains(textTable));
    });

    it('Title exist', () => {
        const baliseTitleWrapper = shallow(<Home />);
        const titleFindWrapper = baliseTitleWrapper.find(Title);
        const titleTable = ['Le paiement à plusieurs repensé', '>Un projet Epitech', 'Notre équipe', 'Contact', 'Retrouvez nous dans les locaux Epitech', 'Contactez nous directement'];
        expect(titleFindWrapper).toHaveLength(6);
        expect(titleFindWrapper.contains(titleTable));
    });

    it('DeviseTxt exist', () => {
        const baliseDeviseTxtWrapper = shallow(<Home />);
        const deviseTxtFindWrapper = baliseDeviseTxtWrapper.find(DeviseTxt);
        expect(deviseTxtFindWrapper).toHaveLength(3);
    });
});