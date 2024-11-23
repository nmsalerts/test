<?php
$conn = new mysqli('localhost','root','','test');
if($conn->connect_error){
    die('Error connecting to ' . $conn->connect_error);
}
?>