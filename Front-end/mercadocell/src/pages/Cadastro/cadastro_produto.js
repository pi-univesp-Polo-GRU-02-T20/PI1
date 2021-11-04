import React, { Component } from 'react';
import Navbar from '../../components/Menu/Navbar';
import { useForm } from "react-hook-form";
import { ErrorMessage } from '@hookform/error-message';
import './cadastro_produto.css';
import axios from 'axios';
import Api from '../../components/Services/Api'

export default function Cadastro_produto() {

  const { register, handleSubmit, formState: { errors } } = useForm();
  const onSubmit = (data) => { 
    console.log(data);
    axios.post("http://localhost:8080/produto");
  }

  return (
  <>
  <Navbar />
  
  <div className="fundo_pagina">

    <form className="produto_form" onSubmit = { handleSubmit(onSubmit) } >

    <div className="produto_titulo">
    <h1>Cadastrar Produto</h1>
    </div>

    <div className="produto_linha">

      <div className="produto_campo">

          <label htmlFor="nomeProduto">Nome do Produto</label>
          <input 
                 type="text" 
                 id="nomeProduto" 
                 name="nomeProduto"
                 {...register("categoriaProduto", {
                  required: 'Preenchimento Obrigatório',
                  minLength: {
                    value: 2,
                    message: 'No minimo dois caracteres' 
                  }
                })}
           />
        
          <ErrorMessage errors={errors} name="categoriaProduto">
            {({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
          </ErrorMessage>

      </div>
      
    </div>

    <div className="produto_linha">

      <div className="produto_campo">

          <label htmlFor="nomeProduto">Categoria</label>
          <select 
                 type="text" 
                 id="nomeProduto" 
                 name="nomeProduto"
                 {...register("categoriaProduto", {
                  required: 'Preenchimento Obrigatório',
                  minLength: {
                    value: 2,
                    message: 'No minimo dois caracteres'
                  }
                })}
           >
          </select>
                             
        <ErrorMessage errors={errors} name="categoriaProduto">
        {({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
        </ErrorMessage>

      </div>

      <div className="produto_campo">

<label htmlFor="nomeProduto">Subcategoria</label>
<select 
       type="text" 
       id="nomeProduto" 
       name="nomeProduto"
       {...register("categoriaProduto", {
        required: 'Preenchimento Obrigatório',
        minLength: {
          value: 2,
          message: 'No minimo dois caracteres' 
        }
      })}
 />

<ErrorMessage errors={errors} name="categoriaProduto">
{({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
</ErrorMessage>

</div>

    </div>
    <div className="produto_linha">
      <div className="produto_campo">
        <label htmlFor="descricaoProduto">Descrição</label>
        <textarea 
                 type="text" 
                 id="descricaoProduto" 
                 name="descricaoProduto"
                 {...register("subcategoriaProduto", {
                  required: 'Preenchimento Obrigatório',
                  minLength: {
                    value: 2,
                    message: 'No minimo dois caracteres' 
                  }
                })}
           />
        
        <ErrorMessage errors={errors} name="subcategoriaProduto">
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