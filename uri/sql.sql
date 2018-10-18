-- 2602
SELECT name
FROM customers
WHERE state = 'RS'

-- 2603
SELECT name, street
FROM customers
WHERE city = 'Porto Alegre'

-- 2604
SELECT id, name
FROM products
WHERE price < 10 OR 100 < price

-- 2605
SELECT products.name, providers.name
FROM products
JOIN providers ON products.id_providers = providers.id
WHERE products.id_categories = 6

-- 2606
SELECT p.id, p.name
FROM products p
JOIN categories c ON p.id_categories = c.id
WHERE c.name LIKE 'super%'

-- 2607
SELECT DISTINCT city
FROM providers
ORDER BY city

-- 2608
SELECT max(price), min(price)
FROM products

-- 2609
SELECT categories.name, sum(products.amount)
FROM categories
JOIN products ON products.id_categories = categories.id
GROUP BY categories.name

-- 2610
SELECT trunc(avg(price), 2) as price
FROM products

-- 2611
SELECT m.id, m.name
FROM movies m
JOIN genres g on g.id = m.id_genres
WHERE g.description = 'Action'

-- 2612
SELECT m.id, m.name
FROM movies m
JOIN genres g on g.id = m.id_genres
WHERE g.description = 'Action' AND EXISTS (
    SELECT *
    FROM actors a
    JOIN movies_actors ma ON a.id = ma.id_actors AND m.id = id_movies
    WHERE a.name IN ('Marcelo Silva', 'Miguel Silva')
)

