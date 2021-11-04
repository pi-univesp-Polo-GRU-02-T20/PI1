import React from 'react';
import Navbar from '../../components/Menu/Navbar';
import { useForm } from "react-hook-form";
import { ErrorMessage } from '@hookform/error-message';
import './cadastro_categoria.css';
import axios from 'axios';

export default function Cadastro_categoria() {

  const { register, handleSubmit, formState: { errors } } = useForm();
  const onSubmit = (data) => { 
    console.log(data);
    axios.post("http://localhost:8080/Subcategoria", data);
  }

  return (
  <>
  <Navbar />
  
  <div className="fundo_pagina">

    <form className = "categoria_form" onSubmit = { handleSubmit(onSubmit) } >

    <div className="categoria_titulo">
      <h1>Cadastrar Subcategoria</h1>
    </div>

        <div className="categoria_linha">
        <div className="categoria_campo">

          <label htmlFor="nomedaSubcategoria"> Nome da Subcategoria </label>
          <input 
                 type="text" 
                 id="nomeSubcategoria" 
                 name="nomeSubcategoria"
                 {...register("nomeCategoria", {
                  required: 'Preenchimento Obrigatório',
                  minLength: {
                    value: 2,
                    message: 'No minimo dois caracteres' 
                  }
                })}
           />
        
        <ErrorMessage errors={errors} name="nomeCategoria">
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