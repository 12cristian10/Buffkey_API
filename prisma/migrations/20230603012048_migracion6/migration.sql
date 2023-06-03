/*
  Warnings:

  - You are about to drop the column `unidad_FK` on the `Producto` table. All the data in the column will be lost.
  - You are about to drop the column `cantidad` on the `UnidadMedida` table. All the data in the column will be lost.
  - Added the required column `unidad_FK` to the `DetalleInventario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `abreviacion` to the `UnidadMedida` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Producto` DROP FOREIGN KEY `Producto_unidad_FK_fkey`;

-- AlterTable
ALTER TABLE `DetalleInventario` ADD COLUMN `unidad_FK` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `Producto` DROP COLUMN `unidad_FK`;

-- AlterTable
ALTER TABLE `UnidadMedida` DROP COLUMN `cantidad`,
    ADD COLUMN `abreviacion` VARCHAR(10) NOT NULL;

-- AddForeignKey
ALTER TABLE `DetalleInventario` ADD CONSTRAINT `DetalleInventario_unidad_FK_fkey` FOREIGN KEY (`unidad_FK`) REFERENCES `UnidadMedida`(`idUnidad`) ON DELETE RESTRICT ON UPDATE CASCADE;
