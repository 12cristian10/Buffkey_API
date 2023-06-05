import { prisma } from "../config/dbconn.js";

export const getAllProducts = async (req, res) => {
  try {
    const productos = await prisma.producto.findMany();
    res.json(productos);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "error getting the products" });
  }
};

export const getProduct = async (req, res) => {
  try {
    const { id } = req.params;
    const productoEncontrado = await prisma.producto.findFirst({
      where: {
        idProducto: +id,
      },
    });
    res.json(productoEncontrado);
  } catch (error) {
    console.error(error);
    res.status(404).json({ error: "Product not found" });
  }
};

export const createProduct = async (req, res) => {
  try {
    const { codigo, nombre, precio, categoria, proveedor, medida } = req.body;

    const categoriaEncontrada = await prisma.categoria.findUnique({
      where: { idCategoria: +categoria },
    });

    if (!categoriaEncontrada) {
      return res.status(404).json({ message: "category not found" });
    }

    const proveedorEncontrado = await prisma.proveedor.findUnique({
      where: { idProveedor: +req.body.proveedor },
    });

    if (!proveedorEncontrado) {
      return res.status(404).json({ message: "provider not found" });
    }
    const producto = await prisma.producto.create({
      data: {
        codigo,
        nombre,
        precio,
        categoria: {
          connect: { idCategoria: +categoria },
        },
        proveedor: {
          connect: { idProveedor: +proveedor },
        },
             
      },
    });

    const idProductoCreado = producto.idProducto;

    // const productoCreado = await prisma.producto.findUnique({
    //   where: { codigo: codigo },
    //   select: { idProducto: true },
    // });

    if (!productoCreado) {
      return res.status(404).json({ message: "product not found" });
    }

    const detalle = await prisma.detalleInventario.create({
      data: {
        inventario_FK: 1,
        producto_FK: idProductoCreado.idProducto,
        unidad_FK: +medida,
      },
    });

    if (!detalle) {
      return res.status(500).json({ message: "error creating detail" });
    }
    return res.status(201).json(producto);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: "error creating product" });
  }
};

export const updateProduct = async (req, res) => {
  try {
    const { id } = req.params;
    const { codigo, nombre, precio, categoria, proveedor } = req.body;

    const productoExistente = await prisma.producto.findUnique({
      where: {
        idProducto: +id,
      },
    });

    if (!productoExistente) {
      return res.status(404).json({ message: "product not found" });
    }
    const data = {};

    if (codigo) {
      data.codigo = codigo;
    }
    if (nombre) {
      data.nombre = nombre;
    }
    if (precio) {
      data.precio = precio;
    }
    if (categoria) {
      data.categoria = {
        connect: { idCategoria: +categoria },
      };
    }
    if (proveedor) {
      data.proveedor = {
        connect: { idProveedor: +proveedor },
      };
    }
    const productoActualizado = await prisma.producto.update({
      where: {
        idProducto: +id,
      },
      data: data,
    });
    res.json(productoActualizado);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error updated the product" });
  }
};

export const deleteProduct = async (req, res) => {
  try {
    const { id } = req.params;
    const productoExistente = await prisma.producto.findUnique({
      where: {
        idProducto: +id,
      },
    });

    if (!productoExistente) {
      return res.status(404).json({ message: "product not found" });
    }

    const productoEliminado = await prisma.producto.delete({
      where: {
        idProducto: +id,
      },
    });

    res.json(productoEliminado);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error deleted product" });
  }
};

export const searchProduct = async (req, res) => {
  try {
    const { query } = req.query;
    const productosBuscados = await prisma.producto.findMany({
      where: {
        OR: [
          { nombre: { contains: query } },
          { codigo: { contains: query } },
          {
            categoria: {
              nombreCategoria: { contains: query },
            },
          },
        ],
      },
      include: {
        categoria: true,
      },
    });
    res.json(productosBuscados);
  } catch (error) {
    console.error(error);
    return res
      .status(500)
      .json({ message: "Failed to search for suggestions" });
  }
};
