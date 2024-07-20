<?php
 
 include "../connect.php";

 $categoryid= filterRequest("id") ;

//  getAllData("itemsview","items_cat= $categoryid");

 $userid = filterRequest("usersid");


 $stmt = $con->prepare("SELECT itemsview.* , 1 as favorite, cast(items_price - items_price * (items_discount /100)as int) as items_price_discount FROM itemsview 
INNER JOIN favorite ON favorite.favorite_itemsid = itemsview.items_id AND favorite.favorite_usersid = $userid
WHERE categories_id = $categoryid
UNION ALL 
SELECT *  , 0 as favorite , cast(items_price - items_price * (items_discount /100)as int) FROM itemsview
WHERE  categories_id = $categoryid AND items_id NOT IN  ( SELECT itemsview.items_id FROM itemsview 
INNER JOIN favorite ON favorite.favorite_itemsid = itemsview.items_id AND favorite.favorite_usersid =  $userid  )");

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();

if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}
 ?>