import Navbar from '../../components/Menu/Navbar';
import './consulta.css';
import React, { useState, useEffect } from 'react';
import MaterialTable from 'material-table';
//import Api from '../../components/Services/Api';


export default function Consulta_subcategoria() {

  const [data, setData] = useState([])
  const columns = [
    { title: "Código da Subcategoria", field: "codSubCategoria" },
    { title: "Número da Subcategoria", field: "nomeSubCategoria" },
    { title: "Código da Categoria", field: "categoria.codCategoria" },
    { title: "Número da Categoria", field: "categoria.nomeCategoria" },
  ]
  useEffect(() => {
    fetch("http://localhost:8080/subCategoria")
      .then(resp => resp.json())
      .then(resp => {
        setData(resp)
      })
  }, [])

  return (
    <>
    <Navbar />
    <div className="tabela">
      <MaterialTable
        title="Consulta de Subcategoria"
        data={data}
        columns={columns}
      />
    </div>
    </>
  );
}