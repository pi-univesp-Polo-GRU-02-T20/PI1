import React, { useState } from 'react';
import '../../App.css';
import Navbar from '../../components/Menu/Navbar';

const initialValue = {
  codigodacategoria: '',
  nomedacategoria: ''
}

export default function Cadastro_cliente() {
  const  [values, setValues] = useState(initialValue);
 
  function onChange(ev) {
    const { name, value } = ev.target;
  
    setValues({ ...values, [name]: value });
  }

  function onSubmit(ev) {
    ev.preventDefault();
    alert("Categoria cadastrada.");

  }

  return (
  <div className="fundo_pagina">
  <div className="fundo_formulario">

      <form onSubmit={onSubmit}>

        <div className="formulario">
          <h1>Cadastrar Cliente</h1>
          <br></br>
        </div>


        <div className="formulario2">
        <div className="formulario">
          <label htmlfor="codigodacategoria"> Nome </label>
          <input id="codigodacategoria" name="codigodacategoria" type="text" onChange={onChange} />
        </div>

        <div className="formulario">
          <label htmlfor="nomedacategoria"> CPF </label>
          <input id="nomedacategoria" name="nomedacategoria" type="text" onChange={onChange} />
        </div>
        </div>

        <div className="formulario2">
        <div className="formulario">
          <label htmlfor="nomedacategoria"> Telefone </label>
          <input id="nomedacategoria" name="nomedacategoria" type="text" onChange={onChange} />
        </div>

        <div className="formulario">
          <label htmlfor="nomedacategoria"> Email </label>
          <input id="nomedacategoria" name="nomedacategoria" type="email" onChange={onChange} />
        </div>
        </div>



        
        <div className="formulario">
          <label htmlfor="nomedacategoria"> Sexo </label>
          <div className="formulario3">
             <input id="nomedacategoria" name="nomedacategoria" type="radio" onChange={onChange} />
             Masculino
             <input id="nomedacategoria" name="nomedacategoria" type="radio" onChange={onChange} />
             Feminino
          </div>
        </div>



        <div className="formulario">
          <label htmlfor="nomedacategoria"> CEP </label>
          <input id="nomedacategoria" name="nomedacategoria" type="text" onChange={onChange} />
        </div>

        <div className="formulario2">
        <div className="formulario">
          <label htmlfor="nomedacategoria"> Endereço </label>
          <input id="nomedacategoria" name="nomedacategoria" type="text" onChange={onChange} />
        </div>

        <div className="formulario">
          <label htmlfor="nomedacategoria"> Número </label>
          <input id="nomedacategoria" name="nomedacategoria" type="text" onChange={onChange} />
        </div>
        </div>

        <div className="formulario">
          <label htmlfor="nomedacategoria"> Complemento </label>
          <input id="nomedacategoria" name="nomedacategoria" type="text" onChange={onChange} />
        </div>

        <div className="formulario"> 
          <button type="submit">Cadastrar</button>
        </div>
         
      </form>

  </div>
  </div>
  );
}