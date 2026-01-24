import axios from "axios";

const API_BASE = "http://localhost:8080"; 

export const signup = (data) => axios.post(`${API_BASE}/auth/signup`, data);
export const login = (data) => axios.post(`${API_BASE}/auth/login`, data);
export const getAllUsers = () => axios.get(`${API_BASE}/users`); // for testing
