import React from 'react';
import Navbar from './components/Navbar';
//import './App.css';
import Home from './components/pages/Home';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import Cadastro_categoria from './components/pages/cadastro_categoria';
import Cadastro_subcategoria from './components/pages/cadastro_subcategoria';
import Cadastro_unidadedemedida from './components/pages/cadastro_unidadedemedida';
import Cadastro_produto from './components/pages/cadastro_produto';
import Cadastro_cliente from './components/pages/cadastro_cliente';
import Cadastro_fornecedor from './components/pages/cadastro_fornecedor';
import Movimentacao_compra from './components/pages/movimentacao_compra';
import Movimentacao_venda from './components/pages/movimentacao_venda';
import Movimentacao_recebimento from './components/pages/movimentacao_recebimento';
import Movimentacao_pagamento from './components/pages/movimentacao_pagamento';
//import Modelo from './components/pages/modelo';

function App() {
  return (
    <Router>
      <Navbar />
      <Switch>
        <Route path='/' exact component={Home} />
        <Route path='/cadastro-categoria' component={Cadastro_categoria} />
        <Route path='/cadastro-subcategoria' component={Cadastro_subcategoria} />
        <Route path='/cadastro-unidadedemedida' component={Cadastro_unidadedemedida} />
        <Route path='/cadastro-produto' component={Cadastro_produto} />
        <Route path='/cadastro-cliente' component={Cadastro_cliente} />
        <Route path='/cadastro-fornecedor' component={Cadastro_fornecedor} />
        <Route path='/movimentacao-compra' component={Movimentacao_compra} />
        <Route path='/movimentacao-venda' component={Movimentacao_venda} />
        <Route path='/movimentacao-recebimento' component={Movimentacao_recebimento} />
        <Route path='/movimentacao-pagamento' component={Movimentacao_pagamento} />
        <Route path='/sign-up' component={Home} />
      </Switch>
    </Router>
  );
}

export default App;