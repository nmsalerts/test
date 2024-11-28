<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = "Ajith93@iittp";
$dbname = "userdetails_db";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data
$name = $_POST['name'];
$address = $_POST['address'];
$state = $_POST['state'];
$phone_number = $_POST['phone_number'];
$website_url = $_POST['website_url'];
$email = $_POST['email'];
$date_of_birth = $_POST['date_of_birth'];
$gender = $_POST['gender'];

// Handle file upload
$photo = $_FILES['photo']['name'];
$target_dir = "uploads/";
$target_file = $target_dir . basename($photo);

if (move_uploaded_file($_FILES['photo']['tmp_name'], $target_file)) {
    $photo_path = $target_file;

    // Insert data into the database
    $sql = "INSERT INTO users (name, address, state, phone_number, website_url, email, photo, date_of_birth, gender)
            VALUES ('$name', '$address', '$state', '$phone_number', '$website_url', '$email', '$photo_path', '$date_of_birth', '$gender')";

    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully. <a href='list.php'>View Users</a>";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Sorry, there was an error uploading your file.";
}

$conn->close();
?>
