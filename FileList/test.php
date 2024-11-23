<?php
// Database connection parameters
$hostname = "localhost"; // Replace with your hostname
$username = "ajith"; // Replace with your username
$password = "password"; // Replace with your password
$database = "userdetails_db"; // Replace with your database name

// Create a connection
$conn = new mysqli($hostname, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Connected successfully to the database.";
}

// Close the connection
$conn->close();
?>
