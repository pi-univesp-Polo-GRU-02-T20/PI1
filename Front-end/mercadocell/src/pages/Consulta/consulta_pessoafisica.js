import Navbar from '../../components/Menu/Navbar';
import MaterialTable from "material-table";
import React, { useEffect, useState } from "react";
import './consulta.css';
import axios from "axios";

export default function Consulta_pessoafisica() {

    var url = "http://localhost:8080/pessoaFisica/"

    const [entries, setEntries] = useState({
        data: [
            {
                codPessoa: "",
                dataNascimento: "",
                estadoNaturalidade: "",
                nomePessoa: "",
                tipoSexo:""
            }
        ]
    });

    const [state] = React.useState({
        columns: [
            { title: "Código da Pessoa", field: "codPessoa", editable:false},
            { title: "Data de Nascimento", field: "dataNascimento" },
            { title: "Naturalidade", field: "estadoNaturalidade" },
            { title: "Nome", field: "nomePessoa" },
            { title: "Sexo", field: "tipoSexo" }
        ]
    });

    useEffect(() => {
        axios
        .get("http://localhost:8080/pessoaFisica")
        .then(response => {
        let data = [];
    response.data.forEach(el => {
      data.push(
        {
        codPessoa: el.codPessoa,
        dataNascimento: el.dataNascimento, 
        estadoNaturalidade: el.estadoNaturalidade,
        nomePessoa: el.nomePessoa,
        tipoSexo: el.tipoSexo
        }
    );
});
    setEntries({ data: data });
})
.catch(function(error) {
        console.log(error);
    });
}, []);

    return (
      <>
      <Navbar />
        <MaterialTable
    title="Consulta de Pessoa Física"
    data={entries.data}
    columns={state.columns}
    editable={{
        onRowUpdate: (newData, oldData) =>
        new Promise(resolve => {
            setTimeout(() => {
            resolve();
            const data = [...entries.data];
            data[data.indexOf(oldData)] = newData;
            axios
                .put("http://localhost:8080/pessoaFisica", newData, {
                    params: {
                      codPessoa: entries.data[0].codPessoa
                    }
                })
                .then(res => console.log(res.data));
            setEntries({ ...entries, data });
        }, 600);
    }),
        onRowDelete: oldData =>
        new Promise(resolve => {
            setTimeout(() => {
            resolve();
            const data = [...entries.data];
            data.splice(data.indexOf(oldData), 1);
            axios
            .delete(url + oldData.codPessoa)
                .then(res => console.log(res.data));
            setEntries({ ...entries, data });
        }, 600);
    })
    }}
    localization={{
      body: {
        emptyDataSourceMessage: 'Nenhum registro para exibir',
        addTooltip: "Adicionar",
        deleteTooltip: "Deletar",
        editTooltip: "Editar",
        editRow: {
          saveTooltip: "Salvar",
          cancelTooltip: "Cancelar",
          deleteText: "Tem certeza que deseja deletar este registro?"
        },
      },
      header: {
        actions: 'Ações'
      },
      toolbar: {
        searchTooltip: 'Pesquisar',
        searchPlaceholder: 'Pesquisar'
      },
      pagination: {
        labelRowsSelect: 'linhas',
        labelDisplayedRows: '{count} de {from}-{to}',
        firstTooltip: 'Primeira página',
        previousTooltip: 'Página anterior',
        nextTooltip: 'Próxima página',
        lastTooltip: 'Última página'
      }
    }}
    />
    </>
);
}