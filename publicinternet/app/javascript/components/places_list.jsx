import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import ReactDOM from "react-dom/client";

// Função que renderiza a página principal dos lugares
function renderPlacesPage(body, onSearchTextChange) {
  return (
    <div className="bg-white p-8 rounded-md w-full">
      <div className="flex items-center justify-between pb-6">
        <div>
          <h2 className="text-4xl text-gray-600 font-semibold">Places</h2>
        </div>
        <div className="flex items-center justify-between">
          <div className="flex bg-gray-50 items-center p-2 rounded-md">
            <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 text-gray-400" viewBox="0 0 20 20"
              fill="currentColor">
              <path
                d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                />
            </svg>
            <input
              className="bg-gray-50 outline-none ml-1 block w-full"
              type="text"
              placeholder="search..."
              onChange={onSearchTextChange}
              />
          </div>
          <div className="lg:ml-40 ml-10 space-x-8">
            <Link to="/new-internet-speed">
              <button className="bg-indigo-600 px-4 py-2 rounded-md text-white font-semibold tracking-wide cursor-pointer">New Log</button>
            </Link>
          </div>
        </div>
      </div>
      {body}
    </div>
  );
}

// Componente principal PlacesList
export default function PlacesList() {
  // Definição de estados para controlar a lógica do componente
  const [loading, setLoading] = useState(true);
  const [loadedPlaces, setLoadedPlaces] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [sortColumn, setSortColumn] = useState("name");
  const [sortOrder, setSortOrder] = useState("asc");

  // Efeito para carregar os dados ao mudar filtros
  useEffect(() => {
    const apiEndpoint = `/api/places?search_term=${searchTerm}&sort_column=${sortColumn}&sort_order=${sortOrder}`;
    fetch(apiEndpoint)
      .then(response => response.json())
      .then(data => {
        console.log(data);
        setLoadedPlaces(data["places"]);
        setLoading(false);
      });
  }, [searchTerm, sortColumn, sortOrder]);

  // Função para atualizar o termo de busca
  const onSearchTextChange = (e) => {
    setLoading(true);
    setSearchTerm(e.target.value);
  };

  // Função para ordenar os dados ao clicar no cabeçalho
  const handleHeaderClick = (clickedSortColumn) => {
    if (clickedSortColumn === sortColumn) {
      setSortOrder(sortOrder === "asc" ? "desc" : "asc");
    } else {
      setSortColumn(clickedSortColumn);
      setSortOrder("asc");
    }
  };

  // Se estiver carregando, mostra um "Loading..."
  if (loading) {
    return <div>Loading...</div>;
  }

  return renderPlacesPage(
    <table className="min-w-full border-collapse border border-gray-300">
      <thead>
        <tr className="bg-gray-200">
          <th onClick={() => handleHeaderClick("name")} className="cursor-pointer border p-2">Name</th>
          <th onClick={() => handleHeaderClick("city")} className="cursor-pointer border p-2">City</th>
          <th onClick={() => handleHeaderClick("upload_speed")} className="cursor-pointer border p-2">Recent Upload Speed</th>
          <th onClick={() => handleHeaderClick("upload_units")} className="cursor-pointer border p-2">Recent Upload Speed Units</th>
          <th onClick={() => handleHeaderClick("measurements_count")} className="cursor-pointer border p-2">Number of Measurements</th>
        </tr>
      </thead>
      <tbody>
        {loadedPlaces.map((place, index) => (
          <tr key={index} className="border">
            <td className="border p-2">{place.name}</td>
            <td className="border p-2">{place.city}</td>
            <td className="border p-2">{place.most_recent_upload_speed}</td>
            <td className="border p-2">{place.most_recent_upload_units}</td>
            <td className="border p-2">{place.number_of_measurements}</td>
          </tr>
        ))}
      </tbody>
    </table>,
    onSearchTextChange
  );
}

// Criando um ponto de entrada para renderizar React no DOM
const placeList = ReactDOM.createRoot(document.getElementById("places-list-container"));

// Renderiza corretamente o componente principal
placeList.render(<PlacesList />);
