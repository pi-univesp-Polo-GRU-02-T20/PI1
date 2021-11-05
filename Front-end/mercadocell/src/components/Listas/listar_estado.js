import React, { Component } from 'react';
import Api from '../Services/Api'

  class Listar_estado extends Component {

    state = {
      estados: [],
    }
  
    async componentDidMount() {
      const response = await Api.get('/categoria');
  
      this.setState({ estados: response.data });
    }
  
    render() {
  
      const { estados } = this.state;
      
      return (
      <>
              {estados.map(filme => (
              <option id="nomeEstado" name="nomeEstado" value={filme.codEstado} key={filme.codEstado}>{filme.nomeEstado}</option>
              ))}
      </>
        );
    };
  };

export default Listar_estado;