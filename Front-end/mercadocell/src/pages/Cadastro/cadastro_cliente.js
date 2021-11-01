import React from 'react';
import Navbar from '../../components/Menu/Navbar';
import { useForm } from "react-hook-form";
import { ErrorMessage } from '@hookform/error-message';
import '../../cliente.css';
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
    <h1>Cadastrar Cliente</h1>
    </div>

    <div className="campoduplo">
        <div className="camposimples">

        <label htmlFor="categoriaProduto">Nome do Cliente</label>
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

        <div className="camposimples">

        <label htmlFor="subcategoriaProdutos">CPF/CNPJ</label>
          <input 
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

        <label htmlFor="categoriaProduto">Telefone</label>
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

        <div className="camposimples">

        <label htmlFor="subcategoriaProdutos">E-mail</label>
          <input 
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
        </div>

        <div className="campoduplo2">
        <div className="camposimples">

          <label htmlFor="nomeProduto"> CEP</label>
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

        <div className="camposimples">

        <label htmlFor="categoriaProduto">Endereço</label>
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

        <div className="camposimples">

        <label htmlFor="subcategoriaProdutos">Número</label>
          <input 
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
        </div>

        <div className="campolongo">

          <label htmlFor="complemento">Complemento</label>
          <input
                 type="text" 
                 id="complemento" 
                 name="complemento"
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
        
          <button type="submit">Cadastrar</button>
         
    </form>

  </div>
  </div>
  </>
  );
}