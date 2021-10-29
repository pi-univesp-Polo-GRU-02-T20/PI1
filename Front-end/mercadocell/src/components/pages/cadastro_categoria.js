import React, { useState } from 'react';
import '../../App.css';

//Colocar em todos -------------------------------------------------------------------------------------------------------------------

export default function Cadastro_categoria() {
  const [formValues, setFormValues] = useState({});       //Parte 1
 
  const onChange = (e) => {
    const { name, value, type, checked } = e.target       //Parte 2.1 
    const isCheckbox = type === 'checkbox';               //Parte 2.2

    const data = formValues[name] || {};                  //Parte 2.3
    if (isCheckbox) {
      data[value] = checked;
  }

  const newValue = isCheckbox ? data : value;             //Parte 2.4
  setFormValues({ ...formValues, [name]: newValue });     //Parte 2.5
};

  function Enviar(e) {                                     //Parte 3.0 
    alert("Categoria cadastrada.");
    e.preventDefault();                                    //Previne o comportamento padrão de enviar o formulário via GET
    const formData = new FormData(e.target);               //Parte 3.2
    const data = Object.fromEntries(formData);             //Parte 3.4
//  axios.post                                             //Estudar como colocar   
    console.log('Enviado', data);                          //Parte 3.5
  }

//Colocar em todos ---------------------------------------------------------------------------------------------------------------

  return (
  <div className="fundo_pagina">
  <div className="fundo_formulario">

      <form onSubmit={Enviar}>

        <div className="formulario">
          <h1>Cadastrar Categoria</h1>
          <br></br>
        </div>

        <div className="formulario">
          <label htmlfor="codigodacategoria"> Código </label>
          <input id="codigodacategoria" name="codigodacategoria" type="text" onChange={onChange} value={formValues.codigodacategoria || ''} />
        </div>

        <div className="formulario">
          <label htmlfor="nomedacategoria"> Nome da categoria </label>
          <input id="nomedacategoria" name="nomedacategoria" type="text" onChange={onChange} value={formValues.nomedacategoria || ''} />
        </div>

        <div className="formulario"> 
          <button type="submit">Cadastrar</button>
        </div>
         
      </form>

  </div>
  </div>
  );
}