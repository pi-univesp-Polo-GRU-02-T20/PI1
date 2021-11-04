import Navbar from '../../components/Menu/Navbar';
import './consulta.css';
import React, { useState, useEffect } from 'react';
import MaterialTable from 'material-table';
//import Api from '../../components/Services/Api';


export default function Cadastro_categoria() {

  const [data, setData] = useState([])
  const columns = [
    { title: "Código do Produto", field: "codProduto" },
    { title: "Nome", field: "nomeProduto" },
    { title: "Descrição", field: "descricaoProduto" },
  //  { title: "Código da Categoria", field: ".categoria.nomeCategoria" },
  //  { title: "Nome da Categoria", field: "categoria.nomeCategoria" },
  //  { title: "Código da Subcategoria", field: "subCategoria.nomeCategoria" },
  //  { title: "Nome da Subcategoria", field: "subCategoria.nomeCategoria" },
  ]
  useEffect(() => {
    fetch("http://localhost:8080/produto")
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
        title="Consulta de Produto"
        data={data}
        columns={columns}
      />
    </div>
    </>
  );
}