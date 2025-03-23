import { BrowserRouter as Router, Route, Routes, Navigate } from "react-router-dom";
import { useState } from "react";
import Login from "./components/Login";
import Menu from "./components/Menu";
import RecargarSaldo from "./components/RecargarSaldo";
import Clientes from "./components/Clientes";
import "./index.css";
export default function App() {
  const [isAuthenticated, setIsAuthenticated] = useState(false);//hook

  return (
    <Router>
      <Routes>
        <Route path="/" element={isAuthenticated ? 
          <Navigate to="/menu" /> : <Login onLogin={setIsAuthenticated} />} />
        <Route path="/menu" element={isAuthenticated ? 
          <Menu /> : <Navigate to="/" />} />
        <Route path="/recargar" element={isAuthenticated ? 
          <RecargarSaldo /> : <Navigate to="/" />} />
        <Route path="/clientes" element={isAuthenticated ? 
          <Clientes /> : <Navigate to="/" />} />
      </Routes>
    </Router>
  );
}
