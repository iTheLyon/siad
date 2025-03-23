import { useState, useEffect } from "react";
import { FaMoneyBillWave, FaUsers, FaSearch, FaUpload } from "react-icons/fa";

export default function RecargarSaldo() {
  const [playerId, setPlayerId] = useState("");
  const [cliente, setCliente] = useState({ id : "", nombre: "", apellido: "" });
  const [foto, setFoto] = useState(null);
  const [canales, setCanales] = useState([]);
  const [mediosPago, setMediosPago] = useState([]);
  const [monto, setMonto] = useState("");
  const [idCanalSeleccionado, setIdCanalSeleccionado] = useState("");
  const [idMedioPagoSeleccionado, setIdMedioPagoSeleccionado] = useState("");
  const [fotoVoucher, setFotoVoucher] = useState(null);
  const [cajaBancos, setCajaBancos] = useState([]);
  const [idCajaBancoSeleccionado, setIdCajaBancoSeleccionado] = useState("");

  const API_BASE_URL = process.env.REACT_APP_API_BASE_URL;

  useEffect(() => {
    fetch(API_BASE_URL+"/canales-comunicacion").then(res => res.json()).then(setCanales);
    fetch(API_BASE_URL+"/medios-pago").then(res => res.json()).then(setMediosPago);
    fetch(API_BASE_URL+"/caja-bancos/tipo/2").then(res => res.json()).then(setCajaBancos);
  }, []);

  const buscarCliente = async () => {
    const response = await fetch(`${API_BASE_URL}/clientes/player/${playerId}`);
    if (response.ok) {
      const data = await response.json();
      console.log(data);
      setCliente({ id : data.id ,nombre: data.nombres, apellido: data.apellidos });
    } else {
      alert("Cliente no encontrado");
    }
  };

  const handleRecarga = async () => {
    const fotoUrl = await subirFoto(); // Sube la imagen y obtiene la URL
    if(fotoUrl == null) return; 
    const response = await fetch(API_BASE_URL+"/transacciones", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        tipo_transaccion_id: 1,//recarga
        cliente_id : cliente.id,
        caja_bancos_id :parseInt(idCajaBancoSeleccionado),
        canal_comunicacions_id: parseInt(idCanalSeleccionado),
        medio_pagos_id: parseInt(idMedioPagoSeleccionado),  
        moneda_id: 1,//soles
        tipo_cambio: 1,
        monto: parseFloat(monto),
        monto_ingreso : parseFloat(monto),
        monto_egreso : 0,
        foto_voucher_pago : fotoUrl,
        numero_voucher : "",
      }),
    });
    if (response.ok) {
      alert("Recarga exitosa");
    } else {
      alert("Error en la recarga");
    }
  };

  const ultimaRecarga = async () => {
    if(cliente.id == ""){
      alert("Ingrese el playerId");
      return;
    }

    const response = await fetch(`${API_BASE_URL}/clientes/${cliente.id}/ultima-recarga`);
    if (response.ok) {
      const data = await response.json();
      if(data.message){
        alert(data.message);
        return;
      }
      
      setIdCanalSeleccionado(data.canal_comunicacions_id);
      setIdMedioPagoSeleccionado(data.medio_pagos_id);
      setMonto(data.monto);
      setIdCajaBancoSeleccionado(data.caja_bancos_id);
    } else {
      alert("problema al buscar la ultima recarga");
    }
  };

  const handleFotoChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      setFotoVoucher(file);
      setFoto(URL.createObjectURL(file)); // Para mostrar una vista previa
    }
  };

  const subirFoto = async () => {
    if (!fotoVoucher) return null; // Si no hay imagen, no se sube nada
  
    const formData = new FormData();
    formData.append("file", fotoVoucher);
  
    const response = await fetch(API_BASE_URL+"/upload", {
      method: "POST",
      body: formData,
    });
  
    if (response.ok) {
      const data = await response.json();
      return data.filePath; // Devuelve la URL o el nombre del archivo en el servidor
    } else {
      alert("Error al subir la foto.");
      return null;
    }
  };

  return (     
    <div className="p-4">
      <h2 className="text-xl font-bold text-center">RECARGA DE SALDO</h2><br></br>
      <div className="flex items-center gap-2">
        <input type="text" placeholder="PLAYERID" className="p-2 border rounded" value={playerId} onChange={(e) => setPlayerId(e.target.value)} />
        <button className="bg-blue-500 text-white p-2 rounded flex items-center" onClick={buscarCliente}>
          <FaSearch className="mr-2" /> Buscar
        </button>
      </div>
      <input type="text" placeholder="Nombre" className="w-full p-2 mt-4 border rounded" value={`${cliente.nombre} ${cliente.apellido}`} readOnly />
      <div className="mt-4">
        <img src={foto || "default.jpg"} alt="Foto" className="w-24 h-24 object-cover rounded" />
        <input type="file" onChange={handleFotoChange} className="hidden" id="file-upload" />
        <label htmlFor="file-upload" className="block bg-gray-500 text-white px-4 py-2 rounded mt-2 cursor-pointer flex items-center">
          <FaUpload className="mr-2" /> Subir Foto
        </label>
      </div>
      <select className="w-full p-2 mt-4 border rounded"
        value={idCanalSeleccionado}  onChange={(e) => setIdCanalSeleccionado(e.target.value)}>
        <option>Selecciona un canal</option>
        {canales.map(c => <option key={c.id} value={c.id}>{c.nombre}</option>)}
      </select>
      <select className="w-full p-2 mt-4 border rounded"
        value={idMedioPagoSeleccionado}  onChange={(e) => setIdMedioPagoSeleccionado(e.target.value)}>
        <option>Selecciona un medio de pago</option>
        {mediosPago.map(m => <option key={m.id} value={m.id}>{m.nombre}</option>)}
      </select>
      <select className="w-full p-2 mt-4 border rounded"
        value={idCajaBancoSeleccionado}  onChange={(e) => setIdCajaBancoSeleccionado(e.target.value)}>
        <option>Selecciona un Banco</option>
        {cajaBancos.map(c => <option key={c.id} value={c.id}>{c.nombre}</option>)}
      </select>
      <input type="number" placeholder="Monto" className="w-full p-2 mt-4 border rounded text-right" value={monto} onChange={(e) => setMonto(e.target.value)} />
      <div className="flex gap-4 mt-4">
        <button className="bg-blue-500 text-white p-2 rounded w-full" onClick={handleRecarga}>Guardar</button>
        <button className="bg-gray-500 text-white p-2 rounded w-full" onClick={() => { setPlayerId(""); setCliente({ nombre: "", apellido: "" }); setMonto(""); }}>Limpiar</button>
        <button className="bg-green-500 text-white p-2 rounded w-full" onClick={ultimaRecarga}>Ultima Recarga</button>
      </div>
    </div>  
  );
}
