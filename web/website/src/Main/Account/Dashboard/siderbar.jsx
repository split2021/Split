import React, { Component } from 'react';
import styled from "styled-components";
import {Goback} from "../Global.styles";

const SiderbarContainer = styled.div`
  display: flex;
  height: 100vh;
  width: 270px;
  background: #252529;
  color: #fff;
  font-family: 'Open sans', sans-serif;
`;

const SiderbarMenu = styled.ul `
  display: flex;
  align-items: center;
  flex-direction: column;
  list-style: none;
  width: 100%;
`;

const SiderbarMenuItem = styled.li `
  height: 40px;
  width: 100%;
`;

const Icon = styled.svg`
  width: 20px;
  height: 20px;
`;

const SiderbarMenuItemLabel = styled.p `
  font-family: 'Open sans', sans-serif;
  color: #fff;
  font-size: 14px;
  line-height: 1.5;
  font-weight: 500;
  text-align: left;
  color: #ffffff;
  
`;


export default class Siderbar extends React.Component {

    handleRedirect(direction) {
        this.props.history.push(direction);
    }

    render() {
        return (
            <SiderbarContainer>
                <SiderbarMenu>
                    <SiderbarMenuItem>
                        <Icon></Icon>
                        <SiderbarMenuItemLabel>Dashboard</SiderbarMenuItemLabel>
                    </SiderbarMenuItem>
                    <SiderbarMenuItem>
                        <Icon></Icon>
                        <SiderbarMenuItemLabel>Service Alerts</SiderbarMenuItemLabel>
                    </SiderbarMenuItem>
                    <SiderbarMenuItem>
                        <Icon></Icon>
                        <SiderbarMenuItemLabel>Customer Tickets</SiderbarMenuItemLabel>
                    </SiderbarMenuItem>
                    <SiderbarMenuItem>
                        <Icon></Icon>
                        <SiderbarMenuItemLabel>Archive</SiderbarMenuItemLabel>
                    </SiderbarMenuItem>
                    <SiderbarMenuItem>
                        <Icon></Icon>
                        <SiderbarMenuItemLabel>Library</SiderbarMenuItemLabel>
                    </SiderbarMenuItem>
                    <SiderbarMenuItem>
                        <Icon></Icon>
                        <SiderbarMenuItemLabel><Goback onClick={() => { this.handleRedirect('/account') }}>&larr;  Retourner vers mon Compte</Goback></SiderbarMenuItemLabel>
                    </SiderbarMenuItem>
                </SiderbarMenu>
            </SiderbarContainer>
        );
    }
}