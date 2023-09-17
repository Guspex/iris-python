import React, {/*useState,*/ useCallback} from 'react';
import './style.css'; 

//Importar api para fazer uma chamada, get, post, put, delete ...
import mapGeral from '../map.png'

function MenuBar() {

//Setar algum valor futuramente
 //const [value, setValue] = useState('');

  //Menu básico e botão para executar a chamada a API, somente para testes
  return (
    <>
    <div className="menu-bar">
      <ul>
        <li><a href="/">Função A</a></li>
        <li><a href="/BBBB">Função B</a></li>
        <li><a href="/CCCC">Função C</a></li>
        <li><a href="/DDDD">Função D</a></li>
      </ul>
    </div>

    <img src={mapGeral} alt=""/>
    </>
  );
}

export default MenuBar;
