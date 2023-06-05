import { Router } from "express";

import {
  getAllOrders,
  getOrder,
  updateOrder,
  deleteOrder,
  createOrder,
} from "../controllers/pedidoController.js";

const router = Router();

router.get("/pedidos", getAllOrders);

router.get("/pedidos/:id", getOrder);

router.post("/pedidos", createOrder);

router.put("/pedidos/:id", updateOrder);

router.delete("/pedidos/:id", deleteOrder);

export default router;