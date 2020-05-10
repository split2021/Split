import axios from 'axios';

export default axios.create({
    baseURL: `http://40.112.78.121:80/api/`,
    //baseURL: `http://127.0.0.1:8080/api/`,
    //baseURL: `http://52.178.136.18:443/api/`,
    responseType: "json", 
});