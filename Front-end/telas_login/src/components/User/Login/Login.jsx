import React, { useState, useContext } from 'react'
import { useHistory } from 'react-router-dom';
import StoreContext from '../../Store/Context';
import UIButton from '../../UI/Button/Button';

import { HiUser, HiLockClosed } from "react-icons/hi"
import { HiEye, HiEyeOff } from "react-icons/hi"

import './Login.css'

function initialState() {
  return { user: '', password: '' };
}

function login({ user, password }) {
  if (user === 'admin' && password === 'admin') {
    return { token: '1234' };
  }
  return { error: 'Usuário ou senha inválido' };
}

const UserLogin = () => {
  const [values, setValues] = useState(initialState);
  const [error, setError] = useState(null);
  const { setToken } = useContext(StoreContext);
  const history = useHistory();

  function onChange(event) {
    const { value, name } = event.target;

    setValues({
      ...values,
      [name]: value
    });
  }

  function onSubmit(event) {
    event.preventDefault();

    const { token, error } = login(values);

    if (token) {
      setToken(token);
      return history.push('/');
    }

    setError(error);
    setValues(initialState);
  }

    return (
        <div className="login">

            <div className="login-painel">
              <h1>Login</h1>

              <form onSubmit={onSubmit} className="form">

                <div className="login-loginInputEmail">
                    <HiUser />
                    <input
                        id="user"
                        type="text"
                        name="user"
                        placeholder="Usuário"
                        value={values.user}
                        onChange={onChange}
                    />
                </div>
                
                <div className="login-loginInputPassword">
                    <HiLockClosed /> 
                    <input
                        id="password"
                        type="password"
                        name="password"
                        placeholder="Senha"
                        value={values.password}
                        onChange={onChange}
                     />
                </div>

                {error && (<div className="user-login__error">{error}</div>)}
                
                <UIButton
                   type="submit"
                   theme="contained-green"
                   className="user-login__submit-button"
                   rounded
                >
                    Acessar
                </UIButton>
              </form>
            </div>
        </div>
    )
}

export default UserLogin
