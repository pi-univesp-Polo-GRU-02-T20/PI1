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
    axios.post("http://localhost:8080/categoria");
  }

  return (
  <>
  <Navbar />
  
  <div className="fundo_pagina">
  <div className="fundo_formulario">

  <div className="titulo">
  <h1>Cadastrar Categoria</h1>
  </div>

    <form onSubmit = { handleSubmit(onSubmit) } >

        <div className="campo">

          <label htmlFor="nomedacategoria"> Nome da categoria </label>
          <input 
                 type="text" 
                 id="nomeCategoria" 
                 name="nomeCategoria"
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

          <button type="submit">Cadastrar</button>

         
    </form>

  </div>
  </div>
  </>
  );
}