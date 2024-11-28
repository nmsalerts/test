<?php

include 'database.php';

$sql = "SELECT * FROM table1";
$result = $conn->query($sql);

//check 3
if($result->num_rows > 0){
    while($row = $result->fetch_assoc()){
        $name = $row['name'];
        $age = $row['age'];
        $photo = $row['photo'];

        echo "Row : " . $name . " " . $age . " " . $photo ."<br /> <img src='$photo' width='500'/>";

    }
}

$conn->close();

?>