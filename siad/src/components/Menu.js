import { Link } from "react-router-dom";
import { FaMoneyBillWave, FaUsers } from "react-icons/fa";

export default function Menu() {
  return (
    <div className="min-h-screen bg-gray-100 p-4">
    <div className="p-4">
      <h1 className="text-2xl font-bold">Menú Principal</h1>
    </div>
    <nav className="bg-white p-4 shadow-md flex gap-4">
      <Link to="/recargar" className="flex items-center gap-2 bg-blue-500 text-white px-4 py-2 rounded shadow">
        <FaMoneyBillWave /> Recargar Saldo
      </Link>
      <Link to="/clientes" className="flex items-center gap-2 bg-green-500 text-white px-4 py-2 rounded shadow">
        <FaUsers /> Clientes
      </Link>
    </nav>
    
    </div>
  );
}
