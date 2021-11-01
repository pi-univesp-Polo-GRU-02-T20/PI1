import React from 'react';
import Navbar from '../../components/Menu/Navbar';
import { useForm } from "react-hook-form";
import { ErrorMessage } from '@hookform/error-message';
import '../../App.css';
import axios from 'axios';

export default function Cadastro_categoria() {

  const { register, handleSubmit, formState: { errors } } = useForm();
  const onSubmit = (data) => { 
    console.log(data);
    axios.post("http://localhost:8080/UnidadedeMedida");
  }

  return (
  <>
  <Navbar />
  
  <div className="fundo_pagina">
  <div className="fundo_formulario2">

  <div className="titulo">
  <h1>Cadastrar</h1>
  <h1>Unidade de Medida</h1>
  </div>

    <form onSubmit = { handleSubmit(onSubmit) } >

        <div className="campo">

          <label htmlFor="nomeUnidadedeMedida"> Nome da Unidade de Medida</label>
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

        <div className="campo">

          <label htmlFor="nomedacategoria"> Sigla da Unidade de Medida</label>
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

          <button type="submit">Cadastrar</button>

         
    </form>

  </div>
  </div>
  </>
  );
}