<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Notice</title>
</head>
<body>
    <h1>Upload PDF Notice</h1>
    <form action="upload.php" method="post" enctype="multipart/form-data">
        <label for="file">Choose PDF file:</label>
        <input type="file" id="file" name="file" accept=".pdf" required><br><br>
        <input type="submit" value="Upload">
    </form>
</body>
</html>

