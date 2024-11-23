<?php

include 'database.php';

$name = $_POST['name'];
$age = $_POST['age'];
$photo = $_FILES['photo']['name'];

$target = "upload/" . basename($photo);

if(move_uploaded_file($_FILES['photo']['tmp_name'], $target)) {
    $sql = "INSERT INTO table1(name, age, photo) VALUES ('$name', '$age', '$target')";
    $result = $conn->query($sql);
}

$conn->close();
?>