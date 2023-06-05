import { prisma } from "../config/dbconn.js";

export const getAllOrders = async (req, res) => {
  try {
    const pedidos = await prisma.pedido.findMany();
    res.json(pedidos);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error internal server" });
  }
};

export const getOrder = async (req, res) => {
  try {
    const { id } = req.params;
    const pedido = await prisma.pedido.findUnique({
      where: {
        idPedido: +id,
      },
    });
    if (!pedido) {
      return res.status(404).json({ message: "Order not found" });
    }
    return res.json(pedido);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: "Error internal server" });
  }
};

export const createOrder = async (req, res) => {
  try {
    const {
      estado,
      valorTotal,
      fechaPedido,
      fechaEntrega,
      empleado,
      proovedor,
      productos,
    } = req.body;

    const result = await prisma.pedido.create({
      data: {
        estado,
        valorTotal,
        fechaPedido,
        fechaEntrega,
        empleado: {
          connect: { idEmpleado: +empleado },
        },
        proovedor: {
          connect: { idProveedor: +proovedor },
        },
        producto: {
          create: productos.map(async (detalle) => {
            const precio = await prisma.producto.findUnique({
              where: { idProducto: +detalle.producto },
              select: { precio: true },
            });
            const subtotal = precio.precio * detalle.cantidad;
            return {
              cantidad: detalle.cantidad,
              subtotal,
              producto: {
                connect: { idProducto: +detalle.producto },
              },
              pedido: {
                connect: { idPedido: +detalle.pedido },
              },
            };
          }),
        },
      },
    });
    return res.status(201).json(result);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: "Error internal server" });
  }
};

export const updateOrder = async (req, res) => {
  try {
    const { id } = req.params;
    const {
      estado,
      valorTotal,
      fechaPedido,
      fechaEntrega,
      empleado,
      proovedor,
      productos,
    } = req.body;

    const pedido = await prisma.pedido.findUnique({
      where: {
        idPedido: +id,
      },
    });

    if (!pedido) {
      return res.status(404).json({ message: "Order not found" });
    }

    const result = await prisma.pedido.update({
      where: {
        idPedido: +id,
      },
      data: {
        estado,
        valorTotal,
        fechaPedido,
        fechaEntrega,
        empleado: {
          connect: { idEmpleado: +empleado },
        },
        proovedor: {
          connect: { idProveedor: +proovedor },
        },
        producto: {
          create: productos.map(async (detalle) => {
            const precio = await prisma.producto.findUnique({
              where: { idProducto: +detalle.producto },
              select: { precio: true },
            });
            const subtotal = precio.precio * detalle.cantidad;
            return {
              cantidad: detalle.cantidad,
              subtotal,
              producto: {
                connect: { idProducto: +detalle.producto },
              },
              pedido: {
                connect: { idPedido: +detalle.pedido },
              },
            };
          }),
        },
      },
    });
    return res.status(201).json(result);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: "Error internal server" });
  }
};

export const deleteOrder = async (req, res) => {
  try {
    const { id } = req.params;

    const pedido = await prisma.pedido.findUnique({
      where: {
        idPedido: +id,
      },
    });

    if (!pedido) {
      return res.status(404).json({ message: "Order not found" });
    }

    await prisma.detallePedido.deleteMany({
      where: {
        idPedido: +id,
      },
    });

    await prisma.pedido.delete({
      where: {
        idPedido: +id,
      },
    });

    return res.status(200).json({ message: "Order deleted" });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: "Error internal server" });
  }
};
