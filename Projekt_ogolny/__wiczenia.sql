-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 22 Lis 2024, 13:10
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ćwiczenia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `created_at`) VALUES
(1, 'Electronics', '2024-11-22 12:09:04'),
(2, 'Clothing', '2024-11-22 12:09:04'),
(3, 'Home & Kitchen', '2024-11-22 12:09:04'),
(4, 'Electronics', '2024-11-22 12:09:37'),
(5, 'Clothing', '2024-11-22 12:09:37'),
(6, 'Home & Kitchen', '2024-11-22 12:09:37'),
(7, 'Books', '2024-11-22 12:09:37'),
(8, 'Sports', '2024-11-22 12:09:37'),
(9, 'Toys', '2024-11-22 12:09:37'),
(10, 'Beauty & Health', '2024-11-22 12:09:37'),
(11, 'Automotive', '2024-11-22 12:09:37');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'John Doe', 'john.doe@example.com', 'password123', '2024-11-22 12:10:07'),
(2, 'Jane Smith', 'jane.smith@example.com', 'password456', '2024-11-22 12:10:07'),
(3, 'Robert Brown', 'robert.brown@example.com', 'password789', '2024-11-22 12:10:07'),
(4, 'Emily Johnson', 'emily.johnson@example.com', 'password000', '2024-11-22 12:10:07'),
(5, 'Michael Davis', 'michael.davis@example.com', 'mypassword', '2024-11-22 12:10:07');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','completed','cancelled') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `status`) VALUES
(1, 1, '2024-11-20 10:00:00', 'completed'),
(2, 2, '2024-11-21 14:30:00', 'pending'),
(3, 3, '2024-11-22 09:00:00', 'completed'),
(4, 4, '2024-11-23 16:45:00', 'cancelled'),
(5, 5, '2024-11-22 11:15:00', 'completed');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 1, 1, '1200.99'),
(2, 1, 3, 2, '15.99'),
(3, 2, 4, 11, '49.99'),
(4, 2, 5, 3, '59.99'),
(5, 3, 7, 50, '10.99'),
(6, 3, 10, 34, '29.99'),
(7, 4, 6, 5, '89.99'),
(8, 5, 8, 249, '99.99'),
(9, 5, 13, 678, '7.99');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `category_id`, `created_at`) VALUES
(1, 'Laptop', 'High performance laptop with 16GB RAM and 512GB SSD.', '1200.99', 1, '2024-11-22 12:09:57'),
(2, 'Smartphone', 'Latest model with a 6.5 inch display and 128GB storage.', '899.99', 1, '2024-11-22 12:09:57'),
(3, 'T-shirt', 'Cotton T-shirt, available in various sizes and colors.', '15.99', 2, '2024-11-22 12:09:57'),
(4, 'Jeans', 'Comfortable and stylish jeans for all occasions.', '49.99', 2, '2024-11-22 12:09:57'),
(5, 'Blender', 'Powerful blender for smoothies and soups.', '59.99', 3, '2024-11-22 12:09:57'),
(6, 'Microwave Oven', 'Compact microwave oven with quick heating functions.', '89.99', 3, '2024-11-22 12:09:57'),
(7, 'The Great Gatsby', 'A classic novel by F. Scott Fitzgerald.', '10.99', 4, '2024-11-22 12:09:57'),
(8, 'Harry Potter', 'The complete Harry Potter series in one box set.', '99.99', 4, '2024-11-22 12:09:57'),
(9, 'Soccer Ball', 'Standard size soccer ball for training and games.', '25.99', 5, '2024-11-22 12:09:57'),
(10, 'Basketball', 'Durable basketball for indoor and outdoor play.', '29.99', 5, '2024-11-22 12:09:57'),
(11, 'Action Figure', 'Collectible superhero action figure.', '19.99', 6, '2024-11-22 12:09:57'),
(12, 'Dollhouse', 'Wooden dollhouse with furniture and accessories.', '89.99', 6, '2024-11-22 12:09:57'),
(13, 'Shampoo', 'Nourishing shampoo for all hair types.', '7.99', 7, '2024-11-22 12:09:57'),
(14, 'Lipstick', 'Long-lasting lipstick available in different shades.', '12.99', 7, '2024-11-22 12:09:57'),
(15, 'Car Battery', '12V car battery for most car models.', '120.00', 8, '2024-11-22 12:09:57'),
(16, 'Tire Repair Kit', 'Complete tire repair kit for emergencies.', '30.00', 8, '2024-11-22 12:09:57'),
(17, 'Washing Machine', 'Zmywarka do naczyń ultra szybka i bezpieczna', '2599.99', 3, '2024-11-22 12:57:40'),
(18, 'Cooker', 'Kuchenka do gotowania bardzo bezpieczna', '1999.99', 3, '2024-11-22 12:57:40');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeksy dla tabeli `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indeksy dla tabeli `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Ograniczenia dla tabeli `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Ograniczenia dla tabeli `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
