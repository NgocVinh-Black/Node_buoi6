/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` float DEFAULT NULL,
  `desccc` varchar(255) NOT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `arr_sub_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`food_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) NOT NULL,
  `res_image` varchar(255) NOT NULL,
  `descc` varchar(255) NOT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) NOT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass_word` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desccc`, `type_id`) VALUES
(1, 'Pizza Margherita', 'pizza_margherita.jpg', 10.99, 'Classic pizza topped with tomatoes, mozzarella, and basil.', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desccc`, `type_id`) VALUES
(2, 'California Roll', 'california_roll.jpg', 12.5, 'Sushi roll filled with crab, avocado, and cucumber.', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desccc`, `type_id`) VALUES
(3, 'Cheeseburger', 'cheeseburger.jpg', 8.99, 'Beef patty topped with cheese, lettuce, tomato, onion, and pickles.', 3);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desccc`, `type_id`) VALUES
(4, 'Spaghetti Carbonara', 'spaghetti_carbonara.jpg', 14.75, 'Pasta dish made with eggs, cheese, bacon, and black pepper.', 4),
(5, 'Caesar Salad', 'caesar_salad.jpg', 9.25, 'Salad made with romaine lettuce, croutons, parmesan cheese, and Caesar dressing.', 5),
(6, 'Club Sandwich', 'club_sandwich.jpg', 11.99, 'Triple-decker sandwich with turkey, bacon, lettuce, tomato, and mayo.', 6),
(7, 'Beef Taco', 'beef_taco.jpg', 3.5, 'Tortilla filled with seasoned ground beef, lettuce, cheese, and salsa.', 7),
(8, 'Ribeye Steak', 'ribeye_steak.jpg', 24.99, 'Juicy steak cut from the rib section of the beef.', 8),
(9, 'Grilled Salmon', 'grilled_salmon.jpg', 18.5, 'Fresh salmon fillet grilled to perfection.', 9),
(10, 'Tomato Soup', 'tomato_soup.jpg', 6.75, 'Classic soup made with ripe tomatoes, onions, garlic, and herbs.', 10),
(11, 'Chocolate Cake', 'chocolate_cake.jpg', 7.99, 'Decadent chocolate cake with rich frosting.', 11),
(12, 'Pad Thai', 'pad_thai.jpg', 11.25, 'Stir-fried rice noodles with shrimp, tofu, bean sprouts, and peanuts.', 12),
(13, 'Fried Chicken', 'fried_chicken.jpg', 9.99, 'Crispy fried chicken served with coleslaw and mashed potatoes.', 13),
(14, 'Vegetable Stir Fry', 'vegetable_stir_fry.jpg', 8.5, 'Assorted vegetables stir-fried in a savory sauce.', 14),
(15, 'BBQ Ribs', 'bbq_ribs.jpg', 17.75, 'Tender pork ribs slathered in barbecue sauce.', 15),
(16, 'Caprese Salad', 'caprese_salad.jpg', 10.25, 'Salad made with tomatoes, fresh mozzarella, basil, and balsamic glaze.', 5),
(17, 'Mushroom Risotto', 'mushroom_risotto.jpg', 13.5, 'Creamy Italian rice dish cooked with mushrooms and parmesan cheese.', 4),
(18, 'Shrimp Scampi', 'shrimp_scampi.jpg', 16.99, 'Sauteed shrimp cooked with garlic, lemon juice, and white wine.', 9),
(19, 'French Onion Soup', 'french_onion_soup.jpg', 8.75, 'Rich soup made with caramelized onions, beef broth, and topped with melted cheese.', 10),
(20, 'Tiramisu', 'tiramisu.jpg', 9.99, 'Classic Italian dessert made with layers of coffee-soaked ladyfingers and mascarpone cheese.', 11),
(21, 'Pho', 'pho.jpg', 10.5, 'Vietnamese noodle soup with beef broth, rice noodles, herbs, and meat.', 12),
(22, 'Grilled Cheese Sandwich', 'grilled_cheese_sandwich.jpg', 6.99, 'Sandwich with melted cheese between slices of toasted bread.', 6),
(23, 'Vegetable Curry', 'vegetable_curry.jpg', 12.25, 'Spicy curry dish made with assorted vegetables and aromatic spices.', 14),
(24, 'Steak Frites', 'steak_frites.jpg', 19.75, 'Grilled steak served with crispy French fries and salad.', 8);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Pizza');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Sushi');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Burger');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Pasta'),
(5, 'Salad'),
(6, 'Sandwich'),
(7, 'Taco'),
(8, 'Steak'),
(9, 'Seafood'),
(10, 'Soup'),
(11, 'Dessert'),
(12, 'Noodle'),
(13, 'Chicken'),
(14, 'Vegetarian'),
(15, 'BBQ');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2024-03-01 08:30:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 11, '2024-03-01 12:30:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 2, '2024-03-02 10:45:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 12, '2024-03-02 14:45:00'),
(3, 3, '2024-03-03 12:15:00'),
(3, 13, '2024-03-03 16:55:00'),
(4, 4, '2024-03-04 14:20:00'),
(4, 14, '2024-03-04 18:20:00'),
(5, 5, '2024-03-05 16:50:00'),
(5, 15, '2024-03-05 20:30:00'),
(6, 6, '2024-03-06 18:25:00'),
(6, 16, '2024-03-06 22:45:00'),
(7, 7, '2024-03-07 20:30:00'),
(7, 17, '2024-03-07 11:05:00'),
(8, 8, '2024-03-08 22:40:00'),
(8, 18, '2024-03-08 13:20:00'),
(9, 9, '2024-03-09 11:10:00'),
(9, 14, '2024-03-09 15:30:00'),
(10, 10, '2024-03-10 13:35:00'),
(11, 1, '2024-03-11 19:55:00'),
(11, 11, '2024-03-11 15:55:00'),
(12, 2, '2024-03-12 21:45:00'),
(12, 12, '2024-03-12 17:45:00'),
(13, 3, '2024-03-13 23:35:00'),
(13, 13, '2024-03-13 19:20:00'),
(14, 4, '2024-03-14 10:50:00'),
(14, 14, '2024-03-14 21:05:00'),
(15, 5, '2024-03-15 12:05:00'),
(15, 15, '2024-03-15 23:15:00'),
(16, 6, '2024-03-16 14:15:00'),
(16, 16, '2024-03-16 10:25:00'),
(17, 7, '2024-03-17 16:25:00'),
(17, 17, '2024-03-17 12:40:00'),
(18, 8, '2024-03-18 18:35:00'),
(18, 18, '2024-03-18 14:30:00'),
(19, 9, '2024-03-19 16:20:00'),
(20, 2, '2024-03-20 18:10:00'),
(20, 10, '2024-03-20 22:55:00'),
(21, 1, '2024-03-21 20:50:00'),
(22, 2, '2024-03-22 22:15:00'),
(23, 3, '2024-03-23 11:25:00'),
(24, 4, '2024-03-24 13:30:00'),
(25, 5, '2024-03-25 15:40:00'),
(26, 6, '2024-03-26 17:55:00'),
(27, 7, '2024-03-27 19:45:00'),
(28, 8, '2024-03-28 21:35:00'),
(29, 9, '2024-03-29 23:05:00'),
(30, 10, '2024-03-30 10:15:00');

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 'CODE001', 'SUB001');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 2, 1, 'CODE002', 'SUB002');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 3, 3, 'CODE003', 'SUB003');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 4, 2, 'CODE004', 'SUB004'),
(5, 5, 1, 'CODE005', 'SUB005'),
(6, 6, 2, 'CODE006', 'SUB006'),
(7, 7, 3, 'CODE007', 'SUB007'),
(8, 8, 1, 'CODE008', 'SUB008'),
(9, 9, 2, 'CODE009', 'SUB009'),
(10, 1, 2, 'CODE1001', 'SUB1001'),
(10, 10, 3, 'CODE010', 'SUB010'),
(10, 11, 2, 'CODE1011', 'SUB1011'),
(10, 13, 3, 'CODE1010', 'SUB1010'),
(10, 20, 3, 'CODE1020', 'SUB1020'),
(11, 11, 2, 'CODE011', 'SUB011'),
(12, 12, 1, 'CODE012', 'SUB012'),
(13, 13, 3, 'CODE013', 'SUB013'),
(14, 14, 2, 'CODE014', 'SUB014'),
(15, 15, 1, 'CODE015', 'SUB015'),
(16, 6, 2, 'CODE016', 'SUB016'),
(17, 7, 3, 'CODE017', 'SUB017'),
(18, 8, 1, 'CODE018', 'SUB018'),
(19, 9, 2, 'CODE019', 'SUB019'),
(20, 10, 3, 'CODE020', 'SUB020'),
(21, 11, 2, 'CODE021', 'SUB021'),
(22, 12, 1, 'CODE022', 'SUB022'),
(23, 13, 3, 'CODE023', 'SUB023'),
(24, 14, 2, 'CODE024', 'SUB024'),
(25, 15, 1, 'CODE025', 'SUB025'),
(26, 6, 2, 'CODE026', 'SUB026'),
(27, 7, 3, 'CODE027', 'SUB027'),
(28, 8, 1, 'CODE028', 'SUB028'),
(29, 9, 2, 'CODE029', 'SUB029'),
(30, 3, 3, 'CODE030', 'SUB030');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 5, '2024-03-01 08:30:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 16, 3, '2024-03-16 11:20:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 1, 4, '2024-03-01 12:15:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 16, 5, '2024-03-16 17:45:00'),
(3, 2, 3, '2024-03-02 19:45:00'),
(3, 17, 4, '2024-03-17 12:10:00'),
(4, 2, 5, '2024-03-03 10:00:00'),
(4, 17, 5, '2024-03-17 18:25:00'),
(5, 3, 4, '2024-03-03 14:20:00'),
(5, 18, 5, '2024-03-18 10:30:00'),
(6, 3, 4, '2024-03-04 09:00:00'),
(6, 18, 4, '2024-03-18 16:50:00'),
(7, 4, 5, '2024-03-04 12:30:00'),
(7, 9, 3, '2024-03-19 13:40:00'),
(8, 4, 3, '2024-03-04 18:45:00'),
(8, 9, 4, '2024-03-19 19:00:00'),
(9, 2, 4, '2024-03-20 09:15:00'),
(9, 5, 5, '2024-03-05 13:10:00'),
(10, 2, 5, '2024-03-20 15:20:00'),
(10, 5, 4, '2024-03-05 20:00:00'),
(11, 6, 3, '2024-03-06 11:30:00'),
(12, 6, 4, '2024-03-06 17:15:00'),
(13, 7, 4, '2024-03-07 14:40:00'),
(14, 7, 5, '2024-03-07 19:00:00'),
(15, 8, 5, '2024-03-08 09:20:00'),
(16, 8, 4, '2024-03-08 15:45:00'),
(17, 9, 3, '2024-03-09 12:00:00'),
(18, 9, 5, '2024-03-09 18:30:00'),
(19, 10, 4, '2024-03-10 14:15:00'),
(20, 10, 3, '2024-03-10 20:45:00'),
(21, 11, 5, '2024-03-11 11:00:00'),
(22, 11, 4, '2024-03-11 16:20:00'),
(23, 12, 4, '2024-03-12 13:30:00'),
(24, 12, 5, '2024-03-12 19:40:00'),
(25, 13, 3, '2024-03-13 10:45:00'),
(26, 13, 4, '2024-03-13 17:00:00'),
(27, 14, 4, '2024-03-14 14:00:00'),
(28, 14, 5, '2024-03-14 19:15:00'),
(29, 15, 5, '2024-03-15 08:50:00'),
(30, 15, 4, '2024-03-15 14:30:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `res_image`, `descc`) VALUES
(1, 'Restaurant A', 'image1.jpg', 'This is Restaurant A, serving delicious cuisine.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `res_image`, `descc`) VALUES
(2, 'Restaurant B', 'image2.jpg', 'Welcome to Restaurant B, offering a variety of dishes.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `res_image`, `descc`) VALUES
(3, 'Restaurant C', 'image3.jpg', 'Experience the flavors of Restaurant C, known for its unique menu.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `res_image`, `descc`) VALUES
(4, 'Restaurant D', 'image4.jpg', 'Visit Restaurant D for a delightful dining experience.'),
(5, 'Restaurant E', 'image5.jpg', 'Indulge in the culinary delights of Restaurant E.'),
(6, 'Restaurant F', 'image6.jpg', 'Discover the charm of Restaurant F, where every meal is special.'),
(7, 'Restaurant G', 'image7.jpg', 'Savor the taste of excellence at Restaurant G.'),
(8, 'Restaurant H', 'image8.jpg', 'Enjoy a meal to remember at Restaurant H.'),
(9, 'Restaurant I', 'image9.jpg', 'Come to Restaurant I for a memorable dining experience.'),
(10, 'Restaurant J', 'image10.jpg', 'Treat yourself to the delicious offerings of Restaurant J.'),
(11, 'Restaurant K', 'image11.jpg', 'Experience the culinary artistry of Restaurant K.'),
(12, 'Restaurant L', 'image12.jpg', 'Join us at Restaurant L for an unforgettable meal.'),
(13, 'Restaurant M', 'image13.jpg', 'Dine in style at Restaurant M, where every dish is a masterpiece.'),
(14, 'Restaurant N', 'image14.jpg', 'Indulge your senses at Restaurant N, where flavor meets perfection.'),
(15, 'Restaurant O', 'image15.jpg', 'Discover a world of taste at Restaurant O.'),
(16, 'Restaurant P', 'image16.jpg', 'Satisfy your cravings at Restaurant P, where every bite is blissful.'),
(17, 'Restaurant Q', 'image17.jpg', 'Embark on a culinary journey at Restaurant Q.'),
(18, 'Restaurant R', 'image18.jpg', 'Experience the essence of fine dining at Restaurant R.');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Sub1', 5.99, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Sub2', 6.99, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Sub3', 7.99, 11);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Sub4', 4.99, 2),
(5, 'Sub5', 5.99, 12),
(6, 'Sub6', 6.99, 2),
(7, 'Sub7', 7.99, 3),
(8, 'Sub8', 8.99, 13),
(9, 'Sub9', 9.99, 3),
(10, 'Sub10', 6.99, 4),
(11, 'Sub11', 7.99, 14),
(12, 'Sub12', 8.99, 4),
(13, 'Sub13', 5.99, 5),
(14, 'Sub14', 6.99, 15),
(15, 'Sub15', 7.99, 5),
(16, 'Sub16', 4.99, 6),
(17, 'Sub17', 5.99, 6),
(18, 'Sub18', 6.99, 6),
(19, 'Sub19', 7.99, 7),
(20, 'Sub20', 8.99, 7),
(21, 'Sub21', 9.99, 7),
(22, 'Sub22', 6.99, 8),
(23, 'Sub23', 7.99, 8),
(24, 'Sub24', 8.99, 8),
(25, 'Sub25', 5.99, 9),
(26, 'Sub26', 6.99, 9),
(27, 'Sub27', 7.99, 9),
(28, 'Sub28', 4.99, 10),
(29, 'Sub29', 5.99, 10),
(30, 'Sub30', 6.99, 10);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(1, 'John Doe', 'john@example.com', 'password1');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(2, 'Alice Smith', 'alice@example.com', 'password2');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(3, 'Bob Johnson', 'bob@example.com', 'password3');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(4, 'Emily Davis', 'emily@example.com', 'password4'),
(5, 'Michael Brown', 'michael@example.com', 'password5'),
(6, 'Emma Wilson', 'emma@example.com', 'password6'),
(7, 'William Taylor', 'william@example.com', 'password7'),
(8, 'Olivia Martinez', 'olivia@example.com', 'password8'),
(9, 'James Anderson', 'james@example.com', 'password9'),
(10, 'Sophia Thomas', 'sophia@example.com', 'password10'),
(11, 'David Hernandez', 'david@example.com', 'password11'),
(12, 'Isabella Lopez', 'isabella@example.com', 'password12'),
(13, 'Daniel Gonzalez', 'daniel@example.com', 'password13'),
(14, 'Mia Harris', 'mia@example.com', 'password14'),
(15, 'Alexander Clark', 'alexander@example.com', 'password15'),
(16, 'Ethan Lewis', 'ethan@example.com', 'password16'),
(17, 'Charlotte Lee', 'charlotte@example.com', 'password17'),
(18, 'Benjamin Walker', 'benjamin@example.com', 'password18'),
(19, 'Amelia Hall', 'amelia@example.com', 'password19'),
(20, 'Chloe Young', 'chloe@example.com', 'password20'),
(21, 'Jacob King', 'jacob@example.com', 'password21'),
(22, 'Ava Scott', 'ava@example.com', 'password22'),
(23, 'Liam Green', 'liam@example.com', 'password23'),
(24, 'Mason Baker', 'mason@example.com', 'password24'),
(25, 'Harper Adams', 'harper@example.com', 'password25'),
(26, 'Evelyn Hill', 'evelyn@example.com', 'password26'),
(27, 'Michael Rivera', 'michaelr@example.com', 'password27'),
(28, 'Abigail Ward', 'abigail@example.com', 'password28'),
(29, 'Aiden Turner', 'aiden@example.com', 'password29'),
(30, 'Samantha Cook', 'samantha@example.com', 'password30');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;