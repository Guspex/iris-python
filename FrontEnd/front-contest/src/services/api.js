import axios from 'axios';
//Arquitetura para exportar e gerenciar uma api utilizando a biblioteca axios

export const setupApiClient = () => {
  const api = axios.create({
    baseURL: process.env.REACT_APP_URL,
  });

  api.interceptors.response.use(
    (response) => {
      return response;
    },
    (error) => {
      if (error.response?.status === 401) {
        window.location.href = '/error-401';
      }

      return Promise.reject(error);
    }
  );

  return api;
};
