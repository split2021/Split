import React from 'react';
import Request from "../../../components/Api/Request";
import {
  Paiment,
  CollumnPaiment,
} from "./History.styles";
import LinearProgress from "@material-ui/core/LinearProgress";
import {Loader} from "../Global.styles";


export default class History extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: JSON.parse(localStorage.getItem('userData')) || '',
      adminData: JSON.parse(localStorage.getItem('adminData')) || '',
      paiments: [],
      loader: true,
      loadPercentage: 0,
    }
  }

  componentDidMount() {
    this.getPaiments();
  }

  async getPaiments() {
    let paiments = this.state ? await this.retrievePaiments() : [];
    this.setState({ loader : false });
    this.setState({ paiments: paiments });
  }

  async retrievePaiments() {
    let paiments = [];
    let data;
    let i = 0;
    if (this.state.data && this.state.data.user && this.state.data.user.payment_groups) {
      for (const group of this.state.data.user.payment_groups) {
        this.setState({ loadPercentage : (((i + 0.1) * 100) / (this.state.data.user.payment_groups).length) });
        data = await Request(
          'payments/?group=' + group.id,
          {},
          this.state.adminData.token,
          'get'
        );
        if (data.data.statuscode === 200) {
          for (const paiment of data.data.data) {
            paiments.push(paiment);
          }
        }
        i++;
      }
    }
    return paiments;
  }

  render() {
    let result = [];

    if ((this.state.paiments).length) {
      console.log(this.state.paiments);
      for (const paiment of this.state.paiments) {
        let eachUser = [];
        if (Object.keys(paiment.payments).length > 0) {
          for (const amount of Object.keys(paiment.payments)) {
            eachUser.push(
              ' ' + paiment.payments[amount].amount + '€'
            );
          }
        }
        result.push(
          <Paiment key={{paiment}}>
            <CollumnPaiment>{paiment.total} €</CollumnPaiment>
            <CollumnPaiment>{Object.keys(paiment.payments).length + ' (' + eachUser + ' )'}</CollumnPaiment>
          </Paiment>
        );
      }
    } else {
      return (
        <Loader>
          <LinearProgress
            variant="determinate"
            value={ this.state ? this.state.loadPercentage : 0 } />
      </Loader>
      );
    }

    return result;
  }

}