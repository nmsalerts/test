
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

$sql = "SELECT * FROM users";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<h1>User Details</h1>";
    echo "<table border='1'>
            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>State</th>
                <th>Phone Number</th>
                <th>Website URL</th>
                <th>Email</th>
                <th>Photo</th>
                <th>Date of Birth</th>
                <th>Gender</th>
            </tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row["name"] . "</td>
                <td>" . $row["address"] . "</td>
                <td>" . $row["state"] . "</td>
                <td>" . $row["phone_number"] . "</td>
                <td><a href='" . $row["website_url"] . "'>" . $row["website_url"] . "</a></td>
                <td>" . $row["email"] . "</td>
                <td><img src='" . $row["photo"] . "' alt='" . $row["name"] . "' width='100'></td>
                <td>" . $row["date_of_birth"] . "</td>
                <td>" . $row["gender"] . "</td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

$conn->close();
?>
