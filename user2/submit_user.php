<?php
$servername = "localhost";
$username = "root";
$password = "Ajith93@iittp";
$dbname = "example2";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$name = $_POST['name'];
$address = $_POST['address'];
$state = $_POST['state'];
$phone = $_POST['phone'];
$website = $_POST['website'];
$email = $_POST['email'];
$dob = $_POST['dob'];
$gender = $_POST['gender'];

// Handle file upload
$photo = $_FILES['photo']['name'];
$target_dir = "uploads/";
$target_file = $target_dir . basename($photo);

if (move_uploaded_file($_FILES['photo']['tmp_name'], $target_file)) {
    $sql = "INSERT INTO users (name, address, state, phone, website, email, photo, dob, gender)
    VALUES ('$name', '$address', '$state', '$phone', '$website', '$email', '$target_file', '$dob', '$gender')";

    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Sorry, there was an error uploading your file.";
}

$conn->close();
?>

