import React, { useState } from 'react';
import './Dropdown.css';
import { Link } from 'react-router-dom';

const MenuItems = [
  {
    title: 'Categoria',
    path: '/consulta-categoria',
    cName: 'dropdown-link'
  },
  {
    title: 'Subcategoria',
    path: '/consulta-subcategoria',
    cName: 'dropdown-link'
  },
  {
    title: 'Unidade de Medida',
    path: '/consulta-unidadedemedida',
    cName: 'dropdown-link'
  },
  {
    title: 'Produto',
    path: '/consulta-produto',
    cName: 'dropdown-link'
  },
  {
    title: 'Cliente',
    path: '/consulta-cliente',
    cName: 'dropdown-link'
  },
  {
    title: 'Fornecedor',
    path: '/consulta-fornecedor',
    cName: 'dropdown-link'
  },
  {
    title: 'Compra',
    path: '/development',
    cName: 'dropdown-link'
  },
  {
    title: 'Venda',
    path: '/development',
    cName: 'dropdown-link'
  }
];


function Dropdown2() {
  const [click, setClick] = useState(false);
  const handleClick = () => setClick(!click);

  return (
    <>
      <ul
        onClick={handleClick}
        className={click ? 'dropdown-menu clicked' : 'dropdown-menu'}
      >
        {MenuItems.map((item, index) => {
          return (
            <li key={index}>
              <Link
                className={item.cName}
                to={item.path}
                onClick={() => setClick(false)}
              >
                {item.title}
              </Link>
            </li>
          );
        })}
      </ul>
    </>
  );
}

export default Dropdown2;
