import React, { useState } from 'react';
import './Dropdown.css';
import { Link } from 'react-router-dom';

const MenuItems = [
  {
    title: 'Compra',
    path: '/marketing',
    cName: 'dropdown-link'
  },
  {
    title: 'Venda',
    path: '/consulting',
    cName: 'dropdown-link'
  },
  {
    title: 'Recebimento',
    path: '/design',
    cName: 'dropdown-link'
  },
  {
    title: 'Pagamento',
    path: '/development',
    cName: 'dropdown-link'
  }
];


function Dropdown3() {
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

export default Dropdown3;
