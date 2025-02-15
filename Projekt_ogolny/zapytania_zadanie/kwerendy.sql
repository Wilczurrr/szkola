--1.każdy produkt w kategorii elektronika

SELECT p.product_id, p.name, p.description, p.price
FROM `products` p
JOIN `categories` c ON p.category_id = c.category_id
WHERE c.name = 'Electronics';

--2.info o zamówieniach konkretnego kilenta

SELECT o.order_id, o.order_date, o.status, oi.quantity, oi.price, p.name product_name
FROM `orders` o
JOIN `order_items` oi ON o.order_id = oi.order_id
JOIN `products` p ON oi.product_id = p.product_id
WHERE o.customer_id = 1;

--3. najdroższe produkty w bazie danych

SELECT p.product_id, p.name, p.price
FROM `products` p
WHERE p.price > 1000
ORDER BY p.price DESC;

--4.liczba zamówionych produktów i ich wartość

SELECT o.order_id, SUM(oi.quantity) total_items, SUM(oi.quantity * oi.price) total_value
FROM `order_items` oi
JOIN `orders` o ON oi.order_id = o.order_id
GROUP BY o.order_id;

--5. produkty zamówione w danym okresie

SELECT p.product_id, p.name, oi.quantity, oi.price, SUM(oi.quantity * oi.price) total_value
FROM `order_items` oi
JOIN `products` p ON oi.product_id = p.product_id
JOIN `orders` o ON oi.order_id = o.order_id
WHERE o.order_date BETWEEN '2024-11-20' AND '2024-11-22' 
GROUP BY p.product_id;

--6. zamówienia które nie mają przypisanych produktów 

SELECT o.order_id, o.order_date, oi.product_id, oi.quantity, oi.price
FROM `orders` o
LEFT JOIN order_items oi ON o.order_id = oi.order_id;

--7. klieńci mający wiecej niż 1 zamówienie 

SELECT c.customer_id, c.name, COUNT(o.order_id) total_orders
FROM `customers` c
JOIN `orders` o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) > 1;

--8. zamówienia w których prodókt zawiera nazwe blender

SELECT o.order_id, o.customer_id, o.order_date, oi.product_id, p.name product_name
FROM `orders` o
JOIN `order_items` oi ON o.order_id = oi.order_id
JOIN `products` p ON oi.product_id = p.product_id
WHERE p.name LIKE 'Blen%';

--9. dodanie danych do tabeli 

INSERT INTO `products` (name, description, price, category_id, created_at) 
VALUES ('Smart Watch', 'Nowoczesny zegarek smartwatch', 199.99, 1, '2024-11-29 12:10:54');

--10. podwyższa cenę o 10% przedmiotów będących w kategorii eleketronika

UPDATE `products`
SET price = price * 1.10
WHERE (SELECT category_id FROM categories WHERE name="Electronics");

