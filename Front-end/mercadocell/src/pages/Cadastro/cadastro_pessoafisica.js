import React from 'react';
import Navbar from '../../components/Menu/Navbar';
import { useForm } from "react-hook-form";
import { ErrorMessage } from '@hookform/error-message';
import './cadastro_pessoafisica.css';
import axios from 'axios';

export default function Cadastro_pessoafisica() {

  const { register, handleSubmit, formState: { errors } } = useForm();
  const onSubmit = (data) => { 
    console.log(data);
    axios.post("http://localhost:8080/pessoaFisica");
  }

  return (
  <>
  <Navbar />
  
  <div className="fundo_pagina">

    <form className="pessoafisica_form" onSubmit = { handleSubmit(onSubmit) } >

      <div className="pessoafisica_titulo">
        <h1>Cadastrar Pessoa Física</h1>
      </div>

      <div className="pessoafisica_linha">

        <div className="pessoafisica_campo">

          <label htmlFor="nomeUnidadedeMedida"> Nome </label>
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

      

      <div className="pessoafisica_linha">

        <div className="pessoafisica_campo">

          <label htmlFor="nomedacategoria"> Data de Nascimento </label>
          <select 
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

        <div className="pessoafisica_campo">

        <label htmlFor="nomeUnidadedeMedida"> Naturalidade </label>
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
           />
        
        <ErrorMessage errors={errors} name="nomeUnidadedemedida">
        {({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
        </ErrorMessage>

        </div>
        </div>

        <div className="pessoafisica_linha">

        <div className="pessoafisica_campo">

          <label htmlFor="nomeUnidadedeMedida">  Sexo: </label>
          
          <div className="radio">
          
          <input 
                 type="radio" 
                 id="nomeUnidadedemedida" 
                 name="radio"
                 {...register("nomeUnidadedemedida", {
                  required: 'Preenchimento Obrigatório',
                  minLength: {
                    value: 2,
                    message: 'No minimo dois caracteres' 
                  }
                })}
           />
           <label htmlFor="nomeUnidadededMedida"> Masculino </label>

        </div>
        
        <div className="radio">
        
          <input 
                 type="radio" 
                 id="nomeUnidadedemedida" 
                 name="radio"
                 {...register("nomeUnidadedemedida", {
                  required: 'Preenchimento Obrigatório',
                  minLength: {
                    value: 2,
                    message: 'No minimo dois caracteres' 
                  }
                })}
           />
           <label htmlFor="nomeUnidadedeMedida"> Feminino </label>
        </div>

        </div>

        </div>

          <button type="submit">Cadastrar</button>

         
    </form>

  </div>
  </>
  );
}