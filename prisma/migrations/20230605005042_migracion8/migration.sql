/*
  Warnings:

  - A unique constraint covering the columns `[Dni]` on the table `Empleado` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[codigo]` on the table `Producto` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[nit]` on the table `Proveedor` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `DetalleInventario` MODIFY `stock` INTEGER NOT NULL DEFAULT 0;

-- CreateIndex
CREATE UNIQUE INDEX `Empleado_Dni_key` ON `Empleado`(`Dni`);

-- CreateIndex
CREATE UNIQUE INDEX `Producto_codigo_key` ON `Producto`(`codigo`);

-- CreateIndex
CREATE UNIQUE INDEX `Proveedor_nit_key` ON `Proveedor`(`nit`);
