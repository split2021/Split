import axios from 'axios';

export default axios.create({
    baseURL: `http://52.178.136.18:443/api/`,
    responseType: "json",
});