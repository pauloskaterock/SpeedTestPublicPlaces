// Importa o componente `Link` da biblioteca `react-router-dom`.
// O `Link` é usado para navegação entre páginas no React sem recarregar o navegador.

import React from "react";
import ReactDOM from "react-dom/client";
// Importa o React e o ReactDOM para renderizar componentes React no DOM.
// O React é uma biblioteca JavaScript para construir interfaces de usuário.
//import { Link } from "react-router-dom";

// Define uma classe chamada `Placelist` que herda de `React.Component`.
class Placelist extends React.Component {
    render() {
        return (
            // Retorna um simples `<div>` com um texto dentro.
            // Esse componente, quando renderizado, exibirá "places list rendered react".
            <div>places list rendered react</div>
        );
    }
}

// Criando um ponto de entrada para o React dentro da página HTML.
// `ReactDOM.createRoot` é usado para iniciar a renderização em uma raiz específica do DOM.
const placeList = ReactDOM.createRoot(document.getElementById("places-list-container"));

// Aqui ocorre um erro! O nome do componente deveria estar em **maiúscula**.
// Correção: Substituir `<placeList />` por `<Placelist />`.
placeList.render(<Placelist />);
