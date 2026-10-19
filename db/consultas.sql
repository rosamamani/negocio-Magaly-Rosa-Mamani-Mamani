-- 1. Productos con el nombre de su categoria, ordenados por nombre (JOIN, ORDER BY).
SELECT p.id, p.nombre AS producto, c.nombre AS categoria, p.precio, p.stock
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id
ORDER BY p.nombre ASC;

-- 2. Productos con menos de 5 unidades en stock (WHERE).
SELECT id, nombre, precio, stock
FROM productos
WHERE stock < 5;

-- 3. Precio promedio por categoria (GROUP BY, AVG).
SELECT c.nombre AS categoria, ROUND(AVG(p.precio), 2) AS precio_promedio
FROM categorias c
INNER JOIN productos p ON c.id = p.categoria_id
GROUP BY c.id, c.nombre;

-- 4. Pedidos de un cliente con su fecha y estado (JOIN, WHERE).
SELECT pe.id AS pedido_id, cl.nombre AS cliente, pe.fecha, pe.estado
FROM pedidos pe
INNER JOIN clientes cl ON pe.cliente_id = cl.id
WHERE cl.id = 1;