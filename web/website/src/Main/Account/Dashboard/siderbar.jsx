import React from 'react';
import {
    SiderbarContainer,
    SiderbarMenuItem,
    SiderbarMenuItemLabel,
    Icon,
    GoBackText,
    Container, GridOne, GridTwo, GridTree
} from "./siderbar.style";
import ImportContactsIcon from '@material-ui/icons/ImportContacts';
import DashboardIcon from '@material-ui/icons/Dashboard';
import ExitToAppIcon from '@material-ui/icons/ExitToApp';
import GroupIcon from '@material-ui/icons/Group';
//import ArchiveIcon from '@material-ui/icons/Archive';
import FriendLists from "./FriendLists";
import Cookies from "universal-cookie";
import Dates from "./Date";
import Chart from "./Charts";

export default class Siderbar extends React.Component {
    constructor(props) {
        super(props);
        this.cookies = new Cookies();
        if ( this.cookies !== undefined && (this.cookies.get('auth')) !== undefined) {
            console.log('cookie présent');
            this.state = {
                connected: true,
                elem: 0,
                data: JSON.parse(localStorage.getItem('userData')) || '',
                adminData: JSON.parse(localStorage.getItem('adminData')) || '',
                loader: true,
                loadPercentage: 0,
                friends: '',
            };
        } else {
            console.log('cookie non présent');
            this.handleRedirect('/');
        }
    }

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
                            <Icon viewBox={"0 0 20 20"}>
                                <GroupIcon
                                    style={{color: 'black'}}
                                />
                            </Icon>
                            <SiderbarMenuItemLabel>
                                <GoBackText onClick={() => { this.handleRedirect('/groupes') }}>
                                    Groupes
                                </GoBackText>
                            </SiderbarMenuItemLabel>
                        </SiderbarMenuItem>
                        <SiderbarMenuItem>
                            <Icon viewBox={"0 0 20 20"}>
                              <ExitToAppIcon
                                  style={{color: 'black'}}
                              />
                            </Icon>
                            <SiderbarMenuItemLabel>
                                <GoBackText onClick={() => { this.handleRedirect('/account') }}>
                                    Retourner vers mon Compte</GoBackText>
                            </SiderbarMenuItemLabel>
                        </SiderbarMenuItem>
                </SiderbarContainer>
                <GridOne>
                    <Dates
                        xs={12}
                    />
                </GridOne>
                <GridTwo>
                    <FriendLists
                        xs={12}
                    />
                </GridTwo>
                <GridTree>
                    <Chart/>
                </GridTree>
            </Container>
        );
    }
}
