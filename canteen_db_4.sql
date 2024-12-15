-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2023 at 08:16 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `canteen_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `additem`
--

CREATE TABLE `additem` (
  `itemId` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `itemName` varchar(50) NOT NULL,
  `itemDesc` varchar(1000) NOT NULL,
  `itemKeywords` varchar(1000) NOT NULL,
  `image` varchar(100) NOT NULL,
  `salePrice` double NOT NULL,
  `Quantity` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `additem`
--

INSERT INTO `additem` (`itemId`, `category_id`, `itemName`, `itemDesc`, `itemKeywords`, `image`, `salePrice`, `Quantity`) VALUES
(1, 3, 'Lays Chips', 'Lay\'s is a popular brand of potato chips and other snack products. Their potato chips come in a variety of flavors and sizes, catering to different tastes and preferences.', 'highcalorie,highfat,highsodium,calorie,fat,sodium,flavour,lays,potatochips,chips,chip,potato,vegetableoil,happy,excitement,stress,craving,salty,salt,celebration,snacks', 'lays-chips.jpg', 40, 40),
(2, 3, 'Tiger Biscuits', 'Tiger are a type of popular biscuit brand made by Mayora, a company based in Indonesia. Tiger biscuits are well-known in many countries across Asia and beyond, and they come in various flavors and varieties.', 'Calories,fat,carbohydrates,fiber,sugar,protein,happy,stress,sweet,chocolate,coffee,celebration,snacks,snack,tiger,biscuits,biscuit,tigerbiscuit', 'tiger.jpg', 20, 50),
(3, 3, 'm&m\'s', 'M&M\'s (stylized as m&m\'s) are multi-colored button-shaped chocolates, each of which has the letter \"m\" printed in lower case in white on one side, consisting of a candy shell surrounding a filling which varies depending upon the variety of M&M\'s.', 'Calories,fat,carbohydrates,fiber,sugar,protein,chcolate,milk,butter,lactose,craving,happy,stress,sweet,chocolate,celebration,snacks,snack,m&m,m&ms', 'm&ms.jpg', 20, 20),
(4, 3, 'Popcorners', 'We’re changing snack time for the better. Rip open a bag of delicious PopcCorners and share in the healthy fun! PopCorners are the delicious, low-calorie snack that makes it easier than ever to SNACK BETTER! It’s the simple things in life that bring the most joy.', 'Calories,fat,carbohydrates,fibre,sodium,protein,salt,corn,hunger,craving,happy,celebration,movie,night,stress,Calories,fat,carbohydrates,fibre,sodium,protein,salt,taste,hunger,craving,SeaSalt,sweet,chili,spicy,cheesy,snacks,snack,popcorn,popcorner', 'popcorners.jpg', 20, 10),
(5, 3, 'Luna Energy Bars', 'We power our bars with protein from soy to help give you the strength,stamina,satisfaction to get through the day.', 'Calories,fat,carbohydrates,fibre,sodium,protein,salt,strength,stamina,satisfaction,stress,fatigue,taste,enjoyment,nutrient,calorie,chocolate,fruit,nut,chocolate,coffee,caramel,celebration,lunabar,energybar,bar,snacks', 'Luna bar.jpg', 30, 20),
(6, 3, 'Current Chicken Noodles', 'Instant Chicken Noodles are a quick and savory meal made with wheat noodles and a delicious chicken flavoring. Perfect for a fast and satisfying lunch or snack.', 'Energy, protein, carbohydrates, sodium, calories,Wheat, noodles, chicken, flavoring,Savory, Salty,Comfort, Satisfaction\nInstant Chicken Noodles, Savory, Comfort Food, Salty, Quick Meal, Instant Noodles,current,currentnoodles,snacks,snack', 'Current Instant Chicken Noodles.jpg', 50, 11),
(7, 3, 'Maggi Noodles', 'Maggi 2-Minute Noodles Masala is a popular choice for those seeking a spicy and quick meal. These wheat noodles come with a zesty masala seasoning, offering excitement in every bite.\n', 'noodle,snacks,snack,Energy, carbohydrates, sodium, calories,Wheat noodles,Spicy, Savory,Excitement, Quick Meal,maggiNoodles, SpicyMasala, Quick Meal, Exciting, InstantNoodles,maggi', 'maggi.jpg', 45, 22),
(8, 3, 'Current 2X Spicy Noodles', 'For the adventurous palate, Current 2X Spicy Noodles provide an extra kick. These wheat noodles are loaded with extra spicy seasoning, perfect for those who love bold flavors.\n', 'Energy, protein, carbohydrates, sodium, calories,Wheat noodles, extra spicy seasoning,Spicy, Savory,Adventure, Boldness,2X Spicy Noodles, Extra Spicy, Adventure, Savory, Instant Noodles,current,noodle,snacks,snack', 'current spicy.jpg', 55, 40),
(9, 3, 'Korean Ramen Noodles', '2Pm Korean Ramen Noodles offer a taste of Korea with their traditional seasoning and Korean ramen noodles. Experience umami and spiciness in a single bowl.\n', 'noodle,snacks,snack,Energy, protein, carbohydrates, sodium, calories,Korean,ramen,noodles, traditionalseasoning,Umami, Spicy,CulturalExperience, spicy,Satisfaction, Umami, Spicy, Cultural, Satisfying', 'korean.jpg', 75, 10),
(10, 3, 'Wai Wai Quick Pizza', 'Wai Wai Quick Chicken Pizza combines the convenience of instant noodles with the flavors of a chicken pizza. A savory and curious treat for your taste buds.\n', 'noodle,snacks,snack,\nEnergy, protein, carbohydrates, sodium, calories,Instant noodles, chicken pizza flavoring,Savory,Curiosity, Indulgence,Noodles, Savory, Curiosity, Indulgent, Instant', 'quick pizza.jpg', 20, 50),
(11, 3, 'Kaccha Mango Bite\n', 'Parle Kaccha Mango Bite offers sweet and fruity , perfect for those moments of happiness and nostalgia.', 'Energy, carbohydrates, sugar,Mangoflavored,Sweet, Fruity,Happiness, Nostalgia,Kaccha, Mango , Sweet, Fruity, Happy,happiness,snacks,snack', 'Kaccha Mango Bite.jpg', 2, 14),
(12, 3, 'Kinder Joy Surprise', 'Kinder Joy Surprise is a delightful chocolate egg with a hidden toy inside. A sweet and joyful treat that brings moments of excitement.\n', 'Energy, sugar,Sweet, Chocolate,happy,Joy, Surprise,KinderJoy,snacks ,snack', 'Kinder Joy Surprise.jpg', 120, 16),
(13, 3, 'Eclairs', 'Eclairs Milk Chocolate are creamy caramel candies filled with milk chocolate. A pleasurable and indulgent sweet treat.', '\nEnergy, sugar,Milk,chocolate,caramelcandies,Sweet, Creamy,happy,Pleasure, Indulgence,Eclairs, Candy,snacks,snack', 'Eclairs.jpg', 2, 12),
(14, 5, 'Americano coffee', 'Americano coffee is a classic black coffee made by diluting espresso with hot water. It\'s known for its bold and bitter taste.', 'AmericanoCoffee, Bitter, Coffee, Wakefulness, Alertness', 'Americano coffee.jpg', 100, 13),
(15, 3, 'Current Cheese Balls', 'Current Cheese Balls are crunchy, cheesy snacks perfect for satisfying your snacking cravings. Enjoy them with a feeling of satisfaction.\n', '\nEnergy, carbohydrates, fat, sodium, calories,Cheese-flavored snack balls,Cheesy, Crunch,Snack Craving, Satisfaction,Snacks,snack', 'Current Cheese Balls.jpg', 25, 2),
(16, 3, '2Pm Cheese Ball', '2Pm Cheese Ball is another delightful cheesy snack to satisfy your snacking desires. Enjoy them with a sense of enjoyment.', '', '2Pm Cheese Ball.jpg', 30, 4),
(17, 3, 'Parle Monaco', 'Parle Monaco Classic Regular offers classic salted crackers, perfect for snacking simplicity. Enjoy them during snack time.', 'Energy, carbohydrates, sodium,Classic salted crackers,Salty, Crispy,SnackTime, Simplicity,Biscuits,snacks,snack', 'Parle Monaco.jpg', 20, 7),
(18, 3, 'Coconut Crunchy', 'Coconut Crunchy biscuits provide a sweet and tropical delight with a coconut flavor. Ideal for moments of relaxation and enjoyment.', 'Energy, carbohydrates, sugar, Coconut-flavored biscuits,Sweet, Coconut,Tropical Delight, Relaxation,Biscuit,snacks,snack', 'Coconut Crunchy.jpg', 20, 2),
(19, 3, 'Hide & Seek Biscuit', 'Parle Hide & Seek Bourbon Biscuit is a delightful chocolate cream-filled biscuit that brings delight and nostalgia with every bite.', 'snacks,snack,Energy, carbohydrates, sugar,Chocolate,cream,Sweet, Delight, Nostalgia,Biscuits', 'Hide & Seek Bourbon Biscuit.jpg', 30, 8),
(20, 4, 'Chocolate Chip Cookies', 'Parle Hide & Seek Caffe Mocha Chocolate Chip Cookies are sweet treats for coffee lovers. Enjoy the combination of coffee and chocolate in each cookie.', 'snacks,snack,Lovers, Treat,Energy, carbohydrates, sugar,Chocolate,cream,Sweet, Delight, Nostalgia,Biscuits', 'Chocolate Chip Cookies.jpg', 50, 77),
(21, 5, 'Espresso Coffee', 'Espresso is a concentrated coffee brewed by forcing a small amount of nearly boiling water through finely-ground coffee beans. It has an intense, strong flavor.\n', 'EspressoCoffee, Intense, Coffee, Quick,Energy,Boost,drink,hot,beverage,expresso', 'Espresso Coffee.jpg', 80, 16),
(22, 5, 'Cappuccino Coffee', 'Cappuccino is a coffee drink made with espresso and frothy steamed milk. It\'s known for its creamy and coffee-forward taste.', 'Cappuccino, Creamy, Coffee, Comfort, Relaxation,drink,hot,beverage', 'Cappuccino Coffee.jpg', 120, 52),
(23, 5, 'Latte Coffee', 'Latte is a coffee drink made with espresso and a large amount of steamed milk. It has a mild and comforting coffee flavor.', 'Latte , Mild, Coffee, Contentment, Relaxation,drink,hot,beverage', 'Latte Coffee.jpg', 110, 30),
(24, 5, 'Black Tea', 'Black tea is a classic tea variety known for its bold, brisk, and slightly bitter taste. It\'s often enjoyed with milk or sugar.', 'Black,Tea, Bitter, Astringent, Alertness, Calm,drink,hot,beverage', 'black tea.jpg', 15, 10),
(25, 5, 'Green Tea', 'Green tea is celebrated for its earthy and slightly bitter taste, loaded with antioxidants. It\'s known for its refreshing and health-conscious properties.\n', 'Green,Tea, Earthy, Bitter, Refreshment, Health,conscious,drink,hot,beverage', 'Green Tea.jpg', 50, 40),
(26, 5, 'Milk Tea', 'Milk tea combines tea and milk, often sweetened. It has a sweet, creamy, and indulgent flavor, making it a cozy beverage.', 'Milk,Tea, Sweet, Creamy, Coziness, Indulgence,drink,hot,beverage', 'Milk Tea.jpg', 25, 11),
(27, 5, 'Lemon Tea', 'Lemon tea is a tangy and refreshing beverage made by adding lemon juice to tea. It\'s known for its rejuvenating and invigorating qualities.', 'Lemon,Tea, Sour, Refreshing, Rejuvenation, Invigoration,drink,hot,beverage', 'Lemon Tea.jpg', 20, 20),
(28, 5, 'Milk', 'Milk is a nutrient-rich liquid that can be consumed plain or used in various recipes. It\'s a source of essential nutrients like calcium and protein.', 'Milk, Nutrient,rich, Calcium, Protein, Versatile,drink,hot,beverage', 'milk.jpg', 20, 70),
(29, 5, 'Hot Chocolate', 'Hot chocolate is a sweet and chocolate-flavored drink made with milk and cocoa. It offers comfort and indulgence with every sip.', 'Hot,Chocolate, Sweet, Chocolate, Comfort, Indulgence,drink,hot,beverage', 'Hot Chocolate.jpg', 90, 12),
(30, 4, 'Milkshake', 'A milkshake is a creamy and sweet beverage made by blending milk with ice cream and flavorings. It\'s a delightful and indulgent treat.', 'Milkshake, Creamy, Sweet, Indulgence, Dessert,cold,drink', 'Milkshake.jpg', 50, 9),
(31, 6, 'Fanta', 'Fanta is a popular carbonated soft drink known for its sweet and fruity flavor, often described as an effervescent burst of happiness.', 'Fanta, Sweet, Fruity, Refreshing, Happiness, SoftDrink,drink,cold,beverage,happy,refresh,fruit', 'Fanta.jpg', 50, 8),
(32, 6, 'Yogurt', 'Yogurt is a dairy product known for its creamy and tangy taste. It\'s versatile and can be enjoyed in various dishes or as a standalone snack.', 'Yogurt, Creamy, Tangy, Versatile, Dairy Product, Snack,drink,cold,beverage', 'Yogurt.jpg', 60, 7),
(33, 6, 'Milk Shake Chocolate', 'Cavin\'s Milk Shake Chocolate is a rich and creamy chocolate-flavored milkshake, perfect for indulgence and satisfaction.', 'Chocolate,Milkshake, Rich, Creamy, Indulgence, Satisfaction,drink,cold,beverage', 'Milk Shake Chocolate.jpg', 40, 63),
(34, 6, 'Real Mixed Fruits', 'Real Mixed Fruits Juice is a combination of various fruit juices, offering a symphony of sweet and tangy flavors for moments of happiness.', 'real,Mixed,Fruits, Sweet, Tangy, Symphony, Happiness,happy,fruit, Juice,drink,cold', 'Real Mixed Fruits.jpg', 25, 85),
(35, 6, 'Mango Frooti', 'Mango Frooti is a famous mango juice drink, offering the pure and delicious taste of ripe mangoes. It\'s a sip of joy and contentment.', 'Mango,Frooti,Juice, Pure, Delicious, Joy, Juice,drink,cold,beverage', 'Mango Frooti.jpg', 25, 22),
(36, 6, 'Mango Lassi', 'Mango Lassi is a sweet and creamy Indian drink made with yogurt and ripe mangoes. It\'s a soothing and delightfully fruity beverage.', 'Mango,Lassi, Sweet, Creamy, Soothing, Fruity ,drink,cold,beverage', 'Mango Lassi.jpg', 40, 10),
(37, 6, 'Pepsi', 'Pepsi is a classic cola drink, offering a balance of sweetness and a hint of bitterness. It\'s often associated with enjoyment and satisfaction.', 'Pepsi, Sweet, Bitter, Enjoyment, Soda,drink,cold,beverage', 'Pepsi.jpg', 50, 44),
(38, 6, 'Mountain Dew', 'Mountain Dew is a citrus-flavored soda with a bold and energizing taste, perfect for moments of excitement.', 'MountainDew,Mountain,Dew, Citrus, Energizing, Excitement, Soda,drink,cold,beverage', 'Mountain Dew.jpg', 80, 22),
(39, 7, 'Hamburgers', 'Hamburgers are a popular fast food item made with a seasoned ground meat patty (usually beef) placed inside a sliced bun. They are often served with various toppings and condiments.', 'Protein, Carbohydrates, Fat, Calories, Sodium, Iron,savory,Happy, Excitement, Hamburger, Beef, Calories, Salty,street,food,fastfoods,fastfood', 'Hamburgers.jpg', 100, 10),
(40, 7, 'French Fries', 'French fries are thin strips of deep-fried potato. They are a classic side dish or snack.', 'Carbohydrates, Fat, Calories, Sodium,Salty,Happy,Snack, FrenchFries, Potatoes,street,food,fastfoods,fastfood,fries', 'French Fries.jpg', 70, 40),
(41, 7, 'Chicken Pizza', 'Pizza is an Italian dish made with a round, flat bread base topped with various ingredients like tomato sauce, cheese, and various toppings.', 'Carbohydrates, Protein, Fat, Calories, Excitement,ItalianCuisine, Pizza, Cheese, Savory, Happy,street,food,fastfoods,fastfood', 'Pizza.jpg', 150, 20),
(42, 7, 'Hot Dogs', 'Hot dogs are sausages served in a sliced bun with various condiments and toppings.', 'Protein, Carbohydrates, Fat, Calories, Sodium,Savory,Hotdogs, Sausage, Savory, Happy,street,food,fastfoods,fastfood', 'Hot Dogs.jpg', 35, 32),
(43, 7, 'Fried Chicken', 'Fried chicken is chicken pieces coated with seasoned flour and deep-fried until crispy.', 'Protein, Carbohydrates, Fat, Calories, Sodium, Iron,Excitement,FriedChicken,fried,chicken, Savory, Happy,street,food,fastfoods,fastfood', 'Fried Chicken.jpg', 55, 12),
(44, 7, 'Sausage', 'Sausages are ground meat, often pork or beef, mixed with spices and encased in a cylindrical shape. They can be grilled, fried, or boiled.', 'Protein, Fat, Sodium, Iron,Sausage, Meat, Savory, Happy,street,food,fastfoods,fastfood', 'Sausage.jpg', 25, 32),
(45, 7, 'Samosas', 'Samosas are popular Indian snacks made with a crispy pastry shell filled with spiced potatoes, peas, and sometimes meat.', 'Carbohydrates, Fat, Calories, Excitement,Indian,Snack, Samosas, Spicy, Savory, Happy,street,food,fastfoods,fastfood', 'Samosas.jpg', 20, 41),
(46, 7, 'Biryani', 'Biryani is a fragrant and flavorful Indian rice dish cooked with spices, meat, and/or vegetables.', 'Carbohydrates, Protein, Fat, Calories,Spicy, Excitement,IndianCuisine, Biryani, Spicy, Aromatic, Happy,street,food,fastfoods,fastfood', 'Biryani.jpg', 70, 21),
(47, 7, 'Samosa Chaat', 'Samosa chaat is a popular Indian street food made by breaking samosas into pieces and topping them with various chutneys, yogurt, and spices.', 'Carbohydrates, Protein, Calorie,Excitement,StreetFood, Samosa Chaat, Spicy, Tangy, Happy,street,food,fastfoods,fastfood', 'Samosa Chaat.jpg', 50, 22),
(48, 7, 'Sandwiches', 'Sandwiches are versatile snacks made by placing various ingredients, such as meats, vegetables, and condiments, between slices of bread.', 'Carbohydrates, Protein, Fat, Calories,spicy,buff,happy,sad,excitement,Snack, Sandwiches, Customizable,street,food,fastfoods,fastfood', 'Sandwiches.jpg', 40, 32),
(49, 7, 'Chicken Chow Mein', 'Chicken chow mein is a popular Chinese stir-fried noodle dish with chicken and vegetables.', 'Carbohydrates, Protein, Fat, Calories, Salty,Happy, Excitement,ChineseCuisine, Chow Mein, Chicken, Savory, Happy,street,food,fastfoods,fastfood', 'Chicken Chow Mein.jpg', 80, 32),
(50, 7, 'Buff Chow Mein', 'Buff chow mein is similar to chicken chow mein but made with buffalo (water buffalo) meat.', 'Carbohydrates, Protein, Fat, Calories,Salty,Happy, Excitement,NepaliCuisine, Chow Mein, Buffalo, Savory,buff,happy,street,food,fastfoods,fastfood', 'Buff Chow Mein.jpg', 70, 32),
(51, 7, 'Veg Chow Mein', 'Veg chow mein is a vegetarian version of chow mein, typically featuring stir-fried noodles and a variety of vegetables.', 'Carbohydrates, Fiber, Calories,Savory,Happy, Excitement,Vegetarian, Chow Mein, Savory, Happy,street,food,fastfoods,fastfood', 'Veg Chow Mein.jpg', 50, 10),
(52, 7, 'Chicken Momo', 'Chicken momo is a type of Nepali dumpling filled with seasoned chicken, often served with a dipping sauce.', 'Protein, Carbohydrates, Fat, Calories,Savory, Spicy,Happy, Excitement,NepaliCuisine, Momo, Chicken,street,food,fastfoods,fastfood', 'Chicken Momo.jpg', 120, 40),
(53, 7, 'Buff Momo', 'Buff momo is similar to chicken momo but made with buffalo meat.', 'Protein, Carbohydrates, Fat, Calories,Savory, Spicy,Happy, Excitement,Nepali Cuisine, Momo, Buffalo,buff,street,food,fastfoods,fastfood', 'Buff Momo.jpg', 100, 20),
(54, 4, 'Oreo Choco Cake', 'Oreo Choco Cake is a delectable dessert made with a rich, chocolate cake base, layers of Oreo cookie crumbles, and a creamy chocolate frosting.', 'Energy, cake,Carbohydrates, Sugar, Fat, Calories,Dessert, Oreo Choco Cake, Chocolate, Sweet, Happy,dessert,Excitement', 'Oreo Choco Cake.jpg', 550, 10),
(55, 4, 'Butterscotch Cake', 'Butterscotch Cake is a luscious dessert consisting of a moist butterscotch-flavored cake with caramel and cream layers.', 'Energy,cake,Carbohydrates, Sugar, Fat, Calories,Dessert, Butterscotch Cake, Sweet, Happy,dessert,Excitement', 'Butterscotch Cake.jpg', 600, 20),
(56, 4, 'Blackforest Cake', 'Blackforest Cake is a classic dessert featuring layers of chocolate sponge cake, cherries, and whipped cream, topped with chocolate shavings.', 'Energy, cake,Carbohydrates, Sugar, Fat, Calorie,Dessert, Blackforest,Cake, Chocolate, Sweet, Happy,dessert,Excitement', 'Blackforest Cake.jpg', 600, 10),
(57, 4, 'Choco Pie', 'Choco Pie is a sweet treat consisting of a soft cake with a marshmallow filling, coated in a layer of chocolate.', 'Energy, Carbohydrates, Sugar, Fat, Calorie,Snack, ChocoPie, Chocolate, Sweet, Happy,dessert,Excitement,cake', 'Choco Pie.jpg', 25, 20),
(58, 4, 'Chocolate Soft Biscuit', 'Chocolate Coated Soft Biscuits are delightful snacks made of soft, buttery biscuits covered in a layer of chocolate.', 'Energy, Carbohydrates, cake,Sugar, Fat, Calorie, Snack, Biscuit, Chocolate, Sweet, Happy,dessert,Excitement', 'Chocolate Coated Soft Biscuit.jpg', 50, 10),
(59, 4, 'Chocolate Ice Cream', 'Happy Belly Chocolate Chip Cookie Dough Ice Cream is a creamy dessert featuring chocolate chip cookie dough chunks mixed in a rich ice cream base.', 'Energy, Carbohydrates, cake,Sugar, Fat, Calories,IceCream, HappyBelly, Chocolate, Sweet, Happy,dessert,Excitement', 'Chocolate Chip Dough Ice Cream.jpg', 50, 22),
(60, 4, 'Vanilla Ice Cream', 'Happy Belly Vanilla Bean Ice Cream is a classic treat with a smooth and creamy vanilla flavor.', 'Energy, Carbohydrates, Sugar, Fat, Calories,Excitement,ice Cream, Happy Belly, Vanilla, Sweet, Happy,dessert,Excitement,cake', 'Vanilla Bean IceCream.jpg', 300, 55);

-- --------------------------------------------------------

--
-- Table structure for table `admin_tbl`
--

CREATE TABLE `admin_tbl` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_tbl`
--

INSERT INTO `admin_tbl` (`id`, `name`, `email`, `password`) VALUES
(1, 'admin@username', 'admin@gmail.com', '392cbd9d8a28cf9be1a9941e55e650f2');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `itemId` int(11) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_tbl`
--

CREATE TABLE `category_tbl` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_tbl`
--

INSERT INTO `category_tbl` (`category_id`, `category_title`) VALUES
(3, 'Snacks'),
(4, 'Sweets and Desserts '),
(5, 'Hot Beverages'),
(6, 'Cold Beverages'),
(7, 'Fast Foods');

-- --------------------------------------------------------

--
-- Table structure for table `compare_tbl`
--

CREATE TABLE `compare_tbl` (
  `cmp_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `table_no` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `table_no`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(20, 9, 4, 'manish', '9856327404', 'qwerty@gmail.com', 'cash on delivery', 'thaiba', ', tiger biscuit (1) , momo (1) ', 120, '30-Sep-2023', 'completed'),
(21, 9, 5, 'manish', '9874563210', 'manish@gmail.com', 'cash on delivery', 'thaiba', ', momo (1) ', 100, '30-Sep-2023', 'pending'),
(22, 9, 5, 'qwerty', '9874563210', 'admin@gmail.com', 'cash on delivery', 'thaiba', ', chowmein (6) ', 600, '30-Sep-2023', 'pending'),
(23, 9, 1, 'manish', '9863860038', 'admin@gmail.com', 'cash on delivery', 'thaiba', ', momo (1) , chowmein (1) ', 200, '30-Sep-2023', 'pending'),
(24, 11, 5, 'manish', '9811860038', 'manish@gmail.com', 'cash on delivery', 'thaiba', ', chowmein (1) ', 100, '09-Oct-2023', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(9, 'manish12', 'manish@gmail.com', '392cbd9d8a28cf9be1a9941e55e650f2'),
(11, 'user@username', 'user@gmail.com', '392cbd9d8a28cf9be1a9941e55e650f2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additem`
--
ALTER TABLE `additem`
  ADD PRIMARY KEY (`itemId`),
  ADD KEY `additem_ibfk_1` (`category_id`);

--
-- Indexes for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `itemId` (`itemId`);

--
-- Indexes for table `category_tbl`
--
ALTER TABLE `category_tbl`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `compare_tbl`
--
ALTER TABLE `compare_tbl`
  ADD PRIMARY KEY (`cmp_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `compare_tbl_ibfk_3` (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additem`
--
ALTER TABLE `additem`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category_tbl`
--
ALTER TABLE `category_tbl`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `compare_tbl`
--
ALTER TABLE `compare_tbl`
  MODIFY `cmp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=580;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additem`
--
ALTER TABLE `additem`
  ADD CONSTRAINT `additem_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_tbl` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `additem` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `compare_tbl`
--
ALTER TABLE `compare_tbl`
  ADD CONSTRAINT `compare_tbl_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `additem` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compare_tbl_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category_tbl` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
