import Navbar from '../../components/Menu/Navbar';
import '../../cliente.css';
import React, { useState, useEffect } from 'react';
import MaterialTable from 'material-table';
//import Api from '../../components/Services/Api';


export default function Cadastro_categoria() {

  const [data, setData] = useState([])
  const columns = [
    { title: "Código da categoria", field: "codCategoria" },
    { title: "Número da categoria", field: "nomeCategoria" },
  ]
  useEffect(() => {
    fetch("http://localhost:8080/categoria")
      .then(resp => resp.json())
      .then(resp => {
        setData(resp)
      })
  }, [])

  return (
    <>
    <Navbar />
    <div className="App">
      <MaterialTable
        title="Consulta de Categoria"
        data={data}
        columns={columns}
      />
    </div>
    </>
  );
}