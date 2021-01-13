CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(255),
  `phone` int,
  `email` varchar(255),
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `user_payments` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `type` int,
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `user_delivery_addresses` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `address` varchar(255),
  `state` varchar(255),
  `city` varchar(255),
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `user_reaction_food` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `food_it` int,
  `restaurant_id` int,
  `restaurant_address_id` int,
  `reaction` ENUM ('love', 'like', 'angry'),
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `user_reaction_restaurant` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `food_it` int,
  `restaurant_id` int,
  `restaurant_address_id` int,
  `reaction` ENUM ('love', 'like', 'angry'),
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `restaurant_categories` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `value` varchar(255)
);

CREATE TABLE `restaurant` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` varchar(255),
  `avatar` varchar(255),
  `banner` varchar(255),
  `start_hour` varchar(255),
  `end_hour` varchar(255),
  `category` int,
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `restaurant_addresses` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `restaurant_id` int,
  `address` varchar(255),
  `state` varchar(255),
  `city` varchar(255),
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `restaurant_rating` (
  `user_id` int,
  `restaurant_id` int,
  `restaurant_address_id` int,
  `rating` int,
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `restaurant_review` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `restaurant_id` int,
  `restaurant_address_id` int,
  `review` varchar(255),
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `food` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `restaurant_id` int,
  `title` varchar(255),
  `description` varchar(255),
  `price` double,
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `food_addons` (
  `id` int PRIMARY KEY,
  `food_it` int,
  `name` varchar(255),
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `food_addon_values` (
  `id` int PRIMARY KEY,
  `addon_id` int,
  `unit` varchar(255),
  `price` double,
  `value` double
);

CREATE TABLE `food_restaurant_rating` (
  `user_id` int,
  `restaurant_id` int,
  `restaurant_address_id` int,
  `food_it` int,
  `rating` int,
  `created_at` timestamp,
  `update_at` timestamp,
  PRIMARY KEY (`user_id`, `restaurant_id`, `restaurant_address_id`, `food_it`)
);

CREATE TABLE `food_restaurant_reviews` (
  `user_id` int PRIMARY KEY AUTO_INCREMENT,
  `restaurant_id` int,
  `restaurant_address_id` int,
  `food_it` int,
  `review` varchar(255),
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `carts` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `cart_items_ids` varchar(255),
  `total_price` double,
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `cart_items` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `cart_id` int,
  `food_id` int,
  `addon_id` int,
  `addon_value_id` int,
  `total_price` double
);

ALTER TABLE `user_payments` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_delivery_addresses` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_reaction_food` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_reaction_restaurant` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `restaurant_addresses` ADD FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);

ALTER TABLE `restaurant_rating` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `restaurant_review` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `food_addons` ADD FOREIGN KEY (`food_it`) REFERENCES `food` (`id`);

ALTER TABLE `food_addon_values` ADD FOREIGN KEY (`id`) REFERENCES `food_addons` (`id`);

ALTER TABLE `cart_items` ADD FOREIGN KEY (`id`) REFERENCES `carts` (`cart_items_ids`);

