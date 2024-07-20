<?php 

include "../connect.php" ; 

$userid = filterRequest("id") ; 

getAllData('ordersview' , "orders_usersid = '$userid' And orders_status !=2") ; 

?>