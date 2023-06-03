/*
  Warnings:

  - You are about to alter the column `valorTotal` on the `Pedido` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Decimal(65,2)`.
  - You are about to alter the column `precio` on the `Producto` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Decimal(65,2)`.

*/
-- AlterTable
ALTER TABLE `Pedido` MODIFY `valorTotal` DECIMAL(65, 2) NOT NULL;

-- AlterTable
ALTER TABLE `Producto` MODIFY `precio` DECIMAL(65, 2) NOT NULL;
