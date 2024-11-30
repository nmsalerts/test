<?php
include 'db.php';
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $address = $_POST['address'];
    $image_path = null;

    if (!empty($_FILES['profile_image']['name'])) {
        $image_path = 'uploads/' . basename($_FILES['profile_image']['name']);
        move_uploaded_file($_FILES['profile_image']['tmp_name'], $image_path);
    }

    $stmt = $conn->prepare("UPDATE users2 SET address = ?, profile_image = ? WHERE id = ?");
    $stmt->bind_param("ssi", $address, $image_path, $user_id);
    $stmt->execute();
    $stmt->close();
}

$stmt = $conn->prepare("SELECT username, email, address, profile_image FROM users2 WHERE id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$user = $stmt->get_result()->fetch_assoc();
$stmt->close();
?>
<form method="POST" enctype="multipart/form-data">
    Address: <textarea name="address"><?= $user['address'] ?></textarea><br>
    Profile Image: <input type="file" name="profile_image"><br>
    <button type="submit">Update</button>
</form>
<img src="<?= $user['profile_image'] ?>" alt="Profile Image">
