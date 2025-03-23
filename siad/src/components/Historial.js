import { useState, useEffect } from "react";
import { FaMoneyBillWave, FaUsers, FaSearch, FaUpload } from "react-icons/fa";
export default function Historial({ cliente, onClose }) {
    const [transacciones, setTransacciones] = useState([]);
    const [loading, setLoading] = useState(true);
    const API_BASE_URL = process.env.REACT_APP_API_BASE_URL;
    useEffect(() => {
      fetch(`${API_BASE_URL}/clientes/${cliente.id}/transacciones`)
        .then((res) => res.json())
        .then((data) => {
            console.log("Respuesta de API:", data);
            setTransacciones(Array.isArray(data.transacciones) ? data.transacciones : []);
            setLoading(false);
          })
          .catch((error) => console.error("Error al obtener transacciones:", error));
    }, [cliente]);
  
    const formatFecha = (fecha) => {
        const date = new Date(fecha);
        return date.toLocaleDateString("es-ES");
      };

    return (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
            <div className="bg-white p-4 rounded-lg w-full max-w-4xl overflow-auto">
                <h2 className="text-xl font-bold mb-4">Historial de Transacciones</h2>
                {loading ? (
                    <p className="text-center text-gray-500">Cargando...</p>
                ) : (
                <table className="w-full border-collapse border border-gray-300">
                <thead>
                <tr className="bg-gray-200">
                    <th className="border p-2">Fecha</th>
                    <th className="border p-2">Hora</th>
                    <th className="border p-2">Tipo Transacción</th>
                    <th className="border p-2">Medio Pago</th>
                    <th className="border p-2">Banco</th>
                    <th className="border p-2">Monto</th>
                </tr>
                </thead>
                <tbody>
                {transacciones.map((t) => (
                    <tr key={t.id} className="border">
                    <td className="border p-2">{formatFecha(t.fecha_emision)}</td>
                    <td className="border p-2">{t.hora_emision}</td>
                    <td className="border p-2">{t.tipo_transaccion.nombre}</td>
                    <td className="border p-2">{t.medio_pago.nombre}</td>
                    <td className="border p-2">{t.caja_banco.nombre}</td>
                    <td className="border p-2">{t.monto}</td>
                    </tr>
                ))}
                </tbody>
                </table>
                  )}
                <button className="mt-4 bg-red-500 text-white p-2 rounded" onClick={onClose}>Cerrar</button>
            </div>
        </div>
    );
}