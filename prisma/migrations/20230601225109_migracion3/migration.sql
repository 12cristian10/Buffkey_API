/*
  Warnings:

  - The primary key for the `detalleinventario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `inventarioFK` on the `detalleinventario` table. All the data in the column will be lost.
  - You are about to drop the column `productoFK` on the `detalleinventario` table. All the data in the column will be lost.
  - The primary key for the `detallepedido` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `pedidoFK` on the `detallepedido` table. All the data in the column will be lost.
  - You are about to drop the column `productoFK` on the `detallepedido` table. All the data in the column will be lost.
  - The primary key for the `detallereporte` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `productoFK` on the `detallereporte` table. All the data in the column will be lost.
  - You are about to drop the column `reporteFK` on the `detallereporte` table. All the data in the column will be lost.
  - Added the required column `inventario_FK` to the `DetalleInventario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `producto_FK` to the `DetalleInventario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stock` to the `DetalleInventario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pedido_FK` to the `DetallePedido` table without a default value. This is not possible if the table is not empty.
  - Added the required column `producto_FK` to the `DetallePedido` table without a default value. This is not possible if the table is not empty.
  - Added the required column `producto_FK` to the `DetalleReporte` table without a default value. This is not possible if the table is not empty.
  - Added the required column `reporte_FK` to the `DetalleReporte` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `DetalleInventario` DROP FOREIGN KEY `DetalleInventario_inventarioFK_fkey`;

-- DropForeignKey
ALTER TABLE `DetalleInventario` DROP FOREIGN KEY `DetalleInventario_productoFK_fkey`;

-- DropForeignKey
ALTER TABLE `DetallePedido` DROP FOREIGN KEY `DetallePedido_pedidoFK_fkey`;

-- DropForeignKey
ALTER TABLE `DetallePedido` DROP FOREIGN KEY `DetallePedido_productoFK_fkey`;

-- DropForeignKey
ALTER TABLE `DetalleReporte` DROP FOREIGN KEY `DetalleReporte_productoFK_fkey`;

-- DropForeignKey
ALTER TABLE `DetalleReporte` DROP FOREIGN KEY `DetalleReporte_reporteFK_fkey`;

-- AlterTable
ALTER TABLE `DetalleInventario` DROP PRIMARY KEY,
    DROP COLUMN `inventarioFK`,
    DROP COLUMN `productoFK`,
    ADD COLUMN `inventario_FK` INTEGER NOT NULL,
    ADD COLUMN `producto_FK` INTEGER NOT NULL,
    ADD COLUMN `stock` INTEGER NOT NULL,
    ADD PRIMARY KEY (`inventario_FK`, `producto_FK`);

-- AlterTable
ALTER TABLE `DetallePedido` DROP PRIMARY KEY,
    DROP COLUMN `pedidoFK`,
    DROP COLUMN `productoFK`,
    ADD COLUMN `pedido_FK` INTEGER NOT NULL,
    ADD COLUMN `producto_FK` INTEGER NOT NULL,
    ADD PRIMARY KEY (`pedido_FK`, `producto_FK`);

-- AlterTable
ALTER TABLE `DetalleReporte` DROP PRIMARY KEY,
    DROP COLUMN `productoFK`,
    DROP COLUMN `reporteFK`,
    ADD COLUMN `producto_FK` INTEGER NOT NULL,
    ADD COLUMN `reporte_FK` INTEGER NOT NULL,
    ADD PRIMARY KEY (`reporte_FK`, `producto_FK`);

-- AddForeignKey
ALTER TABLE `DetallePedido` ADD CONSTRAINT `DetallePedido_producto_FK_fkey` FOREIGN KEY (`producto_FK`) REFERENCES `Producto`(`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetallePedido` ADD CONSTRAINT `DetallePedido_pedido_FK_fkey` FOREIGN KEY (`pedido_FK`) REFERENCES `Pedido`(`idPedido`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetalleInventario` ADD CONSTRAINT `DetalleInventario_producto_FK_fkey` FOREIGN KEY (`producto_FK`) REFERENCES `Producto`(`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetalleInventario` ADD CONSTRAINT `DetalleInventario_inventario_FK_fkey` FOREIGN KEY (`inventario_FK`) REFERENCES `Inventario`(`idInventario`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetalleReporte` ADD CONSTRAINT `DetalleReporte_reporte_FK_fkey` FOREIGN KEY (`reporte_FK`) REFERENCES `Reporte`(`idReporte`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetalleReporte` ADD CONSTRAINT `DetalleReporte_producto_FK_fkey` FOREIGN KEY (`producto_FK`) REFERENCES `Producto`(`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE;
