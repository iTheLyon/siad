import { useState, useEffect } from "react";
import { FaMoneyBillWave, FaUsers, FaSearch, FaUpload } from "react-icons/fa";
import Historial from "./Historial";
import io from "socket.io-client";

export default function Clientes() {
  const [clientes, setClientes] = useState([]);
  const [busqueda, setBusqueda] = useState("");
  const [clienteSeleccionado, setClienteSeleccionado] = useState(null);

  const API_BASE_URL = process.env.REACT_APP_API_BASE_URL;
  const socket = io(process.env.REACT_APP_NODE_BASE_URL, {
    transports: ["websocket"], // Asegura el uso del protocolo WebSocket
  });
  useEffect(() => {
    fetch(API_BASE_URL+"/clientes")
      .then((res) => res.json())
      .then(setClientes);

    // Escuchar actualización de saldo desde WebSocket
    socket.on("saldoActualizado", ({ clienteId, nuevoSaldo }) => {
      setClientes((clientesPrevios) =>
        clientesPrevios.map((cliente) => {
          if(cliente.id === clienteId) {
            console.log("Actualizando saldo de cliente", clienteId, "a", nuevoSaldo);
            cliente.saldo = nuevoSaldo;
          }
          return cliente;          
        })
      );
    });
    return () => {
      socket.off("saldoActualizado");
    };

  }, []);

  const clientesFiltrados = clientes.filter(cliente =>
    cliente.dni.includes(busqueda) || 
    cliente.player_id.includes(busqueda) || 
    (`${cliente.nombres} ${cliente.apellidos}`).toLowerCase().includes(busqueda.toLowerCase())
  );

  return (
    <div className="p-4">
      <h2 className="text-xl font-bold">Listado de Clientes</h2>
      <input 
        type="text" 
        placeholder="Buscar por DNI, Player ID o Nombre" 
        className="w-full p-2 mb-4 border rounded" 
        value={busqueda} 
        onChange={(e) => setBusqueda(e.target.value)}
      />
      <table className="w-full border-collapse border border-gray-300">
        <thead>
          <tr className="bg-gray-200">
            <th className="border p-2">ID</th>
            <th className="border p-2">Player ID</th>
            <th className="border p-2">Nombres</th>
            <th className="border p-2">Apellidos</th>
            <th className="border p-2">Celular</th>
            <th className="border p-2">Saldo</th>
            <th className="border p-2">Acciones</th>
          </tr>
        </thead>
        <tbody>
          {clientesFiltrados.map(cliente => (
            <tr key={cliente.id} className="border">
              <td className="border p-2">{cliente.id}</td>
              <td className="border p-2">{cliente.player_id}</td>
              <td className="border p-2">{cliente.nombres}</td>
              <td className="border p-2">{cliente.apellidos}</td>
              <td className="border p-2">{cliente.celular}</td>
              <td className="border p-2 text-right">{cliente.saldo}</td>
              <td className="border p-2 text-center">
                <button className="bg-blue-500 text-white p-1 rounded"
                 onClick={() => setClienteSeleccionado(cliente)}>Ver</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      {clienteSeleccionado && <Historial cliente={clienteSeleccionado} onClose={() => setClienteSeleccionado(null)} />}
    </div>
  );
  }
  