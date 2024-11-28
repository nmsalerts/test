<?php
$dir = 'uploads/';
$files = array_diff(scandir($dir), array('..', '.'));

if (count($files) > 0) {
    echo "<h1>All Photos</h1>";
    foreach ($files as $file) {
        echo "<div><img src='$dir$file' alt='$file' style='max-width: 500px;'><br>$file</div><br>";
    }
} else {
    echo "<h1>No photos uploaded yet.</h1>";
}
echo "<br><a href='index.php'>Upload another photo</a>";
?>

