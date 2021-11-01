import React from 'react';

import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';

import StoreProvider from '../components/Store/Provider';
import RoutesPrivate from '../components/Routes/Private/Private';

import Login from './Login/Login';
import Home from './Home/Home';

import Cadastro_categoria from './Cadastro/cadastro_categoria';
import Cadastro_subcategoria from './Cadastro/cadastro_subcategoria';
import Cadastro_unidadedemedida from './Cadastro/cadastro_unidadedemedida';
import Cadastro_produto from './Cadastro/cadastro_produto';
import Cadastro_cliente from './Cadastro/cadastro_cliente';
import Cadastro_fornecedor from './Cadastro/cadastro_fornecedor';
import Movimentacao_compra from './Movimentacao/movimentacao_compra';
import Movimentacao_venda from './Movimentacao/movimentacao_venda';
import Movimentacao_recebimento from './Movimentacao/movimentacao_recebimento';
import Movimentacao_pagamento from './Movimentacao/movimentacao_pagamento';
import Consulta_categoria from './Consulta/consulta_categoria';
import Consulta_cliente from './Consulta/consulta_cliente';


const PagesRoot = () => (
    <Router>
      <StoreProvider>
        <Switch>
          <Route path="/login" component={Login} />
          <RoutesPrivate path="/" exact component={Home} />  
          <RoutesPrivate path='/cadastro-categoria' component={Cadastro_categoria} />
          <RoutesPrivate path='/cadastro-subcategoria' component={Cadastro_subcategoria} />
          <RoutesPrivate path='/cadastro-unidadedemedida' component={Cadastro_unidadedemedida} />
          <RoutesPrivate path='/cadastro-produto' component={Cadastro_produto} />
          <RoutesPrivate path='/cadastro-cliente' component={Cadastro_cliente} />
          <RoutesPrivate path='/cadastro-fornecedor' component={Cadastro_fornecedor} />
          <RoutesPrivate path='/consulta-categoria' component={Consulta_categoria} />
          <RoutesPrivate path='/consulta-cliente' component={Consulta_cliente} />
          <RoutesPrivate path='/movimentacao-compra' component={Movimentacao_compra} />
          <RoutesPrivate path='/movimentacao-venda' component={Movimentacao_venda} />
          <RoutesPrivate path='/movimentacao-recebimento' component={Movimentacao_recebimento} />
          <RoutesPrivate path='/movimentacao-pagamento' component={Movimentacao_pagamento} />
          <RoutesPrivate path='/sign-up' component={Home} />
        </Switch>
      </StoreProvider>
    </Router>
  )

export default PagesRoot;