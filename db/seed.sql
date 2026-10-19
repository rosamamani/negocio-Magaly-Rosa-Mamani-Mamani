-- 1. Insertar 3 Categorias
INSERT INTO categorias (id, nombre) VALUES
(1, 'Perifericos y Accesorios'),
(2, 'Componentes de PC'),
(3, 'Laptops y Monitores');

-- 2. Insertar 12 Productos
INSERT INTO productos (id, nombre, categoria_id, precio, stock) VALUES
(1, 'Teclado Mecanico RGB Redragon', 1, 350.00, 15),
(2, 'Mouse Gamer Logitech G502', 1, 420.00, 8),
(3, 'Auriculares HyperX Cloud II', 1, 650.00, 3),
(4, 'Webcam Full HD 1080p', 1, 280.00, 12),
(5, 'Procesador AMD Ryzen 5 5600X', 2, 1250.00, 6),
(6, 'Tarjeta Grafica RTX 4060 8GB', 2, 2800.00, 2),
(7, 'Memoria RAM Corsair 16GB DDR4', 2, 390.00, 20),
(8, 'Disco SSD NVMe Kingston 1TB', 2, 520.00, 4),
(9, 'Monitor LG UltraGear 24 144Hz', 3, 1450.00, 7),
(10, 'Laptop Lenovo IdeaPad Gaming 3', 3, 5600.00, 3),
(11, 'Laptop ASUS VivoBook 15', 3, 4100.00, 9),
(12, 'Monitor Samsung Curvo 27', 3, 1750.00, 2);

-- 3. Insertar 6 Clientes
INSERT INTO clientes (id, nombre, telefono, email) VALUES
(1, 'Carlos Mamani Quispe', '71548921', 'carlos.mamani@gmail.com'),
(2, 'Lucia Fernandez Torrez', '72093412', 'lucia.fernandez@hotmail.com'),
(3, 'Rodrigo Choque Condori', '68012345', 'rodrigo.choque@umsa.bo'),
(4, 'Valeria Gutierrez Rojas', '76543210', 'valeria.gutierrez@yahoo.com'),
(5, 'Diego Copa Flores', '60112233', 'diego.copa@gmail.com'),
(6, 'Andrea Vargas Mendoza', '70998877', 'andrea.vargas@outlook.com');

-- 4. Insertar 10 Pedidos
INSERT INTO pedidos (id, cliente_id, fecha, estado) VALUES
(1, 1, '2026-10-01', 'Entregado'),
(2, 1, '2026-10-05', 'Entregado'),
(3, 1, '2026-10-12', 'Pendiente'),
(4, 2, '2026-10-02', 'Entregado'),
(5, 2, '2026-10-08', 'Enviado'),
(6, 2, '2026-10-15', 'Pendiente'),
(7, 3, '2026-10-04', 'Entregado'),
(8, 3, '2026-10-14', 'Cancelado'),
(9, 4, '2026-10-10', 'Enviado'),
(10, 5, '2026-10-16', 'Pendiente');

-- 5. Insertar 25 Lineas de Detalle
INSERT INTO detalle_pedido (id, pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 1, 350.00),
(2, 1, 2, 1, 420.00),
(3, 1, 7, 2, 390.00),
(4, 2, 8, 1, 520.00),
(5, 2, 4, 1, 280.00),
(6, 3, 9, 1, 1450.00),
(7, 3, 3, 1, 650.00),
(8, 3, 1, 2, 350.00),
(9, 4, 10, 1, 5600.00),
(10, 4, 2, 1, 420.00),
(11, 5, 5, 1, 1250.00),
(12, 5, 7, 2, 390.00),
(13, 5, 8, 1, 520.00),
(14, 6, 12, 1, 1750.00),
(15, 6, 4, 2, 280.00),
(16, 7, 6, 1, 2800.00),
(17, 7, 5, 1, 1250.00),
(18, 7, 7, 2, 390.00),
(19, 8, 3, 2, 650.00),
(20, 8, 1, 1, 350.00),
(21, 9, 11, 1, 4100.00),
(22, 9, 2, 1, 420.00),
(23, 9, 4, 1, 280.00),
(24, 10, 9, 2, 1450.00),
(25, 10, 8, 1, 520.00);