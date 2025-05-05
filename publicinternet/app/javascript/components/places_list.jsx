import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";

class Placelist extends React.Component {
    render() {
        return (
            <div>   places list  rendered react </div>
        );
    }
}



// adicionar o javascript aqui para renderizar o react id="places-list-container"
const placeList = ReactDOM.createRoot(document.getElementById("places-list-container"));
placeList.render(<placeList  />);
