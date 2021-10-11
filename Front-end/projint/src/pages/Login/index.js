import React, { useState } from 'react'
import './login.css'

import { HiUser, HiLockClosed } from "react-icons/hi"
import { HiEye, HiEyeOff } from "react-icons/hi"


function Login() {
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    const [show, setShow] = useState(false)

    const handleClick = (e) => {
        e.preventDefault()
        setShow(!show);
    }

    return (
        <div className="login">

            <div className="login-painel">
                <h1>Login</h1>

                <div className="login-loginInputEmail">
                    <HiUser />
                    <input
                        type="email"
                        placeholder="Usuário"
                        value={email}
                        onChange={e => setEmail(e.target.value)}
                    />
                </div>

                <div className="login-loginInputPassword">
                    <HiLockClosed />
                    <input
                        placeholder="Senha"
                        type={show ? "text" : "password"}
                        value={password}
                        onChange={e => setPassword(e.target.value)}
                    />
                    <div className="login-eye">
                        {show ? (
                            <HiEye
                               size={20}
                               onClick={handleClick}
                            />
                        ) : (
                            <HiEyeOff 
                               size={20}
                               onClick={handleClick} 
                           />
                        )}
                    </div>
                </div>
                
                <button type="submit">
                    Acessar
                </button>

            </div>
        </div>
    )
}

export default Login
