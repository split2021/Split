import API from "./Api";

let request = async (call, data) => {

    let header = {
        Accept: 'application/json',
        'Content-Type': 'application/json',
    };
    if (call === 'users/') {
        header = {
            Accept: 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + this.state.token,
            'Access-Control-Allow-Origin': '*',
        };
    }
    return new Promise(resolve => {
        API.post(call, JSON.stringify(data), {headers: header})
            .then(response => resolve({data: response.data}))
            .catch(error => resolve({error, data: error}));
    });
};

export default request;