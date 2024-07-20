<?php
 
 include "connect.php";

$allData=array();

$allData['status'] = "success";

$categories= getAllData("categories",null,null,false);

$allData['categories'] = $categories;

$items= getAllData("itemstopselling","countitems > 2 ORDER BY countitems DESC",null,false);

$allData['items'] = $items;

echo json_encode($allData);
 ?>