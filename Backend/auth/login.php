<?php

include "../connect.php";

$password = sha1($_POST['password']);
$email = filterRequest("email");



// $stmt = $con->prepare("SELECT * FROM users WHERE users_email = ? And users_password = ? ");
// $stmt->execute(array($email, $password));
// $count = $stmt->rowCount();
// result($count);
getData("users","users_email = ? And users_password = ?",array($email,$password));


