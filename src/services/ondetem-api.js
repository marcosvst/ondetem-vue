import axios from 'axios';

const api = axios.create({
  baseURL: 'https://ondetem-api.herokuapp.com/',
});

export default api;