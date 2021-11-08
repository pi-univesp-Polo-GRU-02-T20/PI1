import axios from 'axios';

const Apis= axios.create({
    baseURL: "http://localhost:8080/usuario/validarSenha",
});

export default Api;