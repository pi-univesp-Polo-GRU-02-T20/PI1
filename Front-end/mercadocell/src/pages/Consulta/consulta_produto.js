import React from 'react';
import Navbar from '../../components/Menu/Navbar';
import { useForm } from "react-hook-form";
import { ErrorMessage } from '@hookform/error-message';
import '../../produto.css';
import axios from 'axios';

export default function Cadastro_categoria() {

  const { register, handleSubmit, formState: { errors } } = useForm();
  const onSubmit = (data) => { 
    console.log(data);
    axios.post("http://localhost:8080/Produto");
  }

  return (
  <>
  <Navbar />
  
  <div className="fundo_pagina">
  <div className="fundo_formulario">

    <form onSubmit = { handleSubmit(onSubmit) } >

    <div className="titulo">
       <h1>Cadastrar Produto</h1>
    </div>

        <div className="campolongo">

          <label htmlFor="nomeProduto"> Nome do Produto</label>
          <input 
                 type="text" 
                 id="nomeProduto" 
                 name="nomeProduto"
                 {...register("nomeProduto", {
                  required: 'Preenchimento Obrigatório',
                  minLength: {
                    value: 2,
                    message: 'No minimo dois caracteres' 
                  }
                })}
           />
        
        <ErrorMessage errors={errors} name="nomeProduto">
        {({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
        </ErrorMessage>
        </div>

        <div className="campolongo">

          <label htmlFor="descricao"> Descrição</label>
          <textarea 
                 type="text" 
                 id="descricao" 
                 name="descricao"
                 {...register("descricao", {
                  required: 'Preenchimento Obrigatório',
                  minLength: {
                    value: 2,
                    message: 'No minimo dois caracteres' 
                  }
                })}
           />
        
        <ErrorMessage errors={errors} name="descricao">
        {({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
        </ErrorMessage>
        
        </div>

        <div className="campolongo">

<label htmlFor="nomeProduto"> Nome do Produto</label>
<input 
       type="text" 
       id="nomeProduto" 
       name="nomeProduto"
       {...register("nomeProduto", {
        required: 'Preenchimento Obrigatório',
        minLength: {
          value: 2,
          message: 'No minimo dois caracteres' 
        }
      })}
 />

<ErrorMessage errors={errors} name="nomeProduto">
{({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
</ErrorMessage>
</div>

<div className="campolongo">

<label htmlFor="nomeProduto"> Nome do Produto</label>
<input 
       type="text" 
       id="nomeProduto" 
       name="nomeProduto"
       {...register("nomeProduto", {
        required: 'Preenchimento Obrigatório',
        minLength: {
          value: 2,
          message: 'No minimo dois caracteres' 
        }
      })}
 />

<ErrorMessage errors={errors} name="nomeProduto" className="mensagemErro">
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