import React, { useState } from 'react';
import '../../App.css';

const initialValue = {
  codigodacategoria: '',
  nomedacategoria: ''
}

export default function Cadastro_produto() {
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
          <h1>Cadastrar Produto</h1>
          <br></br>
        </div>

        <div className="formulario">
          <label htmlfor="codigodacategoria"> Nome do Produto </label>
          <input id="codigodacategoria" name="codigodacategoria" type="text" onChange={onChange} />
        </div>

        <div className="formulario">
          <label htmlfor="nomedacategoria"> Descrição </label>
          <input id="nomedacategoria" name="nomedacategoria" type="text" onChange={onChange} />
        </div>

        <div className="formulario">
          <label htmlfor="nomedacategoria"> Categoria </label>
          <input id="nomedacategoria" name="nomedacategoria" type="text" onChange={onChange} />
        </div>

        <div className="formulario">
          <label htmlfor="nomedacategoria"> Subcategoria </label>
          <input id="nomedacategoria" name="nomedacategoria" type="text" onChange={onChange} />
        </div>

        <div className="formulario"> 
          <button type="submit">Salvar</button>
        </div>
         
      </form>

  </div>
  </div>
  );
}