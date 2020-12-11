import React from 'react';
import {
    SiderbarContainer,
    SiderbarMenuItem,
    SiderbarMenuItemLabel,
    Icon,
    GoBackText,
    Container, GridOne, GridTwo
} from "./siderbar.style";
import ImportContactsIcon from '@material-ui/icons/ImportContacts';
import DashboardIcon from '@material-ui/icons/Dashboard';
import Charts from "./chart";
import FriendLists from "./FriendLists";

export default class Siderbar extends React.Component {

    handleRedirect(direction) {
        this.props.history.push(direction);
    }

    render() {
        return (
            <Container>
                <SiderbarContainer>
                        <SiderbarMenuItem onClick={() => { this.handleRedirect('/siderbar') }}>
                            <Icon viewBox={"0 0 20 20"}>
                                <DashboardIcon
                                style={{color: 'black', fontSize: "large"}}
                                />
                            </Icon>
                            <SiderbarMenuItemLabel>Dashboard</SiderbarMenuItemLabel>
                        </SiderbarMenuItem>
                        <SiderbarMenuItem>
                            <Icon viewBox={"0 0 20 20"}>
                                <ImportContactsIcon
                                    style={{color: 'black'}}
                                />
                            </Icon>
                            <SiderbarMenuItemLabel>
                                <GoBackText onClick={() => { this.handleRedirect('/amis') }}>
                                    Amis
                                </GoBackText>
                            </SiderbarMenuItemLabel>
                        </SiderbarMenuItem>
                        <SiderbarMenuItem>
                            <Icon></Icon>
                            <SiderbarMenuItemLabel>
                                <GoBackText onClick={() => { this.handleRedirect('/groupes') }}>
                                    Groupes
                                </GoBackText>
                            </SiderbarMenuItemLabel>
                        </SiderbarMenuItem>
                        <SiderbarMenuItem>
                            <Icon></Icon>
                            <SiderbarMenuItemLabel>Archive</SiderbarMenuItemLabel>
                        </SiderbarMenuItem>
                        <SiderbarMenuItem>
                            <Icon></Icon>
                            <SiderbarMenuItemLabel>
                                <GoBackText onClick={() => { this.handleRedirect('/account') }}>
                                    Retourner vers mon Compte</GoBackText>
                            </SiderbarMenuItemLabel>
                        </SiderbarMenuItem>
                </SiderbarContainer>
                <GridOne>
                    <Charts
                    />
                </GridOne>
                <GridTwo>
                    <FriendLists/>
                </GridTwo>
            </Container>

        );
    }
}