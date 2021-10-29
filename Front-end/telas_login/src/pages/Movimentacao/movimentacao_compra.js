import React, { Component, useState } from 'react';
import Api from '../../components/Services/Api'
import '../../App.css';

class App extends Component{

  state = {
    artigos: [], 
  }

  async componentDidMount(){
    const response = await Api.get('/categoria');
    //console.log(response.data)
    this.setState({artigos: response.data});
  }

  render(){

    const { artigos } = this.state;

    console.log(artigos);

    return(

        <div>
          <h1>Listar os Filmes</h1>
          {artigos.map(artigo => (
              <h2>
                <strong>Título: </strong>
                {artigo.show.codCategoria}
              </h2>
              <p>
                {artigo.show.nomeCategoria}
              </p>
          ))}
        </div>
      );
    };
  };
  
  export default App;