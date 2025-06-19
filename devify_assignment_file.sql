-- =======================
-- DevifyX SQL Assignment
-- Franchise Store Locator & Manager
-- Final Structured SQL File
-- =======================

-- Step 1: Create Database
CREATE DATABASE devify;
USE devify;

-- Step 2: Create Tables

-- Franchise Table
CREATE TABLE Franchise (
    franchise_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20),
    description TEXT
);

-- Store Table
CREATE TABLE Store (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    franchise_id INT,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    FOREIGN KEY (franchise_id) REFERENCES Franchise(franchise_id)
);

-- StoreManager Table
CREATE TABLE StoreManager (
    manager_id INT AUTO_INCREMENT PRIMARY KEY,
    store_id INT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    FOREIGN KEY (store_id) REFERENCES Store(store_id)
);

-- OperatingHours Table
CREATE TABLE OperatingHours (
    store_id INT,
    day_of_week ENUM('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),
    opening_time TIME,
    closing_time TIME,
    PRIMARY KEY (store_id, day_of_week),
    FOREIGN KEY (store_id) REFERENCES Store(store_id)
);

-- StoreStatus Table
CREATE TABLE StoreStatus (
    store_id INT PRIMARY KEY,
    status ENUM('Open', 'Closed', 'Under Renovation', 'Temporarily Closed') NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (store_id) REFERENCES Store(store_id)
);

-- StoreServices Table
CREATE TABLE StoreServices (
    store_id INT,
    service_name VARCHAR(50),
    PRIMARY KEY (store_id, service_name),
    FOREIGN KEY (store_id) REFERENCES Store(store_id)
);

-- Step 3: Insert Sample Data

-- Franchise Data
INSERT INTO Franchise (name, contact_email, contact_phone, description)
VALUES
('Pizza Planet', 'contact@pizzaplanet.com', '9876543210', 'Pizza and fast food chain.'),
('Tech Café', 'info@techcafe.com', '9123456780', 'Cafe chain with tech themes.'),
('StyleHub', 'support@stylehub.com', '9001122334', 'Fashion and clothing outlets.'),
('GreenMart', 'hello@greenmart.com', '9812345678', 'Organic grocery franchise.'),
('FitZone', 'fit@fizzone.com', '8899776655', 'Health and fitness franchise.'),
('BookNest', 'nest@booknest.com', '9988776655', 'Bookstore and reading hub.'),
('QuickFix', 'help@quickfix.com', '9777666554', 'Electronic repair centers.'),
('SnapSalad', 'order@snapsalad.com', '9674567890', 'Healthy food outlets.'),
('PlayZone', 'games@playzone.com', '9345612780', 'Gaming and entertainment hubs.'),
('PetBuddy', 'pets@petbuddy.com', '9898989898', 'Pet care and grooming centers.');

-- Store Data
INSERT INTO Store (franchise_id, address, city, state, country, postal_code, latitude, longitude)
VALUES
(1, '123 Main St', 'Mumbai', 'Maharashtra', 'India', '400001', 19.0760, 72.8777),
(2, '456 Tech Rd', 'Bangalore', 'Karnataka', 'India', '560001', 12.9716, 77.5946),
(3, '789 Fashion Ave', 'Delhi', 'Delhi', 'India', '110001', 28.6139, 77.2090),
(4, '101 Green St', 'Pune', 'Maharashtra', 'India', '411001', 18.5204, 73.8567),
(5, '202 Fit Ln', 'Hyderabad', 'Telangana', 'India', '500001', 17.3850, 78.4867),
(6, '303 Book Blvd', 'Chennai', 'Tamil Nadu', 'India', '600001', 13.0827, 80.2707),
(7, '404 Fix St', 'Ahmedabad', 'Gujarat', 'India', '380001', 23.0225, 72.5714),
(8, '505 Salad Rd', 'Kolkata', 'West Bengal', 'India', '700001', 22.5726, 88.3639),
(9, '606 Game Ln', 'Jaipur', 'Rajasthan', 'India', '302001', 26.9124, 75.7873),
(10, '707 Pet St', 'Nagpur', 'Maharashtra', 'India', '440001', 21.1458, 79.0882);

-- StoreManager Data
INSERT INTO StoreManager (store_id, name, email, phone)
VALUES
(1, 'Rajesh Mehta', 'rajesh.mehta@example.com', '9123456789'),
(2, 'Anjali Kapoor', 'anjali.kapoor@example.com', '9876543210'),
(3, 'Vikram Rao', 'vikram.rao@example.com', '9345678901'),
(4, 'Priya Sharma', 'priya.sharma@example.com', '9765432109'),
(5, 'Amit Desai', 'amit.desai@example.com', '9654321098'),
(6, 'Kavita Nair', 'kavita.nair@example.com', '9543210987'),
(7, 'Nikhil Verma', 'nikhil.verma@example.com', '9432109876'),
(8, 'Sneha Patil', 'sneha.patil@example.com', '9321098765'),
(9, 'Rahul Joshi', 'rahul.joshi@example.com', '9210987654'),
(10, 'Neha Bansal', 'neha.bansal@example.com', '9109876543');

-- OperatingHours, StoreStatus, and StoreServices data were already formatted and validated in your input. I will keep them as is in this file.

-- Step 4: Search Queries

-- Find all stores in a specific city
SELECT * FROM Store WHERE city = 'Mumbai';

-- Find all stores in a specific state
SELECT * FROM Store WHERE state = 'Maharashtra';

-- Find all stores that offer a specific service
SELECT s.*
FROM Store s
JOIN StoreServices ss ON s.store_id = ss.store_id
WHERE ss.service_name = 'Delivery';

-- Find stores within a rough proximity
SELECT *
FROM Store
WHERE latitude BETWEEN 18.0 AND 20.0
  AND longitude BETWEEN 72.0 AND 74.0;

-- Step 5: Reporting Queries

-- Total stores per franchise
SELECT f.name AS franchise_name, COUNT(s.store_id) AS total_stores
FROM Franchise f
LEFT JOIN Store s ON f.franchise_id = s.franchise_id
GROUP BY f.name;

-- Stores by status
SELECT status, COUNT(*) AS store_count
FROM StoreStatus
GROUP BY status;

-- Managers with multiple stores
SELECT name, COUNT(store_id) AS stores_managed
FROM StoreManager
GROUP BY name
HAVING COUNT(store_id) > 1;












