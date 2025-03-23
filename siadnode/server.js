const express = require("express");
const http = require("http");
const { Server } = require("socket.io");
const cors = require("cors");

const app = express();
const server = http.createServer(app);
const io = new Server(server, {
    cors: {
      origin: "*", // Permitir conexiones desde cualquier dominio
      methods: ["GET", "POST"],
    },
});
app.use(express.json());

app.post("/actualizarSaldo", (req, res) => {
  console.log("Solicitud recibida de Laravel:", req.body);
  io.emit("saldoActualizado", req.body); // Enviar a todos los clientes conectados
  res.json({ status: "ok", message: "Saldo actualizado" });
});

server.listen(8081, () => {
  console.log("Servidor WebSocket en puerto 8081");
});
