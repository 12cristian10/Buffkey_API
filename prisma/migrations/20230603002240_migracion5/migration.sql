/*
  Warnings:

  - Added the required column `unidad_FK` to the `Producto` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Producto` ADD COLUMN `unidad_FK` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `UnidadMedida` (
    `idUnidad` INTEGER NOT NULL AUTO_INCREMENT,
    `nombreUnidad` VARCHAR(45) NOT NULL,
    `cantidad` DECIMAL(65, 30) NOT NULL,

    PRIMARY KEY (`idUnidad`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Producto` ADD CONSTRAINT `Producto_unidad_FK_fkey` FOREIGN KEY (`unidad_FK`) REFERENCES `UnidadMedida`(`idUnidad`) ON DELETE RESTRICT ON UPDATE CASCADE;
