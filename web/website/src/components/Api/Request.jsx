import API from "./Api";

let request = async (call, data, token, type) => {

    let header = {
          Accept: 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ' + token,
          'Access-Control-Allow-Origin': '*',
      };
    if (call === 'login') {
        header = {
        Accept: 'application/json',
        'Content-Type': 'application/json',
    };
    }
    return new Promise(resolve => {
      if (type === 'post') {
        API.post(call, JSON.stringify(data), {headers: header})
          .then(response => resolve({data: response.data}))
          .catch(error => resolve({error, data: error}));
      } else if (type === 'get') {
        API.get(call, {headers: header})
          .then(response => resolve({data: response.data}))
          .catch(error => resolve({error, data: error}));
      }
    });
};

export default request;