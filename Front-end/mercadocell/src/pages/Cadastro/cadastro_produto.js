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
    axios.post("http://localhost:8080/cliente");
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

        <label htmlFor="categoriaProduto">Nome do Produto</label>
          <input 
                 type="text" 
                 id="categoriaProduto" 
                 name="categoriaProduto"
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

        <div className="campoduplo">
        <div className="camposimples">

        <label htmlFor="subcategoriaProdutos">Categoria</label>
          <select 
                 type="text" 
                 id="subcategoriaProduto" 
                 name="subcategoriaProduto"
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
   
        <div className="camposimples">

        <label htmlFor="categoriaProduto">Subcategoria</label>
          <select
                 type="text" 
                 id="categoriaProduto" 
                 name="categoriaProduto"
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
        <div className="camposimples">

<label htmlFor="categoriaProduto">Descrição</label>
  <input
         type="text" 
         id="categoriaProduto" 
         name="categoriaProduto"
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
        
          <button type="submit">Cadastrar</button>
         
    </form>

  </div>
  </div>
  </>
  );
}