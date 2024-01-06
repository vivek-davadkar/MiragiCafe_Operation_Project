-- CREATING DATABASE

CREATE DATABASE MIRAGI_CAFE_DB;
USE MIRAGI_CAFE_DB;

-- CREATING TABLES 

CREATE TABLE `Customers` (
    `cust_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `cust_firstname` VARCHAR(100) NOT NULL,
    `cust_lastname` VARCHAR(100) NOT NULL, 
    PRIMARY KEY (`cust_id`)
);

CREATE TABLE `Address` (
    `add_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `delivery_add1` VARCHAR(100) NOT NULL,
    `delivery_add2` VARCHAR(100),
    `delivery_city` VARCHAR(100) NOT NULL,
    `delivery_zipcode` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`add_id`)
);

CREATE TABLE `Item_Category` (
    `category_id` VARCHAR(50) NOT NULL,
    `item_cat` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`category_id`)
);

CREATE TABLE `Ingredients` (
    `ing_id` VARCHAR(50) NOT NULL,
    `ing_name` VARCHAR(100) NOT NULL,
    `ing_weight` BIGINT NOT NULL,
    `ing_meas` VARCHAR(50) NOT NULL,
    `ing_price` DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY (`ing_id`)
);

CREATE TABLE `Item` (
    `item_id` VARCHAR(50) NOT NULL,
    `sku` VARCHAR(50) NOT NULL,
    `item_name` VARCHAR(100) NOT NULL,
    `category_id` VARCHAR(50) NOT NULL,
    `item_size` VARCHAR(50) NOT NULL,
    `item_price` DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY (`item_id`),
    FOREIGN KEY (`category_id`) REFERENCES `Item_Category`(`category_id`)
);

CREATE TABLE `Shift` (
    `shift_id` VARCHAR(50) NOT NULL,
    `day_of_week` VARCHAR(50) NOT NULL,
    `start_time` TIME NOT NULL,
    `end_time` TIME NOT NULL,
    PRIMARY KEY (`shift_id`)
);

CREATE TABLE `Staff` (
    `staff_id` VARCHAR(50) NOT NULL,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `position` VARCHAR(100) NOT NULL,
    `hourly_rate` DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY (`staff_id`)
);

CREATE TABLE `Rotation` (
    `row_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `rota_id` VARCHAR(50) NOT NULL,
    `date` DATETIME NOT NULL,
    `shift_id` VARCHAR(50) NOT NULL,
    `staff_id` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`row_id`),
    FOREIGN KEY (`shift_id`) REFERENCES `Shift`(`shift_id`),
    FOREIGN KEY (`staff_id`) REFERENCES `Staff`(`staff_id`)
);

CREATE TABLE `Orders` (
    `row_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `order_id` VARCHAR(50) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `item_id` VARCHAR(50) NOT NULL,
    `quantity` BIGINT NOT NULL,
    `cust_id` BIGINT UNSIGNED NOT NULL,
    `delivery` varchar(10) NOT NULL,
    `add_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (`row_id`),
    FOREIGN KEY (`item_id`) REFERENCES `Item`(`item_id`),
    FOREIGN KEY (`cust_id`) REFERENCES `Customers`(`cust_id`),
    FOREIGN KEY (`add_id`) REFERENCES `Address`(`add_id`)
);

CREATE TABLE `Recipe` (
    `row_id` BIGINT NOT NULL AUTO_INCREMENT,
    `recipe_id` VARCHAR(50) NOT NULL,
    `ing_id` VARCHAR(50) NOT NULL,
    `quantity` BIGINT NOT NULL,
    PRIMARY KEY (`row_id`),
    FOREIGN KEY (`ing_id`) REFERENCES `Ingredients`(`ing_id`)
);

CREATE TABLE `Inventory` (
    `inv_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `item_id` VARCHAR(50) NOT NULL,
    `quantity` BIGINT NOT NULL,
	`batch_number` VARCHAR(20) NOT NULL,
    `batch_size` BIGINT NOT NULL,
    PRIMARY KEY (`inv_id`),
    FOREIGN KEY (`item_id`) REFERENCES `Recipe`(`ing_id`)
);

-- CUSTOMERS RECORDS;

INSERT INTO Customers (cust_id, cust_firstname, cust_lastname)
VALUES
(1, 'Rohan', 'Chopra'),
(2, 'Gauri', 'Dutta'),
(3, 'Aaditya', 'Sharma'),
(4, 'Ishani', 'Malhotra'),
(5, 'Tanvi', 'Bakshi'),
(6, 'Kavya', 'Rao'),
(7, 'Uday', 'Fernandes'),
(8, 'Meera', 'Gandhi'),
(9, 'Zaina', 'Bhat'),
(10, 'Vidya', 'Lal'),
(11, 'Jai', 'Hooda'),
(12, 'Rahul', 'Verma'),
(13, 'Bhavna', 'Sengupta'),
(14, 'Ishita', 'Chandra'),
(15, 'Eva', 'Thakkar'),
(16, 'Omkar', 'Jaiswal'),
(17, 'Lalit', 'Ekbote'),
(18, 'Hina', 'Zaveri'),
(19, 'Sanya', 'Venkatesh'),
(20, 'Qamar', 'Nair'),
(21, 'Nikita', 'Kumar'),
(22, 'Kritika', 'Chakrabarti'),
(23, 'Jatin', 'Deshmukh'),
(24, 'Yuvraj', 'Patel'),
(25, 'Zara', 'Thakur'),
(26, 'Chitra', 'Bansal'),
(27, 'Chirag', 'Iyer'),
(28, 'Tarun', 'Gupta'),
(29, 'Farhan', 'Xu'),
(30, 'Mehak', 'Arora'),
(31, 'Sneha', 'Warrier'),
(32, 'Bhanu', 'Choudhary'),
(33, 'Aarav', 'Rastogi'),
(34, 'Urmila', 'Qureshi'),
(35, 'Yash', 'Eswar'),
(36, 'Prisha', 'Das'),
(37, 'Ojas', 'Chopra'),
(38, 'Waheeda', 'Venkataraman'),
(39, 'Varun', 'Menon'),
(40, 'Hitesh', 'Bhatnagar'),
(41, 'Dev', 'Rai'),
(42, 'Charu', 'Xavier'),
(43, 'Eshaan', 'Iyer'),
(44, 'Rohan', 'Gokhale'),
(45, 'Ira', 'Mukherjee'),
(46, 'Gautam', 'Das'),
(47, 'Preeti', 'Chakraborty'),
(48, 'Kritika', 'Rastogi'),
(49, 'Zaina', 'Bose'),
(50, 'Vidya', 'Upadhyay');

INSERT INTO Customers (cust_id, cust_firstname, cust_lastname)
VALUES
(51, 'Kabir', 'Ahluwalia'),
(52, 'Aadhira', 'Biswas'),
(53, 'Arnav', 'Chatterjee'),
(54, 'Vihaan', 'Dube'),
(55, 'Anaya', 'Gill'),
(56, 'Ishita', 'Iyer'),
(57, 'Advait', 'Joshi'),
(58, 'Zara', 'Kulkarni'),
(59, 'Reyansh', 'Mehra'),
(60, 'Rhea', 'Nair'),
(61, 'Vivaan', 'Ojha'),
(62, 'Aadrika', 'Pandey'),
(63, 'Veer', 'Rai'),
(64, 'Aashna', 'Sen'),
(65, 'Aarya', 'Tiwari'),
(66, 'Aahil', 'Varma'),
(67, 'Anvi', 'Yadav'),
(68, 'Aarnav', 'Arora'),
(69, 'Aarit', 'Bhattacharya'),
(70, 'Aarav', 'Chakraborty'),
(71, 'Myra', 'Deshmukh'),
(72, 'Aarush', 'Gupta'),
(73, 'Aanya', 'Iyengar'),
(74, 'Aarini', 'Kapoor'),
(75, 'Advik', 'Kher'),
(76, 'Anika', 'Mishra'),
(77, 'Arjun', 'Nagpal'),
(78, 'Saisha', 'Narayan'),
(79, 'Aayansh', 'Pandit'),
(80, 'Aiza', 'Reddy'),
(81, 'Aarohi', 'Shah'),
(82, 'Aarvi', 'Singh'),
(83, 'Avyukt', 'Srivastava'),
(84, 'Dhruv', 'Tandon'),
(85, 'Aarna', 'Trivedi'),
(86, 'Abeer', 'Venkataraman'),
(87, 'Anay', 'Yadav'),
(88, 'Aayush', 'Agarwal'),
(89, 'Aisha', 'Bhatia'),
(90, 'Vihaana', 'Chopra'),
(91, 'Arush', 'Dewan'),
(92, 'Aarit', 'Goswami'),
(93, 'Aaryan', 'Iyer'),
(94, 'Aaradhya', 'Kaul'),
(95, 'Anvi', 'Khurana'),
(96, 'Aarohi', 'Mittal'),
(97, 'Aarini', 'Nath'),
(98, 'Vivaan', 'Rajput'),
(99, 'Aarush', 'Shukla'),
(100, 'Aarav', 'Verma');


-- ADDRESS RECORDS;

INSERT INTO Address (add_id, delivery_add1, delivery_add2, delivery_city, delivery_zipcode)
VALUES
(1, '123 Main Street', 'Apartment 101', 'Hinjewadi, Pune', '411057'),
(2, '456 Park Avenue', '', 'Kharadi, Pune', '411014'),
(3, '789 Beach Road', '', 'Koregaon Park, Pune', '411001'),
(4, '111 River Street', 'Suite 202', 'Viman Nagar, Pune', '411014'),
(5, '222 Oak Lane', '', 'New Kalyani Nagar. Pune', '411056'),
(6, '333 Pine Street', '', 'Eran Dwane, Pune', '411055'),
(7, '444 Elm Avenue', 'Unit 303', 'Shivaji Nagar, Pune', '411005'),
(8, '555 Maple Road', '', 'Koregaon Park, Pune', '411001'),
(9, '666 Cedar Lane', '', 'Boat Club Road, Pune', '411001'),
(10, '777 Birch Street', 'Apartment 404', 'Kothrud, Pune', '411038'),
(11, '888 Willow Avenue', '', 'Wadgaon Sheri, Pune', '411014'),
(12, '999 Ash Road', '', 'Senapati Bapat Road, Pune', '411016'),
(13, '1010 Spruce Lane', 'Suite 505', 'Magarpatta City, Pune', '411013'),
(14, '1212 Laurel Street', '', 'Kharad, Pune', '411018'),
(15, '1313 Cherry Avenue', '', 'New Kalyani Nagar, Pune', '411056'),
(16, '1414 Sycamore Road', 'Unit 606', 'Eran Dwane, Pune', '411055'),
(17, '1515 Birch Lane', '', 'Shivaji Nagar, Pune', '411005'),
(18, '1616 Willow Street', '', 'Koregaon Park, Pune', '411001'),
(19, '1717 Elm Road', 'Apartment 808', 'Boat Club Road, Pune', '411001'),
(20, '1818 Oak Avenue', '', 'Kothrud, Pune', '411038'),
(21, '1919 Maple Lane', '', 'Wadgaon Sheri, Pune', '411014'),
(22, '2020 Cedar Street', 'Suite 909', 'Senapati Bapat Road, Pune', '411016'),
(23, '2121 Pine Avenue', '', 'Magarpatta City, Pune', '411013'),
(24, '2222 Birch Lane', '', 'Kharad, Pune', '411018'),
(25, '2323 Willow Road', 'Unit 1010', 'New Kalyani Nagar, Pune', '411056'),
(26, '2424 Elm Lane', '', 'Eran Dwane, Pune', '411055'),
(27, '2525 Oak Street', '', 'Shivaji Nagar, Pune', '411005'),
(28, '2626 Maple Avenue', 'Apartment 1111', 'Koregaon Park, Pune', '411001'),
(29, '2727 Cedar Road', '', 'Boat Club Road, Pune', '411001'),
(30, '2828 Pine Lane', '', 'Kothrud, Pune', '411038'),
(31, '2929 Birch Street', 'Suite 1212', 'Wadgaon Sheri, Pune', '411014'),
(32, '3030 Willow Avenue', '', 'Senapati Bapat Road, Pune', '411016'),
(33, '3131 Elm Lane', '', 'Magarpatta City, Pune', '411013'),
(34, '3232 Oak Road', 'Apartment 1313', 'Kharad, Pune', '411018'),
(35, '3333 Maple Street', '', 'New Kalyani Nagar, Pune', '411056'),
(36, '3434 Cedar Lane', '', 'Eran Dwane, Pune', '411055'),
(37, '3535 Pine Avenue', 'Suite 1414', 'Shivaji Nagar, Pune', '411005'),
(38, '3636 Birch Street', '', 'Koregaon Park, Pune', '411001'),
(39, '3737 Willow Road', '', 'Boat Club Road, Pune', '411001'),
(40, '3838 Elm Lane', 'Unit 1515', 'Kothrud, Pune', '411038'),
(41, '3939 Oak Avenue', '', 'Wadgaon Sheri, Pune', '411014'),
(42, '4040 Maple Lane', '', 'Senapati Bapat Road, Pune', '411016'),
(43, '4141 Cedar Street', 'Apartment 1616', 'Magarpatta City, Pune', '411013'),
(44, '4242 Pine Avenue', '', 'Kharad, Pune', '411018'),
(45, '4343 Birch Lane', '', 'New Kalyani Nagar, Pune', '411056'),
(46, '4444 Willow Road', 'Suite 1717', 'Eran Dwane, Pune', '411055'),
(47, '4545 Elm Road', '', 'Shivaji Nagar, Pune', '411005'),
(48, '4646 Oak Street', '', 'Koregaon Park, Pune', '411001'),
(49, '4747 Maple Avenue', 'Apartment 1818', 'Boat Club Road, Pune', '411001'),
(50, '4848 Cedar Lane', '', 'Kothrud, Pune', '411038'),
(51, '4949 Pine Street', '', 'Wadgaon Sheri, Pune', '411014'),
(52, '5050 Birch Road', 'Suite 1919', 'Senapati Bapat Road, Pune', '411016'),
(53, '5151 Cedar Lane', '', 'Magarpatta City, Pune', '411013'),
(54, '5252 Pine Avenue', '', 'Kharad, Pune', '411018'),
(55, '5353 Willow Road', 'Unit 2020', 'New Kalyani Nagar, Pune', '411056'),
(56, '5454 Elm Lane', '', 'Eran Dwane, Pune', '411055'),
(57, '5555 Oak Street', '', 'Shivaji Nagar, Pune', '411005'),
(58, '5656 Maple Avenue', 'Apartment 1919, Pune', 'Koregaon Park', '411001'),
(59, '5757 Cedar Road', '', 'Boat Club Road, Pune', '411001'),
(60, '5858 Pine Lane', '', 'Kothrud, Pune', '411038'),
(61, '5959 Birch Street', 'Suite 2020', 'Wadgaon Sheri, Pune', '411014'),
(62, '6060 Willow Avenue', '', 'Senapati Bapat Road, Pune', '411016'),
(63, '6161 Elm Lane', '', 'Magarpatta City, Pune', '411013'),
(64, '6262 Oak Road', 'Apartment 2121', 'Kharad, Pune', '411018'),
(65, '6363 Maple Street', '', 'New Kalyani Nagar, Pune', '411056'),
(66, '6464 Cedar Lane', '', 'Eran Dwane, Pune', '411055'),
(67, '6565 Pine Avenue', 'Suite 2121', 'Shivaji Nagar, Pune', '411005'),
(68, '6666 Birch Street', '', 'Koregaon Park, Pune', '411001'),
(69, '6767 Willow Road', '', 'Boat Club Road, Pune', '411001'),
(70, '6868 Elm Lane', 'Unit 2222', 'Kothrud, Pune', '411038'),
(71, '6969 Oak Avenue', '', 'Wadgaon Sheri, Pune', '411014'),
(72, '7070 Maple Lane', '', 'Senapati Bapat Road, Pune', '411016'),
(73, '7171 Cedar Street', 'Apartment 2222', 'Magarpatta City, Pune', '411013'),
(74, '7272 Pine Avenue', '', 'Kharad, Pune', '411018'),
(75, '7373 Birch Lane', '', 'New Kalyani Nagar, Pune', '411056'),
(76, '7474 Willow Road', 'Suite 2222', 'Eran Dwane, Pune', '411055'),
(77, '7575 Elm Road', '', 'Shivaji Nagar, Pune', '411005'),
(78, '7676 Oak Street', '', 'Koregaon Park, Pune', '411001'),
(79, '7777 Maple Avenue', 'Apartment 2323', 'Boat Club Road, Pune', '411001'),
(80, '7878 Cedar Lane', '', 'Kothrud, Pune', '411038'),
(81, '7979 Pine Street', '', 'Wadgaon Sheri, Pune', '411014'),
(82, '8080 Birch Road', 'Suite 2323', 'Senapati Bapat Road, Pune', '411016'),
(83, '8181 Cedar Lane', '', 'Magarpatta City, Pune', '411013'),
(84, '8282 Pine Avenue', '', 'Kharad, Pune', '411018'),
(85, '8383 Willow Road', 'Unit 2424', 'New Kalyani Nagar, Pune', '411056'),
(86, '8484 Elm Lane', '', 'Eran Dwane, Pune', '411055'),
(87, '8585 Oak Street', '', 'Shivaji Nagar, Pune', '411005'),
(88, '8686 Maple Avenue', 'Apartment 2424', 'Koregaon Park, Pune', '411001'),
(89, '8787 Cedar Road', '', 'Boat Club Road, Pune', '411001'),
(90, '8888 Pine Lane', '', 'Kothrud, Pune', '411038'),
(91, '8989 Birch Street', 'Suite 2424', 'Wadgaon Sheri, Pune', '411014'),
(92, '9090 Willow Avenue', '', 'Senapati Bapat Road, Pune', '411016'),
(93, '9191 Elm Lane', '', 'Magarpatta City, Pune', '411013'),
(94, '9292 Oak Lane', 'Apartment 2525', 'Kharad, Pune', '411018'),
(95, '9393 Maple Street', '', 'New Kalyani Nagar, Pune', '411056'),
(96, '9494 Cedar Lane', '', 'Eran Dwane, Pune', '411055'),
(97, '9595 Pine Avenue', 'Suite 2525', 'Shivaji Nagar, Pune', '411005'),
(98, '9696 Birch Street', '', 'Koregaon Park, Pune', '411001'),
(99, '9797 Willow Road', '', 'Boat Club Road, Pune', '411001'),
(100, '9898 Elm Lane', 'Unit 2525', 'Kothrud, Pune', '411038');


-- ITEM_CATEGORY RECORDS;

INSERT INTO Item_Category (category_id, item_cat)
VALUES
('BEV001', 'Beverages'),
('SD001', 'Side-dishes'),
('DES001', 'Desserts'),
('BEV002', 'Beverages'),
('SD002', 'Side-dishes'),
('DES002', 'Desserts'),
('BEV003', 'Beverages'),
('SD003', 'Side-dishes'),
('DES003', 'Desserts'),
('BEV004', 'Beverages'),
('SD004', 'Side-dishes'),
('DES004', 'Desserts'),
('BEV005', 'Beverages'),
('SD005', 'Side-dishes'),
('DES005', 'Desserts'),
('BEV006', 'Beverages'),
('SD006', 'Side-dishes'),
('DES006', 'Desserts'),
('BEV007', 'Beverages'),
('SD007', 'Side-dishes'),
('DES007', 'Desserts'),
('BEV008', 'Beverages'),
('SD008', 'Side-dishes'),
('DES008', 'Desserts'),
('BEV009', 'Beverages'),
('SD009', 'Side-dishes'),
('DES009', 'Desserts'),
('BEV010', 'Beverages'),
('SD010', 'Side-dishes'),
('DES010', 'Desserts'),
('BEV011', 'Beverages'),
('SD011', 'Side-dishes'),
('DES011', 'Desserts'),
('BEV012', 'Beverages'),
('SD012', 'Side-dishes'),
('DES012', 'Desserts'),
('BEV013', 'Beverages'),
('SD013', 'Side-dishes'),
('DES013', 'Desserts'),
('BEV014', 'Beverages'),
('SD014', 'Side-dishes'),
('DES014', 'Desserts'),
('BEV015', 'Beverages'),
('SD015', 'Side-dishes'),
('DES015', 'Desserts'),
('BEV016', 'Beverages'),
('SD016', 'Side-dishes'),
('DES016', 'Desserts'),
('BEV017', 'Beverages'),
('SD017', 'Side-dishes'),
('DES017', 'Desserts'),
('BEV018', 'Beverages'),
('SD018', 'Side-dishes'),
('DES018', 'Desserts'),
('BEV019', 'Beverages'),
('SD019', 'Side-dishes'),
('DES019', 'Desserts'),
('BEV020', 'Beverages'),
('SD020', 'Side-dishes'),
('DES020', 'Desserts'),
('BEV021', 'Beverages'),
('SD021', 'Side-dishes'),
('DES021', 'Desserts'),
('BEV022', 'Beverages'),
('SD022', 'Side-dishes'),
('DES022', 'Desserts'),
('BEV023', 'Beverages'),
('SD023', 'Side-dishes'),
('DES023', 'Desserts'),
('BEV024', 'Beverages'),
('SD024', 'Side-dishes'),
('DES024', 'Desserts'),
('BEV025', 'Beverages'),
('SD025', 'Side-dishes'),
('DES025', 'Desserts'),
('BEV026', 'Beverages'),
('SD026', 'Side-dishes'),
('DES026', 'Desserts'),
('BEV027', 'Beverages'),
('SD027', 'Side-dishes'),
('DES027', 'Desserts'),
('BEV028', 'Beverages'),
('SD028', 'Side-dishes'),
('DES028', 'Desserts'),
('BEV029', 'Beverages'),
('SD029', 'Side-dishes'),
('DES029', 'Desserts'),
('BEV030', 'Beverages'),
('SD030', 'Side-dishes'),
('DES030', 'Desserts'),
('BEV031', 'Beverages'),
('SD031', 'Side-dishes'),
('DES031', 'Desserts'),
('BEV032', 'Beverages'),
('SD032', 'Side-dishes'),
('DES032', 'Desserts'),
('BEV033', 'Beverages'),
('SD033', 'Side-dishes'),
('DES033', 'Desserts'),
('BEV034', 'Beverages'),
('SD034', 'Side-dishes'),
('DES034', 'Desserts'),
('BEV035', 'Beverages'),
('SD035', 'Side-dishes'),
('DES035', 'Desserts'),
('BEV036', 'Beverages'),
('SD036', 'Side-dishes'),
('DES036', 'Desserts'),
('BEV037', 'Beverages'),
('SD037', 'Side-dishes'),
('DES037', 'Desserts'),
('BEV038', 'Beverages'),
('SD038', 'Side-dishes'),
('DES038', 'Desserts'),
('BEV039', 'Beverages'),
('SD039', 'Side-dishes'),
('DES039', 'Desserts'),
('BEV040', 'Beverages'),
('SD040', 'Side-dishes'),
('DES040', 'Desserts');


-- INGREDIENTS RECORDS;

INSERT INTO Ingredients (ing_id, ing_name, ing_weight, ing_meas, ing_price) VALUES
('ING001', 'Finely ground coffee beans', 20, 'grams', 3.24),
('ING002', 'Hot water', 200, 'ml', 5.09),
('ING003', 'Drip-brewed coffee', 50, 'ml', 7.03),
('ING004', 'Steamed milk', 200, 'ml', 4.62),
('ING005', 'Steamed half-and-half', 150, 'ml', 6.51),
('ING006', 'Foamed milk', 100, 'ml', 3.41),
('ING007', 'Chocolate syrup/powder', 30, 'ml', 8.54),
('ING008', 'Whipped cream', 50, 'ml', 4.09),
('ING009', 'Vanilla ice cream', 250, 'grams', 5.88),
('ING010', 'French press coffee', 45, 'ml', 8.42),
('ING011', 'Scalded milk', 180, 'ml', 2.65),
('ING012', 'Ice', 160, 'grams', 5.60),
('ING013', 'Flavoring syrup', 18, 'ml', 4.81),
('ING014', 'Tequila', 60, 'ml', 5.15),
('ING015', 'Lime juice', 25, 'ml', 2.60),
('ING016', 'Triple sec (orange liqueur)', 35, 'ml', 8.61),
('ING017', 'Salt', 3, 'grams', 6.87),
('ING018', 'Gin or vodka', 60, 'ml', 6.39),
('ING019', 'Dry vermouth', 40, 'ml', 2.68),
('ING020', 'Olives or lemon twist', 5, 'grams', 294.00),
('ING021', 'White rum', 55, 'ml', 55),
('ING022', 'Mint leaves', 3, 'grams', 3.88),
('ING023', 'Sugar', 6, 'grams', 8.15),
('ING024', 'Soda water', 120, 'ml', 7.30),
('ING025', 'Cachaça (Brazilian rum)', 50, 'ml', 3.36),
('ING026', 'Coconut cream', 135, 'ml', 5.93),
('ING027', 'Pineapple juice', 130, 'ml', 4.34),
('ING028', 'Red or white wine', 200, 'ml', 8.37),
('ING029', 'Chopped fruits (oranges, lemons, apples)', 50, 'grams', 6.99),
('ING030', 'Orange juice', 90, 'ml', 7.75),
('ING031', 'Brandy or liqueur', 60, 'ml', 2.51),
('ING032', 'Irish whiskey', 35, 'ml', 6.91),
('ING033', 'Cream', 30, 'ml', 5.19),
('ING034', 'Champagne (or sparkling wine)', 150, 'ml', 3.10),
('ING035', 'Fermented rice', 180, 'grams', 4.40),
('ING036', 'Black tea', 150, 'grams', 4.02),
('ING037', 'Spices mix (cinnamon, cardamom, cloves, ginger)', 5, 'grams', 4.80),
('ING038', 'Ladyfingers', 14, 'grams', 3.24),
('ING039', 'Mascarpone cheese', 100, 'grams', 6.27),
('ING040', 'Eggs', 300, 'grams', 6.39),
('ING041', 'Sugar', 6, 'grams', 4.45),
('ING042', 'Coffee', 10, 'grams', 7.56),
('ING043', 'Cocoa powder', 15, 'grams', 2.60),
('ING044', 'Apples', 150, 'grams', 7.92),
('ING045', 'Cinnamon', 3, 'grams', 3.40),
('ING046', 'Butter', 20, 'grams', 4.28),
('ING047', 'Flour', 100, 'grams', 2.53),
('ING048', 'Pastry dough', 100, 'grams', 4.24),
('ING049', 'Almond flour', 50, 'grams', 4.96),
('ING050', 'Egg whites', 50, 'ml', 3.41),
('ING051', 'Powdered sugar', 20, 'grams', 6.62),
('ING052', 'Various flavorings for filling', 10, 'ml', 7.62),
('ING053', 'Phyllo dough', 40, 'grams', 3.00),
('ING054', 'Nuts (pistachios, walnuts, almonds)', 30, 'grams', 3.14),
('ING055', 'Honey', 50, 'ml', 4.61),
('ING056', 'Milk powder', 20, 'grams', 4.94),
('ING057', 'Baking soda', 3, 'grams', 2.19),
('ING058', 'Ghee (clarified butter)', 15, 'grams', 7.14),
('ING059', 'Rose water', 5, 'ml', 7.34),
('ING060', 'Cardamom', 3, 'grams', 6.58),
('ING061', 'Sweet rice flour', 50, 'grams', 2.21),
('ING062', 'Water', 50, 'ml', 2.32),
('ING063', 'Condensed milk', 60, 'grams', 2.88),
('ING064', 'Heavy cream', 60, 'ml', 5.33),
('ING065', 'Vanilla extract', 50, 'ml', 470.40),
('ING066', 'Cornstarch', 10, 'grams', 2.26),
('ING067', 'Vinegar', 15, 'ml', 7.49),
('ING068', 'Whipped cream', 60, 'grams', 2.26),
('ING069', 'Fruits', 100, 'grams', 6.44),
('ING070', 'Cream cheese', 60, 'grams', 3.61),
('ING071', 'Graham cracker crumbs', 20, 'grams', 3.20),
('ING072', 'Chocolate', 50, 'grams', 3.04),
('ING073', 'Apricot jam', 15, 'grams', 3.51),
('ING074', 'Choux pastry', 25, 'grams', 6.32),
('ING075', 'Chocolate ganache', 60, 'grams', 5.81),
('ING076', 'Shredded phyllo dough', 50, 'grams', 7.97),
('ING077', 'Cheese', 60, 'grams', 7.18),
('ING078', 'Sugar syrup', 15, 'ml', 3.31),
('ING079', 'Sticky rice', 150, 'grams', 6.03),
('ING080', 'Coconut milk', 60, 'ml', 4.96),
('ING081', 'Ripe mangoes', 250, 'grams', 4.61),
('ING082', 'Potatoes', 250, 'grams', 6.08),
('ING083', 'Oil for frying', 30, 'ml', 7.88),
('ING084', 'Salt', 3, 'grams', 5.92),
('ING085', 'Onions', 100, 'grams', 3.85),
('ING086', 'Flour', 150, 'grams', 5.96),
('ING087', 'Breadcrumbs', 30, 'grams', 3.00),
('ING088', 'Seasoning', 5, 'grams', 8.13),
('ING089', 'Avocado', 100, 'grams', 3.25),
('ING090', 'Tomato', 100, 'grams', 2.90),
('ING091', 'Lime juice', 15, 'ml', 2.64),
('ING092', 'Cilantro', 5, 'grams', 2.39),
('ING093', 'Bread', 25, 'grams', 8.48),
('ING094', 'Basil', 10, 'grams', 6.83),
('ING095', 'Balsamic vinegar', 10, 'ml', 6.62),
('ING096', 'Chickpeas', 75, 'grams', 3.92),
('ING097', 'Tahini', 30, 'grams', 4.20),
('ING098', 'Garlic', 7, 'grams', 7.11),
('ING099', 'Cumin', 2, 'grams', 7.72),
('ING100', 'Pizza dough', 300, 'grams', 8.60),
('ING101', 'Tomato sauce', 60, 'ml', 4.60),
('ING102', 'Mozzarella cheese', 100, 'grams', 8.20),
('ING103', 'Pepperoni', 20, 'grams', 211.68),
('ING104', 'Ground Lamb', 150, 'grams', 6.75),
('ING105', 'Hamburger buns', 400, 'grams', 141.12),
('ING106', 'American cheese slices', 25, 'grams', 2.63),
('ING107', 'Lettuce', 50, 'grams', 3.95),
('ING108', 'Condiments (ketchup, mustard, mayo)', 20, 'grams', 3.17),
('ING109', 'Pickles', 15, 'grams', 8.46),
('ING110', 'Rice paper wrappers', 10, 'grams', 4.38),
('ING111', 'Vermicelli noodles', 100, 'grams', 7.55),
('ING112', 'Shrimp or tofu', 100, 'grams', 2.81),
('ING113', 'Herbs', 5, 'grams', 2.42),
('ING114', 'Dipping sauce', 15, 'ml', 8.12),
('ING115', 'Chickpea flour', 50, 'grams', 4.98),
('ING116', 'Spices', 5, 'grams', 4.97),
('ING117', 'Dumpling wrappers', 300, 'grams', 7.81),
('ING118', 'Cabbage', 50, 'grams', 2.32),
('ING119', 'Soy sauce', 10, 'ml', 5.77),
('ING120', 'Pasta noodles', 100, 'grams', 6.62),
('ING121', 'Assorted vegetables', 150, 'grams', 7.14),
('ING122', 'Fish sauce', 100, 'ml', 3.18),
('ING123', 'Assorted herbs', 7, 'grams', 5.62),
('ING124', 'Tempura batter', 100, 'grams', 4.55),
('ING125', 'Green plantains', 110, 'grams', 3.78);


-- ITEM RECORDS;

-- Beverages
INSERT INTO Item (item_id, sku, item_name, category_id)
VALUES
('ITM001', 'ESP001', 'Espresso', 'BEV001'),
('ITM002', 'DBL001', 'Double Espresso', 'BEV002'),
('ITM003', 'REC001', 'Red Eye Coffee', 'BEV003'),
('ITM004', 'BEC001', 'Black Eye Coffee', 'BEV004'),
('ITM005', 'AMR001', 'Americano', 'BEV005'),
('ITM006', 'LGB001', 'Long Black', 'BEV006'),
('ITM007', 'MAC001', 'Macchiato', 'BEV007'),
('ITM008', 'LMAC001', 'Long Macchiato', 'BEV008'),
('ITM009', 'CRT001', 'Cortado', 'BEV009'),
('ITM010', 'BRE001', 'Breve', 'BEV010'),
('ITM011', 'CAP001', 'Cappuccino', 'BEV011'),
('ITM012', 'FLW001', 'Flat White', 'BEV012'),
('ITM013', 'CLT001', 'Cafe Latte', 'BEV013'),
('ITM014', 'MOC001', 'Mocha', 'BEV014'),
('ITM015', 'VNN001', 'Vienna', 'BEV015'),
('ITM016', 'AFT001', 'Affogato', 'BEV016'),
('ITM017', 'CAL001', 'Cafe au Lait', 'BEV017'),
('ITM018', 'ICD001', 'Iced Coffee', 'BEV018'),
('ITM019', 'MGT001', 'Margarita', 'BEV019'),
('ITM020', 'MTN001', 'Martini', 'BEV020'),
('ITM021', 'MJT001', 'Mojito', 'BEV021'),
('ITM022', 'CPR001', 'Caipirinha', 'BEV022'),
('ITM023', 'PCD001', 'Pina Colada', 'BEV023'),
('ITM024', 'SNG001', 'Sangria', 'BEV024'),
('ITM025', 'IRC001', 'Irish Coffee', 'BEV025'),
('ITM026', 'MIM001', 'Mimosa', 'BEV026'),
('ITM027', 'SKC001', 'Sake', 'BEV027'),
('ITM028', 'CHI001', 'Chai', 'BEV028');

-- Desserts
INSERT INTO Item (item_id, sku, item_name, category_id)
VALUES
('ITM029', 'TMS001', 'Tiramisu', 'DES001'),
('ITM030', 'APP001', 'Apple Pie', 'DES002'),
('ITM031', 'MCR001', 'Macarons', 'DES003'),
('ITM032', 'GJB001', 'Gulab Jamun', 'DES004'),
('ITM033', 'MCH001', 'Mochi', 'DES005'),
('ITM034', 'CHS001', 'Churros', 'DES006'),
('ITM035', 'PVL001', 'Pavlova', 'DES007'),
('ITM036', 'CRB001', 'Creme Brulee', 'DES008'),
('ITM037', 'CHSCK001', 'Cheesecake', 'DES009'),
('ITM038', 'GEL001', 'Gelato', 'DES010'),
('ITM039', 'TLC001', 'Tres Leches Cake', 'DES011'),
('ITM040', 'SCT001', 'Sacher Torte', 'DES012'),
('ITM041', 'ECL001', 'Eclairs', 'DES013'),
('ITM042', 'KNF001', 'Knafeh', 'DES014'),
('ITM043', 'FLN001', 'Flan', 'DES015'),
('ITM044', 'BFP001', 'Banoffee Pie', 'DES016'),
('ITM045', 'BKV001', 'Baklava', 'DES017'),
('ITM046', 'MSR001', 'Mango Sticky Rice', 'DES018');

-- Side Dishes
INSERT INTO Item (item_id, sku, item_name, category_id)
VALUES
('ITM047', 'FF001', 'French Fries', 'SD001'),
('ITM048', 'OR001', 'Onion Rings', 'SD002'),
('ITM049', 'GUC001', 'Guacamole', 'SD003'),
('ITM050', 'BST001', 'Bruschetta', 'SD004'),
('ITM051', 'HUM001', 'Hummus', 'SD005'),
('ITM052', 'PZZ001', 'Pizza', 'SD006'),
('ITM053', 'CHSBRG001', 'Cheeseburger', 'SD007'),
('ITM054', 'SPR001', 'Spring Rolls', 'SD008'),
('ITM055', 'PKR001', 'Pakoras', 'SD009'),
('ITM056', 'GYZ001', 'Gyoza', 'SD010'),
('ITM057', 'PST001', 'Pasta', 'SD011'),
('ITM058', 'SMS001', 'Samosas', 'SD012'),
('ITM059', 'TBLH001', 'Tabbouleh', 'SD013'),
('ITM060', 'PTC001', 'Potato Croquettes', 'SD014'),
('ITM061', 'PTN001', 'Poutine', 'SD015'),
('ITM062', 'TST001', 'Tostones', 'SD016'),
('ITM063', 'KMKCHI001', 'Korean Kimchi', 'SD017'),
('ITM064', 'SV001', 'Sautéed Vegetables', 'SD018'),
('ITM065', 'FLFL001', 'Falafel', 'SD019'),
('ITM066', 'TMP001', 'Tempura', 'SD020');


-- SHIFT RECORDS;

SET @row_number = 0;

INSERT INTO Shift (shift_id, day_of_week, start_time, end_time)
SELECT 
    CONCAT('SH', LPAD(((@row_number:=@row_number+1) - 1) % 96 + 1, 3, '0')) as shift_id,
    CASE 
        WHEN (@row_number - 1) DIV 16 = 0 THEN 'Monday'
        WHEN (@row_number - 1) DIV 16 = 1 THEN 'Wednesday'
        WHEN (@row_number - 1) DIV 16 = 2 THEN 'Thursday'
        WHEN (@row_number - 1) DIV 16 = 3 THEN 'Friday'
        WHEN (@row_number - 1) DIV 16 = 4 THEN 'Saturday'
        WHEN (@row_number - 1) DIV 16 = 5 THEN 'Sunday'
    END as day_of_week,
    CASE 
        WHEN (@row_number - 1) % 16 < 8 THEN TIME '07:00:00'
        ELSE TIME '17:00:00'
    END as start_time,
    CASE 
        WHEN (@row_number - 1) % 16 < 8 THEN TIME '16:00:00'
        ELSE TIME '22:00:00'
    END as end_time
FROM
    information_schema.columns
WHERE
    @row_number < 96; -- 96 records for 16 weeks (6 days * 16 weeks)


-- STAFF RECORDS;

INSERT INTO Staff (staff_id, first_name, last_name, position, hourly_rate)
VALUES
('STF001', 'Utkarsh', 'Baxi', 'Barista', 300.00),
('STF002', 'Punya', 'Khuranna', 'Server', 250.00),
('STF003', 'Shreya', 'Goodluck', 'Chef', 400.00),
('STF004', 'Shivani', 'Devchandani', 'Kitchen Assistant', 200.00),
('STF005', 'Navneet', 'Bothra', 'Cashier', 250.00),
('STF006', 'Aditya', 'Chimankar', 'Pastry Chef', 350.00),
('STF007', 'Kritika', 'Trishule', 'Manager', 500.00),
('STF008', 'Abhay', 'Raichand', 'Assistant Manager', 435.00),
('STF009', 'Priya', 'Jaiswal', 'Busser', 180.00),
('STF010', 'Candy', 'Vohra', 'Host', 235.00),
('STF011', 'Ranvijay', 'Singha', 'Delivery Personnel', 210.00),
('STF012', 'Amrut', 'Nayak', 'Barback', 190.00),
('STF013', 'Vibhu', 'Gowda', 'Catering Coordinator', 300.00),
('STF014', 'Vivert', 'Pinto', 'Maintenance Personnel', 250.00),
('STF015', 'Rinni', 'Sen', 'Marketing Coordinator', 325.00),
('STF016', 'Santu', 'Pardesi', 'Beverage Specialist', 425.00);


-- ROTATION RECORDS;

-- Wednesday (SH001 - SH016)
INSERT INTO Rotation (rota_id, date, shift_id, staff_id) VALUES
('ROT001', '2023-01-18 07:00:00', 'SH001', 'STF001'), -- Utkarsh Baxi
('ROT002', '2023-01-18 07:00:00', 'SH002', 'STF002'), -- Punya Khuranna
('ROT003', '2023-01-18 07:00:00', 'SH003', 'STF003'), -- Shreya Goodluck
('ROT004', '2023-01-18 07:00:00', 'SH004', 'STF004'), -- Shivani Devchandani
('ROT005', '2023-01-18 07:00:00', 'SH005', 'STF005'), -- Navneet Bothra
('ROT006', '2023-01-18 07:00:00', 'SH006', 'STF006'), -- Aditya Chimankar
('ROT007', '2023-01-18 07:00:00', 'SH007', 'STF007'), -- Kritika Trishule
('ROT008', '2023-01-18 07:00:00', 'SH008', 'STF008'), -- Abhay Raichand
('ROT009', '2023-01-18 15:00:00', 'SH009', 'STF009'), -- Priya Jaiswal
('ROT010', '2023-01-18 15:00:00', 'SH010', 'STF010'), -- Candy Vohra
('ROT011', '2023-01-18 15:00:00', 'SH011', 'STF011'), -- Ranvijay Singha
('ROT012', '2023-01-18 15:00:00', 'SH012', 'STF012'), -- Amrut Nayak
('ROT013', '2023-01-18 15:00:00', 'SH013', 'STF013'), -- Vibhu Gowda
('ROT014', '2023-01-18 15:00:00', 'SH014', 'STF014'), -- Vivert Pinto
('ROT015', '2023-01-18 15:00:00', 'SH015', 'STF015'), -- Rinni Sen
('ROT016', '2023-01-18 15:00:00', 'SH016', 'STF016'); -- Santu Pardesi

-- Thursday (SH017 - SH032)
INSERT INTO Rotation (rota_id, date, shift_id, staff_id) VALUES
('ROT017', '2023-01-19 07:00:00', 'SH017', 'STF001'), -- Utkarsh Baxi
('ROT018', '2023-01-19 07:00:00', 'SH018', 'STF002'), -- Punya Khuranna
('ROT019', '2023-01-19 07:00:00', 'SH019', 'STF003'), -- Shreya Goodluck
('ROT020', '2023-01-19 07:00:00', 'SH020', 'STF004'), -- Shivani Devchandani
('ROT021', '2023-01-19 07:00:00', 'SH021', 'STF005'), -- Navneet Bothra
('ROT022', '2023-01-19 07:00:00', 'SH022', 'STF006'), -- Aditya Chimankar
('ROT023', '2023-01-19 07:00:00', 'SH023', 'STF007'), -- Kritika Trishule
('ROT024', '2023-01-19 07:00:00', 'SH024', 'STF008'), -- Abhay Raichand
('ROT025', '2023-01-19 15:00:00', 'SH025', 'STF009'), -- Priya Jaiswal
('ROT026', '2023-01-19 15:00:00', 'SH026', 'STF010'), -- Candy Vohra
('ROT027', '2023-01-19 15:00:00', 'SH027', 'STF011'), -- Ranvijay Singha
('ROT028', '2023-01-19 15:00:00', 'SH028', 'STF012'), -- Amrut Nayak
('ROT029', '2023-01-19 15:00:00', 'SH029', 'STF013'), -- Vibhu Gowda
('ROT030', '2023-01-19 15:00:00', 'SH030', 'STF014'), -- Vivert Pinto
('ROT031', '2023-01-19 15:00:00', 'SH031', 'STF015'), -- Rinni Sen
('ROT032', '2023-01-19 15:00:00', 'SH032', 'STF016'); -- Santu Pardesi

-- Friday to Sunday (Weekend)

-- Friday (SH033 - SH048)
INSERT INTO Rotation (rota_id, date, shift_id, staff_id) VALUES
('ROT033', '2023-01-20 07:00:00', 'SH033', 'STF001'), -- Utkarsh Baxi
('ROT034', '2023-01-20 07:00:00', 'SH034', 'STF002'), -- Punya Khuranna
('ROT035', '2023-01-20 07:00:00', 'SH035', 'STF003'), -- Shreya Goodluck
('ROT036', '2023-01-20 07:00:00', 'SH036', 'STF004'), -- Shivani Devchandani
('ROT037', '2023-01-20 07:00:00', 'SH037', 'STF005'), -- Navneet Bothra
('ROT038', '2023-01-20 07:00:00', 'SH038', 'STF006'), -- Aditya Chimankar
('ROT039', '2023-01-20 07:00:00', 'SH039', 'STF007'), -- Kritika Trishule
('ROT040', '2023-01-20 07:00:00', 'SH040', 'STF008'), -- Abhay Raichand
('ROT041', '2023-01-20 15:00:00', 'SH041', 'STF009'), -- Priya Jaiswal
('ROT042', '2023-01-20 15:00:00', 'SH042', 'STF010'), -- Candy Vohra
('ROT043', '2023-01-20 15:00:00', 'SH043', 'STF011'), -- Ranvijay Singha
('ROT044', '2023-01-20 15:00:00', 'SH044', 'STF012'), -- Amrut Nayak
('ROT045', '2023-01-20 15:00:00', 'SH045', 'STF013'), -- Vibhu Gowda
('ROT046', '2023-01-20 15:00:00', 'SH046', 'STF014'), -- Vivert Pinto
('ROT047', '2023-01-20 15:00:00', 'SH047', 'STF015'), -- Rinni Sen
('ROT048', '2023-01-20 15:00:00', 'SH048', 'STF016'); -- Santu Pardesi

-- Saturday (SH049 - SH064)
INSERT INTO Rotation (rota_id, date, shift_id, staff_id) VALUES
('ROT049', '2023-01-21 07:00:00', 'SH049', 'STF001'), -- Utkarsh Baxi
('ROT050', '2023-01-21 07:00:00', 'SH050', 'STF002'), -- Punya Khuranna
('ROT051', '2023-01-21 07:00:00', 'SH051', 'STF003'), -- Shreya Goodluck
('ROT052', '2023-01-21 07:00:00', 'SH052', 'STF004'), -- Shivani Devchandani
('ROT053', '2023-01-21 07:00:00', 'SH053', 'STF005'), -- Navneet Bothra
('ROT054', '2023-01-21 07:00:00', 'SH054', 'STF006'), -- Aditya Chimankar
('ROT055', '2023-01-21 07:00:00', 'SH055', 'STF007'), -- Kritika Trishule
('ROT056', '2023-01-21 07:00:00', 'SH056', 'STF008'), -- Abhay Raichand
('ROT057', '2023-01-21 15:00:00', 'SH057', 'STF009'), -- Priya Jaiswal
('ROT058', '2023-01-21 15:00:00', 'SH058', 'STF010'), -- Candy Vohra
('ROT059', '2023-01-21 15:00:00', 'SH059', 'STF011'), -- Ranvijay Singha
('ROT060', '2023-01-21 15:00:00', 'SH060', 'STF012'), -- Amrut Nayak
('ROT061', '2023-01-21 15:00:00', 'SH061', 'STF013'), -- Vibhu Gowda
('ROT062', '2023-01-21 15:00:00', 'SH062', 'STF014'), -- Vivert Pinto
('ROT063', '2023-01-21 15:00:00', 'SH063', 'STF015'), -- Rinni Sen
('ROT064', '2023-01-21 15:00:00', 'SH064', 'STF016'); -- Santu Pardesi

-- Sunday (SH065 - SH080)
INSERT INTO Rotation (rota_id, date, shift_id, staff_id) VALUES
('ROT065', '2023-01-22 07:00:00', 'SH065', 'STF001'), -- Utkarsh Baxi
('ROT066', '2023-01-22 07:00:00', 'SH066', 'STF002'), -- Punya Khuranna
('ROT067', '2023-01-22 07:00:00', 'SH067', 'STF003'), -- Shreya Goodluck
('ROT068', '2023-01-22 07:00:00', 'SH068', 'STF004'), -- Shivani Devchandani
('ROT069', '2023-01-22 07:00:00', 'SH069', 'STF005'), -- Navneet Bothra
('ROT070', '2023-01-22 07:00:00', 'SH070', 'STF006'), -- Aditya Chimankar
('ROT071', '2023-01-22 07:00:00', 'SH071', 'STF007'), -- Kritika Trishule
('ROT072', '2023-01-22 07:00:00', 'SH072', 'STF008'), -- Abhay Raichand
('ROT073', '2023-01-22 15:00:00', 'SH073', 'STF009'), -- Priya Jaiswal
('ROT074', '2023-01-22 15:00:00', 'SH074', 'STF010'), -- Candy Vohra
('ROT075', '2023-01-22 15:00:00', 'SH075', 'STF011'), -- Ranvijay Singha
('ROT076', '2023-01-22 15:00:00', 'SH076', 'STF012'), -- Amrut Nayak
('ROT077', '2023-01-22 15:00:00', 'SH077', 'STF013'), -- Vibhu Gowda
('ROT078', '2023-01-22 15:00:00', 'SH078', 'STF014'), -- Vivert Pinto
('ROT079', '2023-01-22 15:00:00', 'SH079', 'STF015'), -- Rinni Sen
('ROT080', '2023-01-22 15:00:00', 'SH080', 'STF016'); -- Santu Pardesi

-- Monday (SH081 - SH096)
INSERT INTO Rotation (rota_id, date, shift_id, staff_id) VALUES
('ROT081', '2023-01-23 07:00:00', 'SH081', 'STF001'), -- Utkarsh Baxi
('ROT082', '2023-01-23 07:00:00', 'SH082', 'STF002'), -- Punya Khuranna
('ROT083', '2023-01-23 07:00:00', 'SH083', 'STF003'), -- Shreya Goodluck
('ROT084', '2023-01-23 07:00:00', 'SH084', 'STF004'), -- Shivani Devchandani
('ROT085', '2023-01-23 07:00:00', 'SH085', 'STF005'), -- Navneet Bothra
('ROT086', '2023-01-23 07:00:00', 'SH086', 'STF006'), -- Aditya Chimankar
('ROT087', '2023-01-23 07:00:00', 'SH087', 'STF007'), -- Kritika Trishule
('ROT088', '2023-01-23 07:00:00', 'SH088', 'STF008'), -- Abhay Raichand
('ROT089', '2023-01-23 15:00:00', 'SH089', 'STF009'), -- Priya Jaiswal
('ROT090', '2023-01-23 15:00:00', 'SH090', 'STF010'), -- Candy Vohra
('ROT091', '2023-01-23 15:00:00', 'SH091', 'STF011'), -- Ranvijay Singha
('ROT092', '2023-01-23 15:00:00', 'SH092', 'STF012'), -- Amrut Nayak
('ROT093', '2023-01-23 15:00:00', 'SH093', 'STF013'), -- Vibhu Gowda
('ROT094', '2023-01-23 15:00:00', 'SH094', 'STF014'), -- Vivert Pinto
('ROT095', '2023-01-23 15:00:00', 'SH095', 'STF015'), -- Rinni Sen
('ROT096', '2023-01-23 15:00:00', 'SH096', 'STF016'); -- Santu Pardesi


-- RECIPE RECORDS;

-- Beverages
INSERT INTO Recipe (recipe_id, ing_id, quantity)
VALUES
('Espresso', 'ING001', 8), ('Espresso', 'ING002', 1),
('Double Espresso', 'ING001', 3), ('Double Espresso', 'ING002', 4),
('Red Eye Coffee', 'ING003', 1), ('Red Eye Coffee', 'ING001', 1), ('Red Eye Coffee', 'ING002', 2),
('Black Eye Coffee', 'ING003', 1), ('Black Eye Coffee', 'ING001', 3), ('Black Eye Coffee', 'ING002', 5),
('Americano', 'ING001', 8), ('Americano', 'ING002', 8),
('Long Black', 'ING001', 1), ('Long Black', 'ING002', 3),
('Macchiato', 'ING004', 5), ('Macchiato', 'ING001', 5), ('Macchiato', 'ING002', 4),
('Long Macchiato', 'ING004', 5), ('Long Macchiato', 'ING001', 3), ('Long Macchiato', 'ING002', 8),
('Cortado', 'ING004', 7), ('Cortado', 'ING001', 4), ('Cortado', 'ING002', 4),
('Breve', 'ING005', 8), ('Breve', 'ING001', 5), ('Breve', 'ING002', 7),
('Cappuccino', 'ING006', 3), ('Cappuccino', 'ING004', 1), ('Cappuccino', 'ING001', 4), ('Cappuccino', 'ING002', 3),
('Flat White', 'ING006', 7), ('Flat White', 'ING004', 3), ('Flat White', 'ING001', 3), ('Flat White', 'ING002', 4),
('Cafe Latte', 'ING004', 2), ('Cafe Latte', 'ING001', 8), ('Cafe Latte', 'ING002', 8),
('Mocha', 'ING043', 6), ('Mocha', 'ING007', 7), ('Mocha', 'ING008', 1), ('Mocha', 'ING004', 7), ('Mocha', 'ING001', 7), ('Mocha', 'ING002', 7),
('Vienna', 'ING041', 4), ('Vienna', 'ING008', 8), ('Vienna', 'ING004', 4), ('Vienna', 'ING001', 5), ('Vienna', 'ING002', 1),
('Affogato', 'ING009', 7), ('Affogato', 'ING001', 1), ('Affogato', 'ING002', 7),
('Cafe au Lait', 'ING004', 5), ('Cafe au Lait', 'ING001', 6), ('Cafe au Lait', 'ING002', 6),
('Iced Coffee', 'ING012', 2), ('Iced Coffee', 'ING033', 2), ('Iced Coffee', 'ING041', 3), ('Iced Coffee', 'ING001', 2), ('Iced Coffee', 'ING002', 6),
('Margarita', 'ING012', 2), ('Margarita', 'ING014', 5), ('Margarita', 'ING015', 2), ('Margarita', 'ING016', 4), ('Margarita', 'ING017', 3),
('Martini', 'ING012', 6), ('Martini', 'ING018', 1), ('Martini', 'ING019', 5), ('Martini', 'ING020', 5),
('Mojito', 'ING012', 2), ('Mojito', 'ING041', 2), ('Mojito', 'ING021', 6), ('Mojito', 'ING022', 4), ('Mojito', 'ING015', 2), ('Mojito', 'ING024', 6),
('Caipirinha', 'ING012', 7), ('Caipirinha', 'ING041', 3), ('Caipirinha', 'ING025', 7), ('Caipirinha', 'ING091', 3),
('Pina Colada', 'ING012', 3), ('Pina Colada', 'ING021', 2), ('Pina Colada', 'ING027', 3), ('Pina Colada', 'ING026', 2),
('Sangria', 'ING012', 5), ('Sangria', 'ING041', 5), ('Sangria', 'ING024', 1), ('Sangria', 'ING028', 4), ('Sangria', 'ING029', 2), ('Sangria', 'ING030', 3), ('Sangria', 'ING031', 3),
('Irish Coffee', 'ING032', 4), ('Irish Coffee', 'ING008', 5), ('Irish Coffee', 'ING003', 2),
('Mimosa', 'ING034', 2), ('Mimosa', 'ING030', 3), ('Mimosa', 'ING029', 1),
('Sake', 'ING035', 6), ('Sake', 'ING062', 8),
('Chai', 'ING062', 4), ('Chai', 'ING041', 7), ('Chai', 'ING037', 4), ('Chai', 'ING036', 6), ('Chai', 'ING011', 2), ('Chai', 'ING065', 8);

-- Desserts
INSERT INTO Recipe (recipe_id, ing_id, quantity)
VALUES
('Tiramisu', 'ING038', 2), ('Tiramisu', 'ING039', 7), ('Tiramisu', 'ING040', 8), ('Tiramisu', 'ING041', 8), ('Tiramisu', 'ING042', 1), ('Tiramisu', 'ING043', 5), ('Tiramisu', 'ING025', 6),
('Apple Pie', 'ING041', 6), ('Apple Pie', 'ING044', 3), ('Apple Pie', 'ING045', 5), ('Apple Pie', 'ING046', 1), ('Apple Pie', 'ING047', 2), ('Apple Pie', 'ING048', 1),
('Macarons', 'ING049', 5), ('Macarons', 'ING050', 6), ('Macarons', 'ING051', 6), ('Macarons', 'ING052', 4),
('Gulab Jamun', 'ING056', 1), ('Gulab Jamun', 'ING058', 8), ('Gulab Jamun', 'ING059', 6), ('Gulab Jamun', 'ING060', 6), ('Gulab Jamun', 'ING062', 1), ('Gulab Jamun', 'ING041', 3), ('Gulab Jamun', 'ING083', 5), ('Gulab Jamun', 'ING086', 8),
('Mochi', 'ING041', 2), ('Mochi', 'ING062', 6), ('Mochi', 'ING061', 2), ('Mochi', 'ING066', 8),
('Churros', 'ING041', 6), ('Churros', 'ING062', 1), ('Churros', 'ING047', 2), ('Churros', 'ING045', 6), ('Churros', 'ING083', 8),
('Pavlova', 'ING041', 6), ('Pavlova', 'ING065', 4), ('Pavlova', 'ING040', 8), ('Pavlova', 'ING066', 7), ('Pavlova', 'ING008', 8), ('Pavlova', 'ING029', 2), ('Pavlova', 'ING067', 2),
('Creme Brulee', 'ING041', 5), ('Creme Brulee', 'ING065', 4), ('Creme Brulee', 'ING040', 1), ('Creme Brulee', 'ING051', 2), ('Creme Brulee', 'ING033', 8),
('Cheesecake', 'ING041', 1), ('Cheesecake', 'ING065', 4), ('Cheesecake', 'ING040', 8), ('Cheesecake', 'ING064', 2), ('Cheesecake', 'ING070', 5), ('Cheesecake', 'ING071', 1), ('Cheesecake', 'ING046', 4),
('Gelato', 'ING041', 1), ('Gelato', 'ING065', 2), ('Gelato', 'ING064', 4), ('Gelato', 'ING062', 6), ('Gelato', 'ING004', 2),
('Tres Leches Cake', 'ING004', 7), ('Tres Leches Cake', 'ING064', 5), ('Tres Leches Cake', 'ING041', 5), ('Tres Leches Cake', 'ING040', 8), ('Tres Leches Cake', 'ING046', 7), ('Tres Leches Cake', 'ING086', 4), ('Tres Leches Cake', 'ING008', 7), ('Tres Leches Cake', 'ING063', 6),
('Sacher Torte', 'ING041', 7), ('Sacher Torte', 'ING040', 1), ('Sacher Torte', 'ING046', 6), ('Sacher Torte', 'ING086', 4), ('Sacher Torte', 'ING072', 8), ('Sacher Torte', 'ING073', 4), ('Sacher Torte', 'ING057', 4),
('Eclairs', 'ING040', 2), ('Eclairs', 'ING046', 2), ('Eclairs', 'ING086', 3), ('Eclairs', 'ING064', 1), ('Eclairs', 'ING072', 2), ('Eclairs', 'ING065', 1), ('Eclairs', 'ING051', 4), ('Eclairs', 'ING062', 1),
('Knafeh', 'ING053', 1), ('Knafeh', 'ING054', 3), ('Knafeh', 'ING062', 3), ('Knafeh', 'ING041', 4), ('Knafeh', 'ING046', 4), ('Knafeh', 'ING059', 7), ('Knafeh', 'ING060', 7), ('Knafeh', 'ING077', 7), ('Knafeh', 'ING078', 5),
('Flan', 'ING041', 5), ('Flan', 'ING065', 7), ('Flan', 'ING040', 6), ('Flan', 'ING062', 8), ('Flan', 'ING008', 4), ('Flan', 'ING063', 2), ('Flan', 'ING004', 1),
('Banoffee Pie', 'ING071', 5), ('Banoffee Pie', 'ING046', 5), ('Banoffee Pie', 'ING063', 3), ('Banoffee Pie', 'ING064', 5), ('Banoffee Pie', 'ING072', 8),
('Baklava', 'ING046', 8), ('Baklava', 'ING078', 8), ('Baklava', 'ING053', 1), ('Baklava', 'ING054', 5),
('Mango Sticky Rice', 'ING041', 2), ('Mango Sticky Rice', 'ING079', 6), ('Mango Sticky Rice', 'ING080', 5), ('Mango Sticky Rice', 'ING081', 1), ('Mango Sticky Rice', 'ING084', 6);


-- Side Dishes 
INSERT INTO Recipe (recipe_id, ing_id, quantity)
VALUES
('French Fries', 'ING083', 8), ('French Fries', 'ING082', 5), ('French Fries', 'ING084', 2),
('Onion Rings', 'ING083', 2), ('Onion Rings', 'ING084', 1), ('Onion Rings', 'ING085', 2), ('Onion Rings', 'ING086', 7), ('Onion Rings', 'ING087', 5), ('Onion Rings', 'ING088', 1),
('Guacamole', 'ING089', 4), ('Guacamole', 'ING090', 4), ('Guacamole', 'ING091', 6), ('Guacamole', 'ING092', 4), ('Guacamole', 'ING098', 7), ('Guacamole', 'ING099', 7), ('Guacamole', 'ING084', 4),
('Bruschetta', 'ING093', 7), ('Bruschetta', 'ING094', 8), ('Bruschetta', 'ING095', 8), ('Bruschetta', 'ING098', 8), ('Bruschetta', 'ING085', 1), ('Bruschetta', 'ING090', 3), ('Bruschetta', 'ING084', 5), ('Bruschetta', 'ING020', 6),
('Hummus', 'ING096', 7), ('Hummus', 'ING097', 6), ('Hummus', 'ING098', 4), ('Hummus', 'ING084', 2), ('Hummus', 'ING091', 3), ('Hummus', 'ING062', 1), ('Hummus', 'ING020', 2), ('Hummus', 'ING099', 7),
('Pizza', 'ING100', 3), ('Pizza', 'ING101', 4), ('Pizza', 'ING102', 8), ('Pizza', 'ING103', 4), ('Pizza', 'ING104', 6), ('Pizza', 'ING020', 7), ('Pizza', 'ING084', 8),
('Cheeseburger', 'ING104', 2), ('Cheeseburger', 'ING105', 8), ('Cheeseburger', 'ING106', 5), ('Cheeseburger', 'ING107', 8), ('Cheeseburger', 'ING108', 8), ('Cheeseburger', 'ING109', 8), ('Cheeseburger', 'ING084', 6),
('Spring Rolls', 'ING110', 4), ('Spring Rolls', 'ING111', 4), ('Spring Rolls', 'ING112', 8), ('Spring Rolls', 'ING113', 4), ('Spring Rolls', 'ING114', 2), ('Spring Rolls', 'ING107', 8), ('Spring Rolls', 'ING123', 8), ('Spring Rolls', 'ING084', 8),
('Pakoras', 'ING115', 1), ('Pakoras', 'ING116', 3), ('Pakoras', 'ING113', 4), ('Pakoras', 'ING084', 4), ('Pakoras', 'ING121', 8), ('Pakoras', 'ING083', 1), ('Pakoras', 'ING062', 4), ('Pakoras', 'ING088', 1),
('Gyoza', 'ING117', 3), ('Gyoza', 'ING118', 8), ('Gyoza', 'ING119', 2), ('Gyoza', 'ING121', 6), ('Gyoza', 'ING084', 2), ('Gyoza', 'ING098', 6), ('Gyoza', 'ING104', 1),
('Pasta', 'ING121', 8), ('Pasta', 'ING084', 5), ('Pasta', 'ING098', 8), ('Pasta', 'ING113', 8), ('Pasta', 'ING120', 2), ('Pasta', 'ING077', 1),
('Samosas', 'ING083', 5), ('Samosas', 'ING082', 4), ('Samosas', 'ING084', 7), ('Samosas', 'ING085', 4), ('Samosas', 'ING086', 2), ('Samosas', 'ING099', 3), ('Samosas', 'ING098', 2), ('Samosas', 'ING015', 6), ('Samosas', 'ING088', 3),
('Tabbouleh', 'ING003', 1), ('Tabbouleh', 'ING001', 5), ('Tabbouleh', 'ING085', 6), ('Tabbouleh', 'ING090', 5), ('Tabbouleh', 'ING015', 6), ('Tabbouleh', 'ING084', 6),
('Potato Croquettes', 'ING083', 3), ('Potato Croquettes', 'ING082', 5), ('Potato Croquettes', 'ING084', 8), ('Potato Croquettes', 'ING086', 2), ('Potato Croquettes', 'ING040', 1), ('Potato Croquettes', 'ING087', 5), ('Potato Croquettes', 'ING077', 8),
('Poutine', 'ING082', 7), ('Poutine', 'ING077', 3), ('Poutine', 'ING083', 3), ('Poutine', 'ING084', 5),
('Tostones', 'ING125', 6), ('Tostones', 'ING083', 7), ('Tostones', 'ING084', 3),
('Korean Kimchi', 'ING118', 6), ('Korean Kimchi', 'ING119', 6), ('Korean Kimchi', 'ING041', 4), ('Korean Kimchi', 'ING098', 1), ('Korean Kimchi', 'ING062', 8), ('Korean Kimchi', 'ING116', 4), ('Korean Kimchi', 'ING122', 3),
('Sautéed Vegetables', 'ING121', 1), ('Sautéed Vegetables', 'ING084', 7), ('Sautéed Vegetables', 'ING091', 7), ('Sautéed Vegetables', 'ING092', 4), ('Sautéed Vegetables', 'ING098', 8), ('Sautéed Vegetables', 'ING099', 2), ('Sautéed Vegetables', 'ING083', 4),
('Falafel', 'ING084', 4), ('Falafel', 'ING091', 8), ('Falafel', 'ING092', 5), ('Falafel', 'ING098', 8), ('Falafel', 'ING099', 7), ('Falafel', 'ING083', 2), ('Falafel', 'ING096', 4),
('Tempura', 'ING121', 7), ('Tempura', 'ING084', 6), ('Tempura', 'ING091', 1), ('Tempura', 'ING092', 3), ('Tempura', 'ING098', 4), ('Tempura', 'ING099', 1), ('Tempura', 'ING083', 2), ('Tempura', 'ING112', 4);


-- ORDERS RECORDS;

INSERT INTO Orders (order_id, cust_id, item_id, quantity, created_at, delivery, add_id)
VALUES
-- Customer 1
(1, 1, 'ITM001', 145, '2023-01-05', 'Shipped', 1),
(2, 1, 'ITM029', 59, '2023-01-08', 'Delivered', 2),
(3, 1, 'ITM047', 112, '2023-01-12', 'Processing', 3),

-- Customer 2
(4, 2, 'ITM002', 131, '2023-01-18', 'Shipped', 4),
(5, 2, 'ITM030', 67, '2023-01-22', 'Delivered', 5),
(6, 2, 'ITM048', 96, '2023-01-25', 'Processing', 6),

-- Customer 3
(7, 3, 'ITM003', 128, '2023-01-30', 'Shipped', 7),
(8, 3, 'ITM031', 100, '2023-02-02', 'Delivered', 8),
(9, 3, 'ITM049', 67, '2023-02-06', 'Processing', 9),

-- Customer 4
(10, 4, 'ITM004', 88, '2023-02-12', 'Shipped', 10),
(11, 4, 'ITM032', 86, '2023-02-15', 'Delivered', 11),
(12, 4, 'ITM050', 118, '2023-02-19', 'Processing', 12),

-- Customer 5
(13, 5, 'ITM005', 80, '2023-02-25', 'Shipped', 13),
(14, 5, 'ITM033', 99, '2023-03-01', 'Delivered', 14),
(15, 5, 'ITM051', 105, '2023-03-05', 'Processing', 15),

-- Customer 6
(16, 6, 'ITM006', 76, '2023-03-10', 'Shipped', 16),
(17, 6, 'ITM034', 115, '2023-03-13', 'Delivered', 17),
(18, 6, 'ITM052', 99, '2023-03-17', 'Processing', 18),

-- Customer 7
(19, 7, 'ITM007', 98, '2023-03-23', 'Shipped', 19),
(20, 7, 'ITM035', 142, '2023-03-26', 'Delivered', 20),
(21, 7, 'ITM053', 66, '2023-03-30', 'Processing', 21),

-- Customer 8
(22, 8, 'ITM008', 54, '2023-04-05', 'Shipped', 22),
(23, 8, 'ITM036', 124, '2023-04-08', 'Delivered', 23),
(24, 8, 'ITM054', 106, '2023-04-12', 'Processing', 24),

-- Customer 9
(25, 9, 'ITM009', 108, '2023-04-18', 'Shipped', 25),
(26, 9, 'ITM037', 70, '2023-04-21', 'Delivered', 26),
(27, 9, 'ITM055', 79, '2023-04-25', 'Processing', 27),

-- Customer 10
(28, 10, 'ITM010', 137, '2023-04-30', 'Shipped', 28),
(29, 10, 'ITM038', 94, '2023-05-03', 'Delivered', 29),
(30, 10, 'ITM056', 109, '2023-05-07', 'Processing', 30),

-- Customer 11
(31, 11, 'ITM011', 115, '2023-05-15', 'Shipped', 31),
(32, 11, 'ITM039', 96, '2023-05-18', 'Delivered', 32),
(33, 11, 'ITM057', 88, '2023-05-22', 'Processing', 33),

-- Customer 12
(34, 12, 'ITM012', 99, '2023-05-28', 'Shipped', 34),
(35, 12, 'ITM040', 83, '2023-06-01', 'Delivered', 35),
(36, 12, 'ITM058', 68, '2023-06-04', 'Processing', 36),

-- Customer 13
(37, 13, 'ITM013', 144, '2023-06-10', 'Shipped', 37),
(38, 13, 'ITM041', 62, '2023-06-13', 'Delivered', 38),
(39, 13, 'ITM059', 132, '2023-06-17', 'Processing', 39),

-- Customer 14
(40, 14, 'ITM014', 121, '2023-06-23', 'Shipped', 40),
(41, 14, 'ITM042', 59, '2023-06-26', 'Delivered', 41),
(42, 14, 'ITM060', 86, '2023-06-30', 'Processing', 42),

-- Customer 15
(43, 15, 'ITM015', 101, '2023-07-05', 'Shipped', 43),
(44, 15, 'ITM043', 96, '2023-07-08', 'Delivered', 44),
(45, 15, 'ITM061', 128, '2023-07-12', 'Processing', 45),

-- Customer 16
(46, 16, 'ITM016', 98, '2023-07-18', 'Shipped', 46),
(47, 16, 'ITM044', 60, '2023-07-21', 'Delivered', 47),
(48, 16, 'ITM062', 54, '2023-07-25', 'Processing', 48),

-- Customer 17
(49, 17, 'ITM017', 145, '2023-07-30', 'Shipped', 49),
(50, 17, 'ITM045', 108, '2023-08-02', 'Delivered', 50),
(51, 17, 'ITM063', 55, '2023-08-06', 'Processing', 51),

-- Customer 18
(52, 18, 'ITM018', 103, '2023-08-12', 'Shipped', 52),
(53, 18, 'ITM046', 97, '2023-08-15', 'Delivered', 53),
(54, 18, 'ITM064', 128, '2023-08-19', 'Processing', 54),

-- Customer 19
(55, 19, 'ITM019', 100, '2023-08-25', 'Shipped', 55),
(56, 19, 'ITM047', 63, '2023-08-28', 'Delivered', 56),
(57, 19, 'ITM065', 69, '2023-09-01', 'Processing', 57),

-- Customer 20
(58, 20, 'ITM020', 104, '2023-09-07', 'Shipped', 58),
(59, 20, 'ITM048', 62, '2023-09-10', 'Delivered', 59),
(60, 20, 'ITM066', 51, '2023-09-14', 'Processing', 60),

-- Customer 21
(61, 21, 'ITM021', 119, '2023-09-20', 'Shipped', 61),
(62, 21, 'ITM049', 90, '2023-09-23', 'Delivered', 62),
(63, 21, 'ITM065', 142, '2023-09-27', 'Processing', 63),

-- Customer 22
(64, 22, 'ITM022', 91, '2023-10-03', 'Shipped', 64),
(65, 22, 'ITM050', 81, '2023-10-06', 'Delivered', 65),
(66, 22, 'ITM001', 81, '2023-10-10', 'Processing', 66),

-- Customer 23
(67, 23, 'ITM023', 113, '2023-10-16', 'Shipped', 67),
(68, 23, 'ITM051', 72, '2023-10-19', 'Delivered', 68),
(69, 23, 'ITM002', 71, '2023-10-23', 'Processing', 69),

-- Customer 24
(70, 24, 'ITM024', 89, '2023-10-30', 'Shipped', 70),
(71, 24, 'ITM052', 82, '2023-11-02', 'Delivered', 71),
(72, 24, 'ITM003', 92, '2023-11-06', 'Processing', 72),

-- Customer 25
(73, 25, 'ITM025', 63, '2023-11-12', 'Shipped', 73),
(74, 25, 'ITM053', 94, '2023-11-15', 'Delivered', 74),
(75, 25, 'ITM004', 128, '2023-11-19', 'Processing', 75),

-- Customer 26
(76, 26, 'ITM026', 105, '2023-11-25', 'Shipped', 76),
(77, 26, 'ITM054', 94, '2023-11-28', 'Delivered', 77),
(78, 26, 'ITM005', 105, '2023-12-02', 'Processing', 78),

-- Customer 27
(79, 27, 'ITM027', 92, '2023-12-08', 'Shipped', 79),
(80, 27, 'ITM055', 97, '2023-12-11', 'Delivered', 80),
(81, 27, 'ITM006', 56, '2023-12-15', 'Processing', 81),

-- Customer 28
(82, 28, 'ITM028', 141, '2023-12-21', 'Shipped', 82),
(83, 28, 'ITM056', 84, '2023-12-24', 'Delivered', 83),
(84, 28, 'ITM007', 150, '2023-12-28', 'Processing', 84),

-- Customer 29
(85, 29, 'ITM029', 145, '2024-01-03', 'Shipped', 85),
(86, 29, 'ITM057', 125, '2024-01-06', 'Delivered', 86),
(87, 29, 'ITM008', 142, '2024-01-10', 'Processing', 87),

-- Customer 30
(88, 30, 'ITM030', 82, '2024-01-16', 'Shipped', 88),
(89, 30, 'ITM058', 139, '2024-01-19', 'Delivered', 89),
(90, 30, 'ITM009', 94, '2024-01-23', 'Processing', 90),

-- Customer 31
(91, 31, 'ITM031', 105, '2024-01-30', 'Shipped', 91),
(92, 31, 'ITM059', 92, '2024-02-02', 'Delivered', 92),
(93, 31, 'ITM010', 96, '2024-02-06', 'Processing', 93),

-- Customer 32
(94, 32, 'ITM032', 53, '2024-02-13', 'Shipped', 94),
(95, 32, 'ITM060', 130, '2024-02-16', 'Delivered', 95),
(96, 32, 'ITM011', 140, '2024-02-20', 'Processing', 96),

-- Customer 33
(97, 33, 'ITM033', 55, '2024-02-27', 'Shipped', 97),
(98, 33, 'ITM061', 111, '2024-03-01', 'Delivered', 98),
(99, 33, 'ITM012', 139, '2024-03-05', 'Processing', 99),

-- Customer 34
(100, 34, 'ITM034', 111, '2024-03-11', 'Shipped', 100),
(101, 34, 'ITM062', 87, '2024-03-14', 'Delivered', 1),
(102, 34, 'ITM013', 53, '2024-03-18', 'Processing', 2),

-- Customer 35
(103, 35, 'ITM035', 54, '2024-03-24', 'Shipped', 3),
(104, 35, 'ITM063', 61, '2024-03-27', 'Delivered', 4),
(105, 35, 'ITM014', 93, '2024-03-31', 'Processing', 5),

-- Customer 36
(106, 36, 'ITM036', 132, '2024-04-06', 'Shipped', 6),
(107, 36, 'ITM064', 131, '2024-04-09', 'Delivered', 7),
(108, 36, 'ITM015', 108, '2024-04-13', 'Processing', 8),

-- Customer 37
(109, 37, 'ITM037', 96, '2024-04-20', 'Shipped', 9),
(110, 37, 'ITM065', 108, '2024-04-23', 'Delivered', 10),
(111, 37, 'ITM016', 101, '2024-04-27', 'Processing', 11),

-- Customer 38
(112, 38, 'ITM038', 130, '2024-05-04', 'Shipped', 12),
(113, 38, 'ITM066', 96, '2024-05-07', 'Delivered', 13),
(114, 38, 'ITM017', 143, '2024-05-11', 'Processing', 14),

-- Customer 39
(115, 39, 'ITM039', 75, '2024-05-18', 'Shipped', 15),
(116, 39, 'ITM060', 96, '2024-05-21', 'Delivered', 16),
(117, 39, 'ITM018', 106, '2024-05-25', 'Processing', 17),

-- Customer 40
(118, 40, 'ITM040', 90, '2024-06-01', 'Shipped', 18),
(119, 40, 'ITM063', 84, '2024-06-04', 'Delivered', 19),
(120, 40, 'ITM019', 101, '2024-06-08', 'Processing', 20),

-- Customer 41
(121, 41, 'ITM041', 100, '2024-06-15', 'Shipped', 21),
(122, 41, 'ITM064', 149, '2024-06-18', 'Delivered', 22),
(123, 41, 'ITM020', 92, '2024-06-22', 'Processing', 23),

-- Customer 42
(124, 42, 'ITM042', 67, '2024-06-29', 'Shipped', 24),
(125, 42, 'ITM053', 108, '2024-07-02', 'Delivered', 25),
(126, 42, 'ITM021', 86, '2024-07-06', 'Processing', 26),

-- Customer 43
(127, 43, 'ITM043', 58, '2024-07-13', 'Shipped', 27),
(128, 43, 'ITM054', 85, '2024-07-16', 'Delivered', 28),
(129, 43, 'ITM022', 101, '2024-07-20', 'Processing', 29),

-- Customer 44
(130, 44, 'ITM044', 99, '2024-07-27', 'Shipped', 30),
(131, 44, 'ITM057', 141, '2024-07-30', 'Delivered', 31),
(132, 44, 'ITM023', 55, '2024-08-03', 'Processing', 32),

-- Customer 45
(133, 45, 'ITM045', 107, '2024-08-10', 'Shipped', 33),
(134, 45, 'ITM058', 117, '2024-08-13', 'Delivered', 34),
(135, 45, 'ITM024', 113, '2024-08-17', 'Processing', 35),

-- Customer 46
(136, 46, 'ITM046', 66, '2024-08-24', 'Shipped', 36),
(137, 46, 'ITM035', 144, '2024-08-27', 'Delivered', 37),
(138, 46, 'ITM025', 66, '2024-08-31', 'Processing', 38),

-- Customer 47
(139, 47, 'ITM047', 50, '2024-09-07', 'Shipped', 39),
(140, 47, 'ITM039', 104, '2024-09-10', 'Delivered', 40),
(141, 47, 'ITM026', 121, '2024-09-14', 'Processing', 41),

-- Customer 48
(142, 48, 'ITM048', 140, '2024-09-21', 'Shipped', 42),
(143, 48, 'ITM024', 86, '2024-09-24', 'Delivered', 43),
(144, 48, 'ITM027', 61, '2024-09-28', 'Processing', 44),

-- Customer 49
(145, 49, 'ITM049', 99, '2024-10-05', 'Shipped', 45),
(146, 49, 'ITM022', 59, '2024-10-08', 'Delivered', 46),
(147, 49, 'ITM028', 150, '2024-10-12', 'Processing', 47),

-- Customer 50
(148, 50, 'ITM050', 121, '2024-10-19', 'Shipped', 48),
(149, 50, 'ITM048', 103, '2024-10-22', 'Delivered', 49),
(150, 50, 'ITM029', 104, '2024-10-26', 'Processing', 50),

-- Customer 51
(151, 51, 'ITM051', 62, '2024-11-02', 'Shipped', 51),
(152, 51, 'ITM031', 149, '2024-11-05', 'Delivered', 52),
(153, 51, 'ITM030', 105, '2024-11-09', 'Processing', 53),

-- Customer 52
(154, 52, 'ITM052', 131, '2024-11-16', 'Shipped', 54),
(155, 52, 'ITM001', 88, '2024-11-19', 'Delivered', 55),
(156, 52, 'ITM031', 97, '2024-11-23', 'Processing', 56),

-- Customer 53
(157, 53, 'ITM053', 72, '2024-11-30', 'Shipped', 57),
(158, 53, 'ITM014', 121, '2024-12-03', 'Delivered', 58),
(159, 53, 'ITM032', 137, '2024-12-07', 'Processing', 59),

-- Customer 54
(160, 54, 'ITM054', 69, '2024-12-14', 'Shipped', 60),
(161, 54, 'ITM011', 88, '2024-12-17', 'Delivered', 61),
(162, 54, 'ITM033', 82, '2024-12-21', 'Processing', 62),

-- Customer 55
(163, 55, 'ITM055', 95, '2024-12-28', 'Shipped', 63),
(164, 55, 'ITM016', 81, '2024-12-31', 'Delivered', 64),
(165, 55, 'ITM034', 68, '2025-01-04', 'Processing', 65),

-- Customer 56
(166, 56, 'ITM056', 150, '2025-01-11', 'Shipped', 66),
(167, 56, 'ITM014', 91, '2025-01-14', 'Delivered', 67),
(168, 56, 'ITM035', 55, '2025-01-18', 'Processing', 68),

-- Customer 57
(169, 57, 'ITM017', 57, '2025-01-25', 'Shipped', 69),
(170, 57, 'ITM035', 68, '2025-01-28', 'Delivered', 70),
(171, 57, 'ITM036', 122, '2025-02-01', 'Processing', 71),

-- Customer 58
(172, 58, 'ITM058', 52, '2025-02-08', 'Shipped', 72),
(173, 58, 'ITM046', 146, '2025-02-11', 'Delivered', 73),
(174, 58, 'ITM037', 124, '2025-02-15', 'Processing', 74),

-- Customer 59
(175, 59, 'ITM059', 129, '2025-02-22', 'Shipped', 75),
(176, 59, 'ITM027', 126, '2025-02-25', 'Delivered', 76),
(177, 59, 'ITM038', 89, '2025-03-01', 'Processing', 77),

-- Customer 60
(178, 60, 'ITM060', 119, '2025-03-08', 'Shipped', 78),
(179, 60, 'ITM048', 78, '2025-03-11', 'Delivered', 79),
(180, 60, 'ITM039', 84, '2025-03-15', 'Processing', 80),

-- Customer 61
(181, 61, 'ITM061', 136, '2025-03-22', 'Shipped', 81),
(182, 61, 'ITM019', 75, '2025-03-25', 'Delivered', 82),
(183, 61, 'ITM040', 120, '2025-03-29', 'Processing', 83),

-- Customer 62
(184, 62, 'ITM062', 124, '2025-04-05', 'Shipped', 84),
(185, 62, 'ITM020', 108, '2025-04-08', 'Delivered', 85),
(186, 62, 'ITM041', 120, '2025-04-12', 'Processing', 86),

-- Customer 63
(187, 63, 'ITM063', 125, '2025-04-19', 'Shipped', 87),
(188, 63, 'ITM021', 115, '2025-04-22', 'Delivered', 88),
(189, 63, 'ITM042', 150, '2025-04-26', 'Processing', 89),

-- Customer 64
(190, 64, 'ITM064', 51, '2025-05-03', 'Shipped', 90),
(191, 64, 'ITM023', 60, '2025-05-06', 'Delivered', 91),
(192, 64, 'ITM043', 96, '2025-05-10', 'Processing', 92),

-- Customer 65
(193, 65, 'ITM065', 149, '2025-05-17', 'Shipped', 93),
(194, 65, 'ITM024', 105, '2025-05-20', 'Delivered', 94),
(195, 65, 'ITM044', 130, '2025-05-24', 'Processing', 95),

-- Customer 66
(196, 66, 'ITM066', 82, '2025-05-31', 'Shipped', 96),
(197, 66, 'ITM001', 72, '2025-06-03', 'Delivered', 97),
(198, 66, 'ITM002', 66, '2025-06-07', 'Processing', 98),

-- Customer 67
(199, 67, 'ITM003', 63, '2025-06-14', 'Shipped', 99),
(200, 67, 'ITM004', 68, '2025-06-17', 'Delivered', 100),
(201, 67, 'ITM005', 103, '2025-06-21', 'Processing', 1),

-- Customer 68
(202, 68, 'ITM006', 60, '2025-06-28', 'Shipped', 2),
(203, 68, 'ITM007', 144, '2025-07-01', 'Delivered', 3),
(204, 68, 'ITM008', 84, '2025-07-05', 'Processing', 4),

-- Customer 69
(205, 69, 'ITM009', 143, '2025-07-12', 'Shipped', 5),
(206, 69, 'ITM010', 110, '2025-07-15', 'Delivered', 6),
(207, 69, 'ITM011', 71, '2025-07-19', 'Processing', 7),

-- Customer 70
(208, 70, 'ITM012', 75, '2025-07-26', 'Shipped', 8),
(209, 70, 'ITM013', 115, '2025-07-29', 'Delivered', 9),
(210, 70, 'ITM014', 97, '2025-08-02', 'Processing', 10),

-- Customer 71
(211, 71, 'ITM015', 90, '2025-08-09', 'Shipped', 11),
(212, 71, 'ITM016', 110, '2025-08-12', 'Delivered', 12),
(213, 71, 'ITM017', 130, '2025-08-16', 'Processing', 13),

-- Customer 72
(214, 72, 'ITM018', 69, '2025-08-23', 'Shipped', 14),
(215, 72, 'ITM019', 105, '2025-08-26', 'Delivered', 15),
(216, 72, 'ITM020', 68, '2025-08-30', 'Processing', 16),

-- Customer 73
(217, 73, 'ITM021', 75, '2025-09-06', 'Shipped', 17),
(218, 73, 'ITM022', 121, '2025-09-09', 'Delivered', 18),
(219, 73, 'ITM023', 129, '2025-09-13', 'Processing', 19),

-- Customer 74
(220, 74, 'ITM024', 131, '2025-09-20', 'Shipped', 20),
(221, 74, 'ITM025', 119, '2025-09-23', 'Delivered', 21),
(222, 74, 'ITM026', 51, '2025-09-27', 'Processing', 22),

-- Customer 75
(223, 75, 'ITM027', 51, '2025-10-04', 'Shipped', 23),
(224, 75, 'ITM028', 53, '2025-10-07', 'Delivered', 24),
(225, 75, 'ITM029', 60, '2025-10-11', 'Processing', 25),

-- Customer 76
(226, 76, 'ITM030', 93, '2025-10-18', 'Shipped', 26),
(227, 76, 'ITM031', 134, '2025-10-21', 'Delivered', 27),
(228, 76, 'ITM032', 142, '2025-10-25', 'Processing', 28),

-- Customer 77
(229, 77, 'ITM033', 54, '2025-11-01', 'Shipped', 29),
(230, 77, 'ITM034', 100, '2025-11-04', 'Delivered', 30),
(231, 77, 'ITM035', 86, '2025-11-08', 'Processing', 31),

-- Customer 78
(232, 78, 'ITM036', 81, '2025-11-15', 'Shipped', 32),
(233, 78, 'ITM037', 95, '2025-11-18', 'Delivered', 33),
(234, 78, 'ITM038', 81, '2025-11-22', 'Processing', 34),

-- Customer 79
(235, 79, 'ITM039', 74, '2025-11-29', 'Shipped', 35),
(236, 79, 'ITM040', 74, '2025-12-02', 'Delivered', 36),
(237, 79, 'ITM041', 99, '2025-12-06', 'Processing', 37),

-- Customer 80
(238, 80, 'ITM042', 123, '2025-12-13', 'Shipped', 38),
(239, 80, 'ITM043', 65, '2025-12-16', 'Delivered', 39),
(240, 80, 'ITM044', 109, '2025-12-20', 'Processing', 40),

-- Customer 81
(241, 81, 'ITM045', 98, '2026-01-02', 'Shipped', 41),
(242, 81, 'ITM046', 116, '2026-01-05', 'Delivered', 42),
(243, 81, 'ITM047', 135, '2026-01-09', 'Processing', 43),

-- Customer 82
(244, 82, 'ITM048', 74, '2026-01-16', 'Shipped', 44),
(245, 82, 'ITM049', 119, '2026-01-19', 'Delivered', 45),
(246, 82, 'ITM050', 122, '2026-01-23', 'Processing', 46),

-- Customer 83
(247, 83, 'ITM051', 100, '2026-01-30', 'Shipped', 47),
(248, 83, 'ITM052', 85, '2026-02-02', 'Delivered', 48),
(249, 83, 'ITM053', 76, '2026-02-06', 'Processing', 49),

-- Customer 84
(250, 84, 'ITM054', 74, '2026-02-13', 'Shipped', 50),
(251, 84, 'ITM055', 92, '2026-02-16', 'Delivered', 51),
(252, 84, 'ITM056', 89, '2026-02-20', 'Processing', 52),

-- Customer 85
(253, 85, 'ITM057', 118, '2026-02-27', 'Shipped', 53),
(254, 85, 'ITM058', 72, '2026-03-02', 'Delivered', 54),
(255, 85, 'ITM059', 60, '2026-03-06', 'Processing', 55),

-- Customer 86
(256, 86, 'ITM060', 132, '2026-03-13', 'Shipped', 56),
(257, 86, 'ITM061', 129, '2026-03-16', 'Delivered', 57),
(258, 86, 'ITM062', 97, '2026-03-20', 'Processing', 58),

-- Customer 87
(259, 87, 'ITM063', 51, '2026-03-27', 'Shipped', 59),
(260, 87, 'ITM064', 115, '2026-03-30', 'Delivered', 60),
(261, 87, 'ITM065', 69, '2026-04-03', 'Processing', 61),

-- Customer 88
(262, 88, 'ITM066', 52, '2026-04-10', 'Shipped', 62),
(263, 88, 'ITM001', 106, '2026-04-13', 'Delivered', 63),
(264, 88, 'ITM002', 120, '2026-04-17', 'Processing', 64),

-- Customer 89
(265, 89, 'ITM003', 132, '2026-04-24', 'Shipped', 65),
(266, 89, 'ITM004', 50, '2026-04-27', 'Delivered', 66),
(267, 89, 'ITM005', 107, '2026-05-01', 'Processing', 67),

-- Customer 90
(268, 90, 'ITM006', 135, '2026-05-08', 'Shipped', 68),
(269, 90, 'ITM007', 100, '2026-05-11', 'Delivered', 69),
(270, 90, 'ITM008', 146, '2026-05-15', 'Processing', 70),

-- Customer 91
(271, 91, 'ITM009', 76, '2026-05-22', 'Shipped', 71),
(272, 91, 'ITM010', 98, '2026-05-25', 'Delivered', 72),
(273, 91, 'ITM011', 110, '2026-05-29', 'Processing', 73),

-- Customer 92
(274, 92, 'ITM012', 107, '2026-06-05', 'Shipped', 74),
(275, 92, 'ITM013', 54, '2026-06-08', 'Delivered', 75),
(276, 92, 'ITM014', 101, '2026-06-12', 'Processing', 76),

-- Customer 93
(277, 93, 'ITM015', 92, '2026-06-19', 'Shipped', 77),
(278, 93, 'ITM016', 105, '2026-06-22', 'Delivered', 78),
(279, 93, 'ITM017', 101, '2026-06-26', 'Processing', 79),

-- Customer 94
(280, 94, 'ITM018', 140, '2026-07-03', 'Shipped', 80),
(281, 94, 'ITM019', 146, '2026-07-06', 'Delivered', 81),
(282, 94, 'ITM020', 60, '2026-07-10', 'Processing', 82),

-- Customer 95
(283, 95, 'ITM021', 114, '2026-07-17', 'Shipped', 83),
(284, 95, 'ITM022', 137, '2026-07-20', 'Delivered', 84),
(285, 95, 'ITM023', 92, '2026-07-24', 'Processing', 85),

-- Customer 96
(286, 96, 'ITM024', 101, '2026-07-31', 'Shipped', 86),
(287, 96, 'ITM025', 79, '2026-08-03', 'Delivered', 87),
(288, 96, 'ITM026', 142, '2026-08-07', 'Processing', 88),

-- Customer 97
(289, 97, 'ITM027', 120, '2026-08-14', 'Shipped', 89),
(290, 97, 'ITM028', 126, '2026-08-17', 'Delivered', 90),
(291, 97, 'ITM029', 117, '2026-08-21', 'Processing', 91),

-- Customer 98
(292, 98, 'ITM030', 58, '2026-08-28', 'Shipped', 92),
(293, 98, 'ITM031', 91, '2026-08-31', 'Delivered', 93),
(294, 98, 'ITM032', 131, '2026-09-04', 'Processing', 94),

-- Customer 99
(295, 99, 'ITM033', 130, '2026-09-11', 'Shipped', 95),
(296, 99, 'ITM034', 108, '2026-09-14', 'Delivered', 96),
(297, 99, 'ITM035', 100, '2026-09-18', 'Processing', 97),

-- Customer 100
(298, 100, 'ITM036', 125, '2026-09-25', 'Shipped', 98),
(299, 100, 'ITM037', 76, '2026-09-28', 'Delivered', 99),
(300, 100, 'ITM038', 57, '2026-10-02', 'Processing', 100);


-- INVENTORY RECORDS;

-- Espresso
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING001', 'Batch1', 500, 50),('ING002', 'Batch1', 1000, 1000);

-- Double Espresso
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING001', 'Batch1', 1000, 100),('ING002', 'Batch1', 1000, 1000);

-- Red Eye Coffee
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING003', 'Batch1', 120, 30),('ING001', 'Batch1', 500, 50),('ING002', 'Batch1', 1000, 1000);

-- Black Eye Coffee
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING003', 'Batch1', 150, 40),('ING001', 'Batch1', 500, 50),('ING002', 'Batch1', 1000, 1000);

-- Americano
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING001', 'Batch1', 250, 50),('ING002', 'Batch1', 1000, 1000);

-- Long Black
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING001', 'Batch1', 300, 60),('ING002', 'Batch1', 1000, 1000);

-- Macchiato
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING006', 'Batch1', 70, 20),('ING001', 'Batch1', 500, 50),('ING002', 'Batch1', 1000, 1000);

-- Long Macchiato
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING006', 'Batch1', 70, 20),('ING001', 'Batch1', 500, 50),('ING002', 'Batch1', 1000, 1000);

-- Cortado
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING004', 'Batch1', 90, 30),('ING001', 'Batch1', 500, 50),('ING002', 'Batch1', 1000, 1000);

-- Breve
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING005', 'Batch1', 110, 30),('ING001', 'Batch1', 500, 50),('ING002', 'Batch1', 1000, 1000);

-- Cappuccino
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING006', 'Batch1', 70, 20),('ING004', 'Batch1', 90, 30),('ING001', 'Batch1', 500, 50),('ING002', 'Batch1', 1000, 1000);

-- Flat White
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING004', 'Batch1', 90, 30),('ING001', 'Batch1', 500, 50),('ING002', 'Batch1', 1000, 1000);

-- Cafe Latte
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING004', 'Batch1', 90, 30),('ING001', 'Batch1', 500, 50),('ING002', 'Batch1', 1000, 1000);

-- Mocha
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING043', 'Batch1', 90, 30),('ING007', 'Batch1', 250, 250),('ING004', 'Batch1', 90, 30),('ING001', 'Batch1', 500, 50),('ING002', 'Batch1', 1000, 1000);

-- Vienna
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING041', 'Batch1', 120, 30),('ING008', 'Batch2', 120, 160),('ING001', 'Batch1', 500, 50),('ING002', 'Batch1', 1000, 1000);

-- Affogato
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING009', 'Batch1', 50, 10),('ING001', 'Batch1', 500, 50),('ING002', 'Batch1', 1000, 1000);

-- Cafe au Lait
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING004', 'Batch1', 90, 30),('ING003', 'Batch1', 120, 30);

-- Iced Coffee
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING012', 'Batch1', 600, 150),('ING003', 'Batch1', 120, 30);

-- Margarita
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING014', 'Batch1', 375, 125),('ING015', 'Batch3', 250, 320),('ING016', 'Batch1', 500, 120);

-- Martini
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING018', 'Batch1', 450, 150),('ING019', 'Batch1', 500, 100);

-- Mojito
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING021', 'Batch1', 550, 110),('ING022', 'Batch1', 50, 150),('ING015', 'Batch3', 250, 320);

-- Caipirinha
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING025', 'Batch1', 500, 100),('ING015', 'Batch3', 250, 320),('ING041', 'Batch1', 120, 30);

-- Pina Colada
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING027', 'Batch1', 400, 80),('ING026', 'Batch3', 200, 200),('ING021', 'Batch1', 550, 110);

-- Sangria
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING028', 'Batch1', 600, 150),('ING029', 'Batch2', 204, 270),('ING031', 'Batch1', 500, 250),('ING024', 'Batch1', 1000, 1000);

-- Irish Coffee
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING032', 'Batch1', 450, 150),('ING011', 'Batch1', 180, 200),('ING041', 'Batch1', 120, 30);

-- Mimosa
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING034', 'Batch1', 375, 125),('ING030', 'Batch1', 500, 180);

-- Sake
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING035', 'Batch1', 800, 200);

-- Chai
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES ('ING062', 'Batch1', 250, 50),('ING036', 'Batch1', 500, 150);


-- Tiramisu
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING038', 'Batch2', 200, 250),
('ING039', 'Batch2', 160, 200),
('ING040', 'Batch2', 240, 300),
('ING041', 'Batch2', 400, 500),
('ING042', 'Batch2', 160, 200),
('ING043', 'Batch2', 120, 150),
('ING025', 'Batch2', 600, 750);

-- Apple Pie
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING041', 'Batch2', 400, 500),
('ING044', 'Batch2', 400, 500),
('ING045', 'Batch2', 40, 50),
('ING046', 'Batch2', 160, 200),
('ING047', 'Batch2', 240, 300),
('ING048', 'Batch2', 320, 400);

-- Macarons
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING049', 'Batch2', 160, 200),
('ING050', 'Batch2', 200, 250),
('ING051', 'Batch2', 240, 300),
('ING052', 'Batch2', 80, 100);

-- Gulab Jamun
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING056', 'Batch2', 320, 400),
('ING058', 'Batch2', 120, 150),
('ING059', 'Batch2', 40, 50),
('ING060', 'Batch2', 24, 30),
('ING062', 'Batch2', 400, 500),
('ING083', 'Batch2', 400, 500),
('ING086', 'Batch2', 320, 400);

-- Mochi
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING041', 'Batch2', 400, 550),
('ING062', 'Batch2', 500, 650),
('ING061', 'Batch2', 240, 320),
('ING066', 'Batch2', 80, 120);

-- Churros
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING041', 'Batch2', 400, 550),
('ING062', 'Batch2', 500, 650),
('ING047', 'Batch2', 288, 360),
('ING045', 'Batch2', 56, 70),
('ING083', 'Batch2', 600, 800);

-- Pavlova
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING041', 'Batch2', 400, 550),
('ING065', 'Batch2', 44, 60),
('ING040', 'Batch2', 240, 330),
('ING066', 'Batch2', 96, 150),
('ING008', 'Batch2', 120, 160),
('ING029', 'Batch2', 204, 270),
('ING067', 'Batch2', 48, 80);

-- Creme Brulee
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING041', 'Batch2', 400, 550),
('ING065', 'Batch2', 44, 60),
('ING040', 'Batch2', 240, 330),
('ING051', 'Batch2', 240, 330),
('ING033', 'Batch2', 176, 240);

-- Cheesecake
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING041', 'Batch2', 400, 550),
('ING065', 'Batch2', 44, 60),
('ING040', 'Batch2', 240, 330),
('ING064', 'Batch2', 240, 300),
('ING070', 'Batch2', 224, 280),
('ING071', 'Batch2', 240, 330),
('ING046', 'Batch2', 160, 220);

-- Gelato
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING041', 'Batch2', 400, 550),
('ING065', 'Batch2', 44, 60),
('ING064', 'Batch2', 240, 300),
('ING062', 'Batch2', 400, 500),
('ING004', 'Batch2', 160, 200);

-- Tres Leches Cake
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING004', 'Batch2', 160, 200),
('ING064', 'Batch2', 240, 300),
('ING041', 'Batch2', 400, 550),
('ING040', 'Batch2', 240, 300),
('ING046', 'Batch2', 160, 200),
('ING086', 'Batch2', 320, 400),
('ING008', 'Batch2', 120, 150),
('ING063', 'Batch2', 320, 400);

-- Sacher Torte
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING041', 'Batch2', 400, 550),
('ING040', 'Batch2', 240, 300),
('ING046', 'Batch2', 160, 200),
('ING086', 'Batch2', 320, 400),
('ING072', 'Batch2', 160, 200),
('ING073', 'Batch2', 120, 150),
('ING057', 'Batch2', 40, 50);

-- Eclairs
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING040', 'Batch2', 240, 300),
('ING046', 'Batch2', 160, 200),
('ING086', 'Batch2', 320, 400),
('ING064', 'Batch2', 240, 300),
('ING072', 'Batch2', 160, 200),
('ING065', 'Batch2', 44, 60),
('ING051', 'Batch2', 240, 300),
('ING062', 'Batch2', 400, 500);

-- Knafeh
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING053', 'Batch2', 280, 350),
('ING054', 'Batch2', 240, 300),
('ING062', 'Batch2', 400, 500),
('ING041', 'Batch2', 400, 550),
('ING046', 'Batch2', 160, 200),
('ING059', 'Batch2', 40, 50),
('ING060', 'Batch2', 24, 30),
('ING077', 'Batch2', 240, 300),
('ING078', 'Batch2', 160, 200);

-- Flan
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING041', 'Batch2', 400, 550),
('ING065', 'Batch2', 44, 60),
('ING040', 'Batch2', 240, 330),
('ING062', 'Batch2', 400, 500),
('ING008', 'Batch2', 120, 160),
('ING063', 'Batch2', 320, 400),
('ING004', 'Batch2', 160, 200);

-- Banoffee Pie
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING071', 'Batch2', 240, 300),
('ING046', 'Batch2', 160, 200),
('ING063', 'Batch2', 320, 400),
('ING064', 'Batch2', 240, 300),
('ING072', 'Batch2', 160, 200);

-- Baklava
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING041', 'Batch2', 400, 550),
('ING044', 'Batch2', 320, 400),
('ING045', 'Batch2', 32, 40),
('ING046', 'Batch2', 160, 200),
('ING047', 'Batch2', 240, 300),
('ING083', 'Batch2', 240, 300);

-- Mango Sticky Rice
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING041', 'Batch2', 400, 550),
('ING048', 'Batch2', 320, 400),
('ING049', 'Batch2', 160, 200),
('ING062', 'Batch2', 400, 500),
('ING058', 'Batch2', 160, 200),
('ING063', 'Batch2', 320, 400),
('ING079', 'Batch3', 300, 300),
('ING080', 'Batch2', 300, 300);

-- French Fries
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING083', 'Batch3', 180, 240),
('ING082', 'Batch3', 180, 240),
('ING084', 'Batch3', 90, 120),
('ING017', 'Batch3', 100, 180);

-- Onion Rings
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING083', 'Batch3', 180, 240),
('ING084', 'Batch3', 90, 120),
('ING085', 'Batch3', 135, 180),
('ING086', 'Batch3', 180, 240),
('ING087', 'Batch3', 135, 180),
('ING088', 'Batch3', 25, 35),
('ING017', 'Batch3', 100, 180);

-- Guacamole
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING089', 'Batch3', 90, 120),
('ING090', 'Batch3', 60, 80),
('ING091', 'Batch3', 30, 40),
('ING092', 'Batch3', 15, 20),
('ING098', 'Batch3', 15, 20),
('ING099', 'Batch3', 9, 12),
('ING084', 'Batch3', 80, 100),
('ING081', 'Batch3', 500, 500),
('ING017', 'Batch3', 100, 180);

-- Bruschetta
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING093', 'Batch3', 180, 240),
('ING094', 'Batch3', 15, 20),
('ING095', 'Batch3', 30, 40),
('ING098', 'Batch3', 15, 20),
('ING085', 'Batch3', 135, 180),
('ING090', 'Batch3', 90, 120),
('ING084', 'Batch3', 80, 100),
('ING020', 'Batch3', 20, 25),
('ING017', 'Batch3', 100, 180);

-- Hummus
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING096', 'Batch3', 144, 192),
('ING097', 'Batch3', 72, 96),
('ING098', 'Batch3', 36, 48),
('ING084', 'Batch3', 80, 100),
('ING091', 'Batch3', 30, 40),
('ING062', 'Batch3', 180, 240),
('ING020', 'Batch3', 20, 25),
('ING099', 'Batch3', 9, 12),
('ING017', 'Batch3', 100, 180);

-- Pizza
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING100', 'Batch3', 180, 240),
('ING101', 'Batch3', 108, 144),
('ING102', 'Batch3', 108, 144),
('ING103', 'Batch3', 72, 96),
('ING104', 'Batch3', 108, 144),
('ING020', 'Batch3', 20, 25),
('ING084', 'Batch3', 80, 100),
('ING017', 'Batch3', 100, 180);

-- Cheeseburger
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING104', 'Batch3', 180, 240),
('ING105', 'Batch3', 240, 320),
('ING106', 'Batch3', 120, 160),
('ING107', 'Batch3', 90, 120),
('ING108', 'Batch3', 120, 160),
('ING109', 'Batch3', 60, 80),
('ING084', 'Batch3', 80, 100),
('ING017', 'Batch3', 100, 180);

-- Spring Rolls
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING110', 'Batch3', 180, 240),
('ING111', 'Batch3', 150, 200),
('ING112', 'Batch3', 180, 240),
('ING113', 'Batch3', 30, 40),
('ING114', 'Batch3', 120, 160),
('ING107', 'Batch3', 90, 120),
('ING123', 'Batch3', 30, 40),
('ING084', 'Batch3', 80, 100),
('ING017', 'Batch3', 100, 180);

-- Pakoras
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING115', 'Batch3', 150, 200),
('ING116', 'Batch3', 25, 35),
('ING113', 'Batch3', 30, 40),
('ING084', 'Batch3', 80, 100),
('ING121', 'Batch3', 250, 320),
('ING083', 'Batch3', 250, 320),
('ING062', 'Batch3', 250, 320),
('ING088', 'Batch3', 25, 35),
('ING017', 'Batch3', 100, 180);

-- Gyoza
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING117', 'Batch3', 150, 200),
('ING118', 'Batch3', 125, 160),
('ING119', 'Batch3', 75, 100),
('ING121', 'Batch3', 250, 320),
('ING084', 'Batch3', 80, 100),
('ING098', 'Batch3', 40, 50),
('ING104', 'Batch3', 180, 240),
('ING017', 'Batch3', 100, 180);

-- Pasta
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING121', 'Batch3', 250, 320),
('ING084', 'Batch3', 80, 100),
('ING098', 'Batch3', 40, 50),
('ING113', 'Batch3', 30, 40),
('ING120', 'Batch3', 200, 250),
('ING077', 'Batch3', 150, 200),
('ING017', 'Batch3', 100, 180);

-- Samosas
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING083', 'Batch3', 250, 320),
('ING082', 'Batch3', 250, 320),
('ING084', 'Batch3', 80, 100),
('ING085', 'Batch3', 150, 200),
('ING086', 'Batch3', 200, 250),
('ING099', 'Batch3', 30, 40),
('ING098', 'Batch3', 40, 50),
('ING015', 'Batch3', 250, 320),
('ING088', 'Batch3', 25, 35),
('ING017', 'Batch3', 100, 180);

-- Tabbouleh
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING003', 'Batch3', 90, 120),
('ING001', 'Batch3', 250, 320),
('ING085', 'Batch3', 150, 200),
('ING090', 'Batch3', 100, 130),
('ING015', 'Batch3', 250, 320),
('ING084', 'Batch3', 80, 100),
('ING017', 'Batch3', 100, 180);

-- Potato Croquettes
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING083', 'Batch3', 250, 320),
('ING082', 'Batch3', 250, 320),
('ING084', 'Batch3', 80, 100),
('ING086', 'Batch3', 200, 250),
('ING040', 'Batch3', 150, 200),
('ING087', 'Batch3', 150, 200),
('ING077', 'Batch3', 150, 200),
('ING017', 'Batch3', 100, 180);

-- Poutine
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING082', 'Batch3', 250, 320),
('ING077', 'Batch3', 150, 200),
('ING083', 'Batch3', 250, 320),
('ING084', 'Batch3', 80, 100),
('ING017', 'Batch3', 100, 180);

-- Tostones
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING125', 'Batch3', 250, 320),
('ING083', 'Batch3', 250, 320),
('ING084', 'Batch3', 80, 100),
('ING017', 'Batch3', 100, 180);

-- Korean Kimchi
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING118', 'Batch3', 125, 160),
('ING119', 'Batch3', 75, 100),
('ING041', 'Batch3', 250, 320),
('ING098', 'Batch3', 40, 50),
('ING062', 'Batch3', 250, 320),
('ING116', 'Batch3', 25, 35),
('ING122', 'Batch3', 50, 65),
('ING017', 'Batch3', 100, 180);

-- Sautéed Vegetables
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING121', 'Batch3', 250, 320),
('ING084', 'Batch3', 80, 100),
('ING091', 'Batch3', 50, 65),
('ING092', 'Batch3', 25, 35),
('ING098', 'Batch3', 40, 50),
('ING099', 'Batch3', 30, 40),
('ING083', 'Batch3', 250, 320),
('ING017', 'Batch3', 100, 180);

-- Falafel
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING084', 'Batch3', 80, 100),
('ING091', 'Batch3', 50, 65),
('ING092', 'Batch3', 25, 35),
('ING098', 'Batch3', 40, 50),
('ING099', 'Batch3', 30, 40),
('ING083', 'Batch3', 250, 320),
('ING096', 'Batch3', 200, 250),
('ING037', 'Batch3', 100, 200),
('ING017', 'Batch3', 100, 180);

-- Tempura
INSERT INTO `Inventory` (`item_id`, `batch_number`, `quantity`, `batch_size`)
VALUES 
('ING121', 'Batch3', 250, 320),
('ING084', 'Batch3', 80, 100),
('ING091', 'Batch3', 50, 65),
('ING092', 'Batch3', 25, 35),
('ING098', 'Batch3', 40, 50),
('ING099', 'Batch3', 30, 40),
('ING083', 'Batch3', 250, 320),
('ING112', 'Batch3', 150, 200),
('ING017', 'Batch3', 100, 180);

-- X-- -- --XXX -- -- --XXX -- -- --XXX -- -- --XXX -- -- --XXX -- -- --XXX-- -- --X --


-- Creating View
CREATE VIEW Stock AS
SELECT
S1.item_name,
S1.ing_id,
S1.ing_name,
S1.order_quantity,
S1.recipe_quantity,
S1.order_quantity*S1.recipe_quantity AS ordered_weight,
S1.ing_price/S1.ing_weight AS unit_cost,
(S1.order_quantity*S1.recipe_quantity)*(S1.ing_price/S1.ing_weight) AS ingredient_cost
FROM (SELECT
o.item_id,
i.sku,
i.item_name,
r.ing_id,
ing.ing_name,
r.quantity AS recipe_quantity,
sum(o.quantity) AS order_quantity,
ing.ing_weight,
ing.ing_price
FROM orders o
LEFT JOIN item i ON o.item_id = i.item_id
LEFT JOIN recipe r ON i.item_name = r.recipe_id
LEFT JOIN ingredients ing ON ing.ing_id = r.ing_id
GROUP BY o.item_id, 
i.sku, 
i.item_name,
r.ing_id,
r.quantity,
ing.ing_name,
ing.ing_weight,
ing.ing_price) S1;

-- -- -- -- xxx -- -- -- -- -- xxx -- -- -- -- -- xxx -- -- -- -- xxx -- -- -- --xxx -- -- -- --


-- Queries For Order Activity Dashboard 
USE MIRAGI_CAFE_DB;
SELECT
O.order_id,
i.item_price,
o.quantity,
i.item_name,
o.created_at,
a.delivery_add1,
a.delivery_add2,
a.delivery_city,
a.delivery_zipcode,
o.delivery
FROM orders O 
LEFT JOIN item i ON o.item_id = i.item_id
LEFT JOIN address a ON o.add_id = a.add_id;

SELECT ic.item_cat, SUM(i.item_price * O.quantity) AS total_sales_amount
FROM Orders O
JOIN Item i ON O.item_id = i.item_id
JOIN Item_Category ic ON i.category_id = ic.category_id
GROUP BY ic.item_cat;

select * from recipe;

-- Queries for Inventory Management Dashboard

SELECT
    S1.item_name,
    S1.ing_id,
    S1.ing_name,
    S1.order_quantity,
    S1.recipe_quantity,
    S1.order_quantity * S1.recipe_quantity AS ordered_weight,  -- Total weight ordered
    S1.ing_price / S1.ing_weight AS unit_cost,
    (S1.order_quantity * S1.recipe_quantity) * (S1.ing_price / S1.ing_weight) AS ingredient_cost -- Total cost of ingredients for ordered items
FROM (
    SELECT
        o.item_id,
        i.sku,
        i.item_name,
        r.ing_id,
        ing.ing_name,
        r.quantity AS recipe_quantity,
        SUM(o.quantity) AS order_quantity,
        ing.ing_weight,
        ing.ing_price
    FROM
        orders o
    LEFT JOIN item i ON o.item_id = i.item_id
    LEFT JOIN recipe r ON i.item_name = r.recipe_id
    LEFT JOIN ingredients ing ON ing.ing_id = r.ing_id
    GROUP BY
        o.item_id,
        i.sku,
        i.item_name,
        r.ing_id,
        r.quantity,
        ing.ing_name,
        ing.ing_weight,
        ing.ing_price
) S1;


SELECT 
	S2.ing_id,
    S2.ing_name,
    S2.ordered_weight,
    ing.ing_weight * inv.quantity AS total_inv_weight, -- Total weight in stock = ingredient quantity * ingredient weight
    (ing.ing_weight * inv.quantity) - S2.ordered_weight AS remaining_weight  -- Inventory remaining per ingredient
FROM (
    SELECT
        ing_id,
        ing_name,
        SUM(ordered_weight) AS ordered_weight
    FROM Stock
    GROUP BY ing_name, ing_id
) S2
LEFT JOIN inventory inv ON inv.item_id = S2.ing_id
LEFT JOIN ingredients ing ON ing.ing_id = S2.ing_id;


SELECT 
    rot.date,
    stff.first_name,
    stff.last_name,
    stff.hourly_rate,
    sh.start_time,
    sh.end_time,
    ((HOUR(TIMEDIFF(sh.end_time, sh.start_time)) * 60) + (MINUTE(TIMEDIFF(sh.end_time, sh.start_time)))) / 60 AS hours_in_shift,
    ((HOUR(TIMEDIFF(sh.end_time, sh.start_time)) * 60) + (MINUTE(TIMEDIFF(sh.end_time, sh.start_time)))) / 60 * stff.hourly_rate AS staff_cost
FROM 
    rotation rot
LEFT JOIN 
    staff stff ON rot.staff_id = stff.staff_id
LEFT JOIN 
    shift sh ON rot.shift_id = sh.shift_id;

-- -- -- -- xxx -- -- -- -- xxx -- -- -- -- xxx -- -- -- -- xxx -- -- -- -- xxx -- -- -- --