<?php
 
 include "connect.php";

$allData=array();

$allData['status'] = "success";

$categories= getAllData("categories",null,null,false);

$allData['categories'] = $categories;

$items= getAllData("itemsview","items_discount !=0",null,false);

$allData['items'] = $items;

echo json_encode($allData);
 ?>