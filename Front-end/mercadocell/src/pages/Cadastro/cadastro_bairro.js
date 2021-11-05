import React from 'react';
import Navbar from '../../components/Menu/Navbar';
import { useForm } from "react-hook-form";
import { ErrorMessage } from '@hookform/error-message';
import './cadastro_usuario.css';
import axios from 'axios';
import Listar_estado from '../../components/Listas/listar_estado';

export default function Cadastro_bairro() {

  const { register, handleSubmit, formState: { errors } } = useForm();
  const onSubmit = (data) => { 
    console.log(data);
    axios.post("http://localhost:8080/bairro");
  }

  return (
  <>
  <Navbar />
  
  <div className="fundo_pagina">

    <form className="usuario_form" onSubmit = { handleSubmit(onSubmit) } >

      <div className="usuario_titulo">
        <h1>Cadastrar Bairro</h1>
      </div>

      <div className="usuario_linha">

        <div className="usuario_campo">

          <label htmlFor="nomeUnidadedeMedida"> Nome do Bairro </label>
          <input 
                 type="text" 
                 id="nomeUnidadedemedida" 
                 name="nomeUnidadedemedida"
                 {...register("nomeUnidadedemedida", {
                  required: 'Preenchimento Obrigatório',
                  minLength: {
                    value: 2,
                    message: 'No minimo dois caracteres' 
                  }
                })}
           />
        
        <ErrorMessage errors={errors} name="nomeUnidadedemedida">
        {({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
        </ErrorMessage>

        </div>

      </div>

      <div className="usuario_linha">

        <div className="usuario_campo">

          <label htmlFor="nomedacategoria"> Nome do Município </label>
          <input 
                 type="text" 
                 id="siglaUnidadedemedida" 
                 name="siglaUnidadedemedida"
                 {...register("siglaUnidadedemedida", {
                  required: 'Preenchimento Obrigatório',
                  minLength: {
                    value: 2,
                    message: 'No minimo dois caracteres' 
                  }
                })}
           />
        
        <ErrorMessage errors={errors} name="nomeUnidadedemedida">
        {({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
        </ErrorMessage>

        </div>
        </div>

        <div className="usuario_linha">

        <div className="usuario_campo">

        <label htmlFor="nomeUnidadedeMedida"> Estado </label>
          <select 
                 type="text" 
                 id="nomeUnidadedemedida" 
                 name="nomeUnidadedemedida"
                 {...register("nomeUnidadedemedida", {
                  required: 'Preenchimento Obrigatório',
                  minLength: {
                    value: 2,
                    message: 'No minimo dois caracteres' 
                  }
                })}
          >
          
          <Listar_estado />

          </select>
        
        <ErrorMessage errors={errors} name="nomeUnidadedemedida">
        {({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
        </ErrorMessage>

        </div>

      </div>

          <button type="submit">Cadastrar</button>

         
    </form>

  </div>
  </>
  );
}