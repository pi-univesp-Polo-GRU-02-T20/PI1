import React from 'react';
import Navbar from '../../components/Menu/Navbar';
import { useForm } from "react-hook-form";
import { ErrorMessage } from '@hookform/error-message';
import './cadastro_subcategoria.css';
import axios from 'axios';
import Listar_categoria from '../../components/Listas/listar_categoria';

export default function Cadastro_subcategoria() {

  const { register, handleSubmit, formState: { errors } } = useForm();
  const onSubmit = (data) => { 
    console.log(data);
    axios.post("http://localhost:8080/subCategoria", data);
  }

  return (
  <>
  
  <Navbar />
  
  <div className="fundo_pagina">

    <form className = "subCategoria_form" onSubmit = { handleSubmit(onSubmit) } >

    <div className="subCategoria_titulo">
      <h1>Cadastrar Subcategoria</h1>
    </div>

        <div className="subCategoria_linha">
        <div className="subCategoria_campo">

          <label htmlFor="selecionarCategoria"> Categoria </label>
          <select 
                 type="text" 
                 id="selecionarCategoria" 
                 name="selecionarCategoria"
                 {...register("selecionarCategoria", {
                  required: 'Preenchimento Obrigatório',
                  minLength: {
                    value: 2,
                    message: 'No minimo dois caracteres' 
                  }
                })}
           >
             <Listar_categoria />
           </select>
        
           <ErrorMessage errors={errors} name="nomeCategoria">
             {({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
           </ErrorMessage>

        </div>
        </div>

        <div className="subCategoria_linha">
        <div className="subCategoria_campo">

          <label htmlFor="nomeSubcategoria"> Nome da Subcategoria </label>
          <input 
                 type="text" 
                 id="nomeSubcategoria" 
                 name="nomeSubcategoria"
                 {...register("nomeSubcategoria", {
                  required: 'Preenchimento Obrigatório',
                  minLength: {
                    value: 2,
                    message: 'No minimo dois caracteres' 
                  }
                })}
          />
        
           <ErrorMessage errors={errors} name="nomeSubcategoria">
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