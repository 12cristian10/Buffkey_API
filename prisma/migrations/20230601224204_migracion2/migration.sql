/*
  Warnings:

  - You are about to drop the column `productoFK` on the `categoria` table. All the data in the column will be lost.
  - You are about to drop the column `pedidoFK` on the `empleado` table. All the data in the column will be lost.
  - You are about to drop the column `reporteFK` on the `empleado` table. All the data in the column will be lost.
  - You are about to drop the column `pedidoFK` on the `proveedor` table. All the data in the column will be lost.
  - You are about to drop the column `productoFK` on the `proveedor` table. All the data in the column will be lost.
  - Added the required column `empleado_FK` to the `Pedido` table without a default value. This is not possible if the table is not empty.
  - Added the required column `proveedor_FK` to the `Pedido` table without a default value. This is not possible if the table is not empty.
  - Added the required column `categoria_FK` to the `Producto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `proveedor_FK` to the `Producto` table without a default value. This is not possible if the table is not empty.
  - Added the required column `empleado_FK` to the `Reporte` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Categoria` DROP FOREIGN KEY `Categoria_productoFK_fkey`;

-- DropForeignKey
ALTER TABLE `Empleado` DROP FOREIGN KEY `Empleado_pedidoFK_fkey`;

-- DropForeignKey
ALTER TABLE `Empleado` DROP FOREIGN KEY `Empleado_reporteFK_fkey`;

-- DropForeignKey
ALTER TABLE `Proveedor` DROP FOREIGN KEY `Proveedor_pedidoFK_fkey`;

-- DropForeignKey
ALTER TABLE `Proveedor` DROP FOREIGN KEY `Proveedor_productoFK_fkey`;

-- AlterTable
ALTER TABLE `Categoria` DROP COLUMN `productoFK`;

-- AlterTable
ALTER TABLE `Empleado` DROP COLUMN `pedidoFK`,
    DROP COLUMN `reporteFK`;

-- AlterTable
ALTER TABLE `Pedido` ADD COLUMN `empleado_FK` INTEGER NOT NULL,
    ADD COLUMN `proveedor_FK` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `Producto` ADD COLUMN `categoria_FK` INTEGER NOT NULL,
    ADD COLUMN `proveedor_FK` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `Proveedor` DROP COLUMN `pedidoFK`,
    DROP COLUMN `productoFK`;

-- AlterTable
ALTER TABLE `Reporte` ADD COLUMN `empleado_FK` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Producto` ADD CONSTRAINT `Producto_categoria_FK_fkey` FOREIGN KEY (`categoria_FK`) REFERENCES `Categoria`(`idCategoria`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Producto` ADD CONSTRAINT `Producto_proveedor_FK_fkey` FOREIGN KEY (`proveedor_FK`) REFERENCES `Proveedor`(`idProveedor`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_empleado_FK_fkey` FOREIGN KEY (`empleado_FK`) REFERENCES `Empleado`(`idEmplado`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_proveedor_FK_fkey` FOREIGN KEY (`proveedor_FK`) REFERENCES `Proveedor`(`idProveedor`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reporte` ADD CONSTRAINT `Reporte_empleado_FK_fkey` FOREIGN KEY (`empleado_FK`) REFERENCES `Empleado`(`idEmplado`) ON DELETE RESTRICT ON UPDATE CASCADE;
