<!DOCTYPE html>
<html>
<head>
    <title>User Form</title>
</head>
<body>
    <h1>Enter User Details</h1>
    <form action="submit.php" method="post" enctype="multipart/form-data">
        <p>Name: <input type="text" name="name" required></p>
        <p>Address: <input type="text" name="address" required></p>
        <p>State: <input type="text" name="state" required></p>
        <p>Phone Number: <input type="text" name="phone_number" required></p>
        <p>Website URL: <input type="url" name="website_url" ></p>
        <p>Email: <input type="email" name="email" required></p>
        <p>Photo: <input type="file" name="photo" required></p>
        <p>Date of Birth: <input type="date" name="date_of_birth" required></p>
        <p>Gender: 
            <select name="gender" required>
                <option value="M">Male</option>
                <option value="F">Female</option>
                <option value="O">Other</option>
            </select>
        </p>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
