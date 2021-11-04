import React from 'react';
import Navbar from '../../components/Menu/Navbar';
import { useForm } from "react-hook-form";
import { ErrorMessage } from '@hookform/error-message';
import './cadastro_unidadedemedida.css';
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

    <form className="udmedida_form" onSubmit = { handleSubmit(onSubmit) } >

      <div className="udmedida_titulo">
        <h1>Cadastrar</h1>
        <h1>Unidade de Medida</h1>
      </div>

      <div className="udmedida_linha">

        <div className="udmedida_campo">

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

      </div>

      <div className="udmedida_linha">

        <div className="udmedida_campo">

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

      </div>

          <button type="submit">Cadastrar</button>

         
    </form>

  </div>
  </>
  );
}