--view the menu_items table.
SELECT*
from menu_items;

--find the number of items on the menu.
SELECT COUNT(*)
from menu_items;

--what are the least and most expensive items on the menu?
SELECT*
from menu_items
ORDER BY price;

SELECT*
from menu_items
ORDER BY price DESC;

--How many Italian dishes are on the menu?
SELECT  COUNT(*) category
from menu_items
WHERE category = 'Italian'
 
--What are the least and most expensive italian dishes on the menu?
SELECT*
from menu_items
WHERE category = 'Italian'
ORDER BY price;

SELECT*
from menu_items
WHERE category = 'Italian'
ORDER BY price DESC;

--How many dishes are in each category?
SELECT category, COUNT(menu_item_id)  num_of_dishes 
from menu_items
GROUP by category

--What is the average dish price within each category?
SELECT category, avg (price)  AVG
FROM menu_items
GROUP by category

--Combining the mmenu_items and ordorder_details table into a single table
SELECT* FROM menu_items
SELECT* FROM order_details

SELECT*
FROM order_details AS od LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id

--What were the least and most orderd items? What categories were they in?
SELECT item_name,category, COUNT(order_details_id) AS num_purchases
FROM order_details AS od LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
GROUP by item_name, category
ORDER by num_purchases

-- What were the top 5 orders that spent the most money?
SELECT order_id, sum(price) as total_spend
FROM order_details AS od LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
GROUP by order_id
order by total_spend DESC
LIMIT 5

-- View the details of the highest spend order. And insights i can gather
SELECT category, COUNT(item_id) as num_items
FROM order_details AS od LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP by category

-- View the details of the top 5 highest spend order. And insights i can gather
SELECT order_id, category, COUNT(item_id) as num_items
FROM order_details AS od LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP by order_id, category

-- insight: we should keep this Italian dishes on our menu because people seems to be ordering them a lot especially our highest spend customers










