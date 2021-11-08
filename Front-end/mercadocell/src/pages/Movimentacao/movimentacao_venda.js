import React from 'react';
import Navbar from '../../components/Menu/Navbar';
import { useForm } from "react-hook-form";
import { ErrorMessage } from '@hookform/error-message';
import './movimentacao_venda.css';
import axios from 'axios';

export default function Movimentacao_venda() {

  const { register, handleSubmit, formState: { errors } } = useForm();
  const onSubmit = (data) => { 
    console.log(data);
    axios.post("http://localhost:8080/produto", data);
  }

  return (
  <>
  <Navbar />
  
  <div className="fundo_pagina">

    <form className="compra_form" onSubmit = { handleSubmit(onSubmit) } >

    <div className="compra_titulo">
    <h1>Operação de Venda</h1>
    </div>

    <div className="compra_linha">

      <div className="compra_campo">

          <label htmlFor="nomeProduto">Código da Nota Fiscal</label>
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
        
          <ErrorMessage errors={errors} name="nomeProduto">
            {({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
          </ErrorMessage>

      </div>

    </div>

    <div className="compra_linha">

      <div className="compra_campo">

          <label htmlFor="nomeCategoria">Operação</label>
          <select 
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
           >
             <option>Pedido</option>
             <option>Orçamento</option>
          </select>
                             
        <ErrorMessage errors={errors} name="nomeCategoria">
        {({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
        </ErrorMessage>

      </div>

      <div className="compra_campo2">

<label htmlFor="nomeSubCategoria">Data da Operação</label>
<input 
       type="date" 
       id="nomeSubCategoria" 
       name="nomeSubCategoria"
       {...register("nomeSubCategoria", {
        required: 'Preenchimento Obrigatório',
        minLength: {
          value: 2,
          message: 'No minimo dois caracteres' 
        }
      })}
 />

<ErrorMessage errors={errors} name="nomeSubCategoria">
{({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
</ErrorMessage>

</div>

    </div>

    <div className="compra_linha">

<div className="compra_campo">

    <label htmlFor="nomeCategoria">Quantidade de parcelas</label>
    <select 
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
     >
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        <option>6</option>
        <option>7</option>
        <option>8</option>
        <option>9</option>
        <option>10</option>
        <option>11</option>
        <option>12</option>
    </select>
                       
  <ErrorMessage errors={errors} name="nomeCategoria">
  {({ messages }) => messages && Object.entries(messages).map(([type, message]) => ( <p key={type}>{message}</p>))}
  </ErrorMessage>

</div>

<div className="compra_campo2">

<label htmlFor="nomeSubCategoria">Valor Total (R$)</label>
<input 
 type="number"
 min="1" 
 step="any" 
 id="nomeSubCategoria" 
 name="nomeSubCategoria"
 {...register("nomeSubCategoria", {
  required: 'Preenchimento Obrigatório',
  minLength: {
    value: 2,
    message: 'No minimo dois caracteres' 
  }
})}
/>

<ErrorMessage errors={errors} name="nomeSubCategoria">
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