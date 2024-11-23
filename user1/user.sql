CREATE DATABASE userdetails_db;

USE userdetails_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    state VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    website_url VARCHAR(200) NOT NULL,
    email VARCHAR(100) NOT NULL,
    photo VARCHAR(200) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('M', 'F', 'O') NOT NULL
);
