import axios from 'axios';

export default axios.create({
    //baseURL: `http://127.0.0.1:8080/api/`,
    //baseURL: `https://cors-anywhere.herokuapp.com/http://52.178.136.18:443/api/`,
    baseURL: `https://cors-anywhere.herokuapp.com/http://40.112.78.121:80/api/`,
    responseType: "json", 
});