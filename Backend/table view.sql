--  Custom view to get data with specific details

CREATE OR REPLACE VIEW  itemsview AS
SELECT items.* , categories.* ,cast(items_price - items_price * (items_discount /100)as int) as items_price_discountFROM items 
INNER JOIN  categories on  items.items_cat = categories.categories_id ; 

CREATE or REPLACE VIEW myfavorite as 
SELECT favorite.* ,items.* , users.users_id from favorite
INNER JOIN users on users.users_id =favorite.favorite_usersid
INNER JOIN items on items.items_id =favorite.favorite_itemsid


CREATE or REPLACE VIEW cartview as 
SELECT SUM(cast(items.items_price - items.items_price * items_discount / 100 as int)) as itemsprice  , COUNT(cart.cart_itemsid) as countitems , cart.* , items.* FROM cart 
INNER JOIN items ON items.items_id = cart.cart_itemsid
WHERE cart_orders = 0 
GROUP BY cart.cart_itemsid , cart.cart_usersid , cart.cart_orders ;

CREATE  or REPLACE view ordersview AS 
SELECT orders.* , address.* FROM orders 
LEFT JOIN address ON address.address_id = orders.orders_address ; 

CREATE or REPLACE VIEW itemstopselling AS 
SELECT COUNT(cart_id) as countitems , cart.* , items.*  , cast(items_price - items_price * (items_discount /100)as int) as items_price_discount  FROM cart 
INNER JOIN items ON items.items_id = cart.cart_itemsid
WHERE cart_orders != 0 
GROUP by cart_itemsid   ; 



