CREATE DATABASE IF NOT EXISTS registration_db;

USE registration_db;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(255),
    father_name VARCHAR(255),
    mother_name VARCHAR(255),
    phone_number VARCHAR(20),
    email VARCHAR(255),
    date_of_birth DATE,
    address VARCHAR(255),
    blood_group VARCHAR(10),
    department VARCHAR(100),
    course VARCHAR(100),
    password VARCHAR(255)
);
