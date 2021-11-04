import React, { Component } from 'react';
import Api from '../../components/Services/Api'

  class App extends Component {

    state = {
      categorias: [],
    }
  
    async componentDidMount() {
      const response = await Api.get('/categoria');
  
      this.setState({ categorias: response.data });
    }
  
    render() {
  
      const { categorias } = this.state;
      
      return (
      <>
              {categorias.map(filme => (
              <option>{filme.nomeCategoria}</option>
              ))}
      </>
        );
    };
  };

export default App;