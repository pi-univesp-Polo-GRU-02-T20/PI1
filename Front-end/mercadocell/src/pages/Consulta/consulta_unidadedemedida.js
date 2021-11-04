import Navbar from '../../components/Menu/Navbar';
import './consulta.css';
import React, { useState, useEffect } from 'react';
import MaterialTable from 'material-table';
//import Api from '../../components/Services/Api';


export default function Consuta_unidadedemedida() {

  const [data, setData] = useState([])
  const columns = [
    { title: "Código", field: "codUnidadeMedida" },
    { title: "Unidade", field: "nomeUnidadeMedida" },
    { title: "Sigla", field: "siglaUnidadeMedida" },
  ]
  useEffect(() => {
    fetch("http://localhost:8080/unidadeMedida")
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
        title="Consulta de Unidade de Medida"
        data={data}
        columns={columns}
      />
    </div>
    </>
  );
}