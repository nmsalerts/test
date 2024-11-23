<?php
$directory = "uploads/";
$files = glob($directory . "*.pdf");

echo "<h1>Uploaded PDF Files</h1>";

if (empty($files)) {
    echo "No files uploaded.";
} else {
    echo "<ul>";
    foreach($files as $file) {
        $filename = basename($file);
        echo "<li><a href='$directory$filename' target='_blank'>$filename</a></li>";
    }
    echo "</ul>";
}
?>

