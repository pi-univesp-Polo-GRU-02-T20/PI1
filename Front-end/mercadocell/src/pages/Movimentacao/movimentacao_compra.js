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

        </div>
      );
    };
  };
  
  export default App;