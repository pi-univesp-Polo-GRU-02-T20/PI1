import React, { Component } from 'react';
import Api from '../Services/Api'

  class Listar_unidadedemedida extends Component {

    state = {
      unidadesdemedida: [],
    }
  
    async componentDidMount() {
      const response = await Api.get('/unidadeMedida');
  
      this.setState({ unidadesdemedida: response.data });
    }
  
    render() {
  
      const { unidadesdemedida } = this.state;
      
      return (
      <>
              {unidadesdemedida.map(filme => (
              <option id="nomeUnidadeMedida" name="nomeUnidadeMedida" value={filme.codUnidadeMedida} key={filme.codUnidadeMedida}>{filme.nomeUnidadeMedida}</option>
              ))}
      </>
        );
    };
  };

export default Listar_unidadedemedida;