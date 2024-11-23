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

$sql = "SELECT id, name, address, state, phone, website, email, photo, dob, gender FROM users";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table border='1'>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>State</th>
        <th>Phone</th>
        <th>Website</th>
        <th>Email</th>
        <th>Photo</th>
        <th>Date of Birth</th>
        <th>Gender</th>
    </tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr>
            <td>" . $row["id"]. "</td>
            <td>" . $row["name"]. "</td>
            <td>" . $row["address"]. "</td>
            <td>" . $row["state"]. "</td>
            <td>" . $row["phone"]. "</td>
            <td>" . $row["website"]. "</td>
            <td>" . $row["email"]. "</td>
            <td><img src='" . $row["photo"] . "' width='100'></td>
            <td>" . $row["dob"]. "</td>
            <td>" . $row["gender"]. "</td>
        </tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$conn->close();
?>

