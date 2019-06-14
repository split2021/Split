import styled from 'styled-components';

export const Container = styled.div`
        height: calc(60px - 21px);
        padding-top: 21px;
        margin-right: 20px;
        position: relative;
        float: right;
        display: inline-block;
        cursor: pointer;
        color: #46307f;
        font-weight: 600;

        &::after {
                width: 0%;
                position: absolute;
                left: 0px;
                bottom: 0px;
                content: "";
                height: 2px;
                box-shadow: 0 4px 32px 0 rgba(249, 58, 19, 0.5);
                background: #46307f;
                transition: 0.2s ease-in-out 0s;
        }

        &:hover {
                &::after {
                        width: 100% !important;
                }
        }
`;