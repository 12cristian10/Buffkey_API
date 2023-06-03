-- CreateTable
CREATE TABLE `Categoria` (
    `idCategoria` INTEGER NOT NULL AUTO_INCREMENT,
    `nombreCategoria` VARCHAR(45) NOT NULL,
    `productoFK` INTEGER NOT NULL,

    PRIMARY KEY (`idCategoria`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Proveedor` (
    `idProveedor` INTEGER NOT NULL AUTO_INCREMENT,
    `nit` VARCHAR(45) NOT NULL,
    `nombre` VARCHAR(60) NOT NULL,
    `correo` VARCHAR(100) NOT NULL,
    `direccion` VARCHAR(100) NULL,
    `telefono` VARCHAR(15) NULL,
    `productoFK` INTEGER NOT NULL,
    `pedidoFK` INTEGER NOT NULL,

    PRIMARY KEY (`idProveedor`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Producto` (
    `idProducto` INTEGER NOT NULL AUTO_INCREMENT,
    `codigo` VARCHAR(10) NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `precio` DECIMAL(65, 30) NOT NULL,

    PRIMARY KEY (`idProducto`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Inventario` (
    `idInventario` INTEGER NOT NULL AUTO_INCREMENT,
    `nombreInventario` VARCHAR(45) NOT NULL,

    PRIMARY KEY (`idInventario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Empleado` (
    `idEmplado` INTEGER NOT NULL AUTO_INCREMENT,
    `Dni` VARCHAR(20) NOT NULL,
    `tipoDni` VARCHAR(45) NOT NULL,
    `priNombre` VARCHAR(45) NOT NULL,
    `segNombre` VARCHAR(45) NULL,
    `priApellido` VARCHAR(45) NOT NULL,
    `segApellido` VARCHAR(45) NOT NULL,
    `rol` VARCHAR(30) NOT NULL,
    `clave` VARCHAR(20) NOT NULL,
    `correo` VARCHAR(100) NOT NULL,
    `telefono` VARCHAR(15) NULL,
    `pedidoFK` INTEGER NOT NULL,
    `reporteFK` INTEGER NOT NULL,

    PRIMARY KEY (`idEmplado`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pedido` (
    `idPedido` INTEGER NOT NULL AUTO_INCREMENT,
    `estado` VARCHAR(45) NOT NULL,
    `valorTotal` DECIMAL(65, 30) NOT NULL,
    `fechaPedido` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`idPedido`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DetallePedido` (
    `productoFK` INTEGER NOT NULL,
    `pedidoFK` INTEGER NOT NULL,
    `cantidad` INTEGER NOT NULL,
    `subtotal` DECIMAL(65, 30) NOT NULL,

    PRIMARY KEY (`pedidoFK`, `productoFK`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DetalleInventario` (
    `productoFK` INTEGER NOT NULL,
    `inventarioFK` INTEGER NOT NULL,

    PRIMARY KEY (`inventarioFK`, `productoFK`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Reporte` (
    `idReporte` INTEGER NOT NULL AUTO_INCREMENT,
    `codigoReporte` VARCHAR(10) NOT NULL,
    `fechaReporte` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`idReporte`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DetalleReporte` (
    `reporteFK` INTEGER NOT NULL,
    `productoFK` INTEGER NOT NULL,

    PRIMARY KEY (`reporteFK`, `productoFK`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Categoria` ADD CONSTRAINT `Categoria_productoFK_fkey` FOREIGN KEY (`productoFK`) REFERENCES `Producto`(`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Proveedor` ADD CONSTRAINT `Proveedor_productoFK_fkey` FOREIGN KEY (`productoFK`) REFERENCES `Producto`(`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Proveedor` ADD CONSTRAINT `Proveedor_pedidoFK_fkey` FOREIGN KEY (`pedidoFK`) REFERENCES `Pedido`(`idPedido`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Empleado` ADD CONSTRAINT `Empleado_pedidoFK_fkey` FOREIGN KEY (`pedidoFK`) REFERENCES `Pedido`(`idPedido`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Empleado` ADD CONSTRAINT `Empleado_reporteFK_fkey` FOREIGN KEY (`reporteFK`) REFERENCES `Reporte`(`idReporte`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetallePedido` ADD CONSTRAINT `DetallePedido_productoFK_fkey` FOREIGN KEY (`productoFK`) REFERENCES `Producto`(`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetallePedido` ADD CONSTRAINT `DetallePedido_pedidoFK_fkey` FOREIGN KEY (`pedidoFK`) REFERENCES `Pedido`(`idPedido`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetalleInventario` ADD CONSTRAINT `DetalleInventario_productoFK_fkey` FOREIGN KEY (`productoFK`) REFERENCES `Producto`(`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetalleInventario` ADD CONSTRAINT `DetalleInventario_inventarioFK_fkey` FOREIGN KEY (`inventarioFK`) REFERENCES `Inventario`(`idInventario`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetalleReporte` ADD CONSTRAINT `DetalleReporte_reporteFK_fkey` FOREIGN KEY (`reporteFK`) REFERENCES `Reporte`(`idReporte`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetalleReporte` ADD CONSTRAINT `DetalleReporte_productoFK_fkey` FOREIGN KEY (`productoFK`) REFERENCES `Producto`(`idProducto`) ON DELETE RESTRICT ON UPDATE CASCADE;
