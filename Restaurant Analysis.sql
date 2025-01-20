use restaurant_db;
select * from menu_items where category = 'American'; 
select count(*) from menu_items;
select * from menu_items ORDER BY price;
select * from menu_items ORDER BY price DESC;
select * from menu_items where category = 'Italian' ORDER BY price;
select * from menu_items where category = 'Italian' ORDER BY price desc;
select category, Count(menu_item_id) as num_items, avg(price) as avg_price from menu_items group by category;
