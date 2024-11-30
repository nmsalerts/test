<?php

$hostname = "localhost";
$dbname = "user_management";
$user = "root";
$password = "Ajith93@iittp";

$conn = new mysqli($hostname, $user, $password, $dbname);

  if($conn->connect_error) {

     die("Connection failed: " . $conn->connect_error);
}

 
?>
