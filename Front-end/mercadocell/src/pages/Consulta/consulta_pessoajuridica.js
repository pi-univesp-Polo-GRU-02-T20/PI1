import Navbar from '../../components/Menu/Navbar';
import MaterialTable from "material-table";
import React, { useEffect, useState } from "react";
import './consulta.css';
import axios from "axios";

export default function Consulta_pessoajuridica() {

    var url = "http://localhost:8080/pessoaJuridica/"

    const [entries, setEntries] = useState({
        data: [
            {
                codCNPJ: "",
                codPessoa: "",
                codPessoaJuridica: "",
                nomePessoa: "",
                nomeRazaoSocial:""
            }
        ]
    });

    const [state] = React.useState({
        columns: [
            { title: "CNPJ", field: "codCNPJ", editable:false},
            { title: "Código da Pessoa", field: "codPessoa" },
            { title: "Código da Pessoa Jurídica", field: "codPessoaJuridica" },
            { title: "Nome Pessoa", field: "nomePessoa" },
            { title: "Nome Razão Social", field: "nomeRazaoSocial" }
        ]
    });

    useEffect(() => {
        axios
        .get("http://localhost:8080/pessoaJuridica")
        .then(response => {
        let data = [];
    response.data.forEach(el => {
      data.push(
        {
        codCNPJ: el.codCNPJ,
        codPessoa: el.codPessoa, 
        codPessoaJuridica: el.codPessoaJuridica,
        nomePessoa: el.nomePessoa,
        nomeRazaoSocial: el.nomeRazaoSocial
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
    title="Consulta de Pessoa Jurídica"
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
                .put("http://localhost:8080/pessoaJuridica", newData, {
                    params: {
                      codCNPJ: entries.data[0].codCNPJ
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
            .delete(url + oldData.codCNPJ)
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