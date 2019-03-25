import axios from 'axios';

const BACKEND_URL = process.env.REACT_APP_BACKEND_URL;

export const listTopics = () => {
  return axios.get(`${BACKEND_URL}/api/v1/topics`).then(response => response.data )
}

export const getTopic = (id) => { 
  console.log(id)
  return axios.get(`${BACKEND_URL}/api/v1/topics/${id}`).then(response => response.data )
}
