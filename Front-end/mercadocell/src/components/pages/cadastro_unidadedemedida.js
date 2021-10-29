import React, { useState } from 'react';
import '../../App.css';

const initialValue = {
  codigodacategoria: '',
  nomedacategoria: ''
}

export default function Cadastro_unidadedemedida() {
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
          <h1>Cadastrar Unidade de Medida</h1>
          <br></br>
        </div>

        <div className="formulario">
          <label htmlfor="codigodacategoria"> Código </label>
          <input id="codigodacategoria" name="codigodacategoria" type="text" onChange={onChange} />
        </div>

        <div className="formulario">
          <label htmlfor="nomedacategoria"> Nome da unidade de medida </label>
          <input id="nomedacategoria" name="nomedacategoria" type="text" onChange={onChange} />
        </div>

        <div className="formulario">
          <label htmlfor="nomedacategoria"> Sigla da Unidade de Medida </label>
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