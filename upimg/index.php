<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload Photo</title>
</head>
<body>
    <h1>Upload a Photo</h1>
    <form action="upload.php" method="post" enctype="multipart/form-data">
        <input type="file" name="photo" required>
        <button type="submit">Upload</button>
    </form>
    <a href="view.php">View Photos</a>
</body>
</html>

