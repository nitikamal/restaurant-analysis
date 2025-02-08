use restaurant_db;
select * from menu_items;
select * from menu_items where category = 'American'; 

--  Find number of items in menu table 
select count(*) from menu_items;

-- Find least and most expensive item on the menu
select item_name, price from menu_items order by price;
select item_name, price from menu_items order by price DESC;

-- Find least and most expensive italian dishes on the menu 
select item_name, price from menu_items where category = 'Italian' order by price;
select item_name, price from menu_items where category = 'Italian' order by price DESC;

-- Number of items in each category and average price by category
select category, Count(menu_item_id) as num_items, avg(price) as avg_price from menu_items group by category;

-- View orders table
select * from order_details;

-- Date range of the table
select min(order_date), max(order_date) from order_details;

-- Number of orders in the date range
select count(distinct order_id) from order_details;

-- Orders with most number of items
select order_id, count(item_id) as num_items
from order_details
group by order_id
order by num_items DESC;
-- Orders having more than 12 items
select count(*) from
(select order_id, count(item_id) as num_items
from order_details 
group by order_id 
having num_items > 12)  as num_orders;

-- Combining both tables into one table using left join
SELECT * from order_details
LEFT JOIN menu_items
ON order_details.item_id = menu_items.menu_item_id; 

-- Least and most ordered item and their respective categories
SELECT item_name, category, count(order_details_id) as num_orders
from order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
group by item_name, category
order by num_orders;

-- Top 5 orders that spent most money
SELECT order_id, sum(price) as total
from order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
group by order_id
order by total desc
LIMIT 5;

-- View details of highest spent order 
SELECT category, count(item_id) as num_items
from order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
where order_id = 440
group by category;

-- View order deatils of the 5 highest spent orders
SELECT order_id, category, count(item_id) as num_items
from order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
where order_id IN (440, 2075, 1957, 330, 2675)
group by order_id, category;