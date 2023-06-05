import { prisma } from "../config/dbconn.js";

export const getAllEmployees = async (req, res) => {
  try {
    const empleados = await prisma.empleado.findMany();
    return res.json(empleados);
  } catch (error) {
    return res.status(500).json({ message: "Error internal server" });
  }
};

export const getEmployee = async (req, res) => {
  try {
    const { id } = req.params;
    const empleado = await prisma.empleado.findUnique({
      where: {
        idEmpleado: +id,
      },
    });
    if (!empleado) {
      return res.status(404).json({ message: "Employee not found" });
    }
    return res.json(empleado);
  } catch (error) {
    return res.status(500).json({ message: "Error internal server" });
  }
};

export const createEmployee = async (req, res) => {
  try {
    const {
      dni,
      tipoDni,
      priNombre,
      segNombre,
      priApellido,
      segApellido,
      rol,
      clave,
      correo,
      telefono,
    } = req.body;

    const result = await prisma.empleado.create({
      data: {
        Dni: dni,
        tipoDni,
        priNombre,
        segNombre,
        priApellido,
        segApellido,
        rol,
        clave,
        correo,
        telefono,
      },
    });
    return res.status(201).json(result);
  } catch (error) {
    return res.status(500).json({ message: "Error internal server" });
  }
};

export const updateEmployee = async (req, res) => {
  try {
    const { id } = req.params;
    const {
      dni,
      tipoDni,
      priNombre,
      segNombre,
      priApellido,
      segApellido,
      rol,
      clave,
      correo,
      telefono,
    } = req.body;

    const empleado = await prisma.empleado.findUnique({
      where: {
        idEmpleado: +id,
      },
    });

    if (!empleado) {
      return res.status(404).json({ message: "Employee not found" });
    }

    const result = await prisma.empleado.update({
      where: {
        idEmpleado: +id,
      },
      data: {
        Dni: dni,
        tipoDni,
        priNombre,
        segNombre,
        priApellido,
        segApellido,
        rol,
        clave,
        correo,
        telefono,
      },
    });
    return res.status(201).json(result);
  } catch (error) {
    return res.status(500).json({ message: "Error internal server" });
  }
};

export const deleteEmployee = async (req, res) => {
  try {
    const { id } = req.params;
    const empleado = await prisma.empleado.findUnique({
      where: {
        idEmpleado: +id,
      },
    });

    if (!empleado) {
      return res.status(404).json({ message: "Employee not found" });
    }

    const result = await prisma.empleado.delete({
      where: {
        idEmpleado: +id,
      },
    });
    return res.status(201).json(result);
  } catch (error) {
    return res.status(500).json({ message: "Error internal server" });
  }
};


