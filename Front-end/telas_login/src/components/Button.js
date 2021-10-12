import React from 'react';
import './Button.css';
import { Link } from 'react-router-dom';

export function Button() {
  return (
    <Link to='sign-up'>
      <button className='btn' to='pages/home.js'>Sair</button>
    </Link>
  );
}
