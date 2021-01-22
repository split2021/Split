import axios from 'axios';

export default axios.create({
    //baseURL: `http://api.pp.split2021.live/api/`,
    //baseURL: `https://cors-anywhere.herokuapp.com/http://52.178.136.18:443/api/`,
    baseURL: `https://cors-anywhere.herokuapp.com/http://api.pp.split2021.live/api/`,
    responseType: "json",
});
