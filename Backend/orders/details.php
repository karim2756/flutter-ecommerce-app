<?php 

include "../connect.php" ; 

$orderid = filterRequest("id")  ;

getAllData("ordersdetailsview" , "cart_orders = $orderid "); 

?>