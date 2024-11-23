<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_FILES['photo']) && $_FILES['photo']['error'] == 0) {
        $upload_dir = 'uploads/';
        $uploaded_file = $upload_dir . basename($_FILES['photo']['name']);
        $imageFileType = strtolower(pathinfo($uploaded_file, PATHINFO_EXTENSION));

        // Check if file is an image
        $check = getimagesize($_FILES['photo']['tmp_name']);
        if ($check === false) {
            echo "File is not an image.";
            exit;
        }

        // Check file size (5MB limit)
        if ($_FILES['photo']['size'] > 5000000) {
            echo "Sorry, your file is too large.";
            exit;
        }

        // Allow certain file formats
        $allowed_types = ['jpg', 'jpeg', 'png', 'gif'];
        if (!in_array($imageFileType, $allowed_types)) {
            echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
            exit;
        }

        // Move the uploaded file to the uploads directory
        if (move_uploaded_file($_FILES['photo']['tmp_name'], $uploaded_file)) {
            echo "The file " . basename($_FILES['photo']['name']) . " has been uploaded.";
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    } else {
        echo "No file uploaded or there was an error uploading the file.";
    }
} else {
    echo "Invalid request method.";
}
echo "<br><a href='index.php'>Upload another photo</a>";
echo "<br><a href='view.php'>View photos</a>";
?>

