<?php 

include "../connect.php" ; 

$search = filterRequest("search") ; 

$stmt = $con->prepare("SELECT * , cast(items_price - items_price * (items_discount /100)as int) as items_price_discount FROM itemsview 
WHERE  items_name LIKE '%$search%' OR items_name_ar  LIKE '%$search%' ");
$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();

if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}
?>