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
-- 5. Total en dinero de cada pedido (SUM, GROUP BY).
SELECT pe.id AS pedido_id, pe.fecha, SUM(dp.cantidad * dp.precio_unitario) AS total_pedido
FROM pedidos pe
INNER JOIN detalle_pedido dp ON pe.id = dp.pedido_id
GROUP BY pe.id, pe.fecha
ORDER BY pe.id ASC;

-- 6. Clientes con mas de 2 pedidos (GROUP BY, HAVING).
SELECT cl.id, cl.nombre AS cliente, cl.email, COUNT(pe.id) AS cantidad_pedidos
FROM clientes cl
INNER JOIN pedidos pe ON cl.id = pe.cliente_id
GROUP BY cl.id, cl.nombre, cl.email
HAVING COUNT(pe.id) > 2;

-- 7. Eliminar un cliente sin pedidos (DELETE).
DELETE FROM clientes
WHERE id = 6
  AND id NOT IN (SELECT DISTINCT cliente_id FROM pedidos);