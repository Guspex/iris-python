import React, {/*useState,*/ useCallback} from 'react';
import './style.css'; 

//Importar api para fazer uma chamada, get, post, put, delete ...
import api from '../services/index.js'

function MenuBar() {

//Setar algum valor futuramente
 //const [value, setValue] = useState('');

 //Exemplo de chamada ao backend, por enquanto não busca nada
  const chamadaBack = useCallback(
    async (value) => {
      await api.post("/teste", {value: "value"})
        .then((res) => {
          console.log(res.data)

        })
        .catch((err) => {
          console.error(err);
        });
    },
    []
  );

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
    <button onClick={chamadaBack}>Teste chamada</button>
    </>
  );
}

export default MenuBar;
