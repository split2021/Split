import styled from 'styled-components';

export const Container = styled.div`
        height: calc(60px - 21px);
        padding-top: 21px;
        margin-right: 40px;
        position: relative;
        float: right;
        display: inline-block;
        cursor: pointer;
        color: #FFFFFF;
        font-weight: 500;

        &::after {
                width: 0%;
                position: absolute;
                left: 0px;
                bottom: 0px;
                content: "";
                height: 3px;
                background: #dfd8ef;
                transition: 0.2s ease-in-out 0s;
        }

        &:hover {
                &::after {
                        width: 100% !important;
                }
        }
`;