-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2024 at 03:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_usersid` int(11) NOT NULL,
  `address_name` varchar(255) NOT NULL,
  `address_city` varchar(255) NOT NULL,
  `address_street` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_usersid`, `address_name`, `address_city`, `address_street`) VALUES
(27, 111, 'AAST', 'Aswan ', 'El Sadat'),
(32, 111, 'building 34', 'Cairo, Nasr city', 'Abbas el-Akkad');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_usersid` int(11) NOT NULL,
  `cart_itemsid` int(11) NOT NULL,
  `cart_orders` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_usersid`, `cart_itemsid`, `cart_orders`) VALUES
(420, 111, 25, 103),
(421, 111, 25, 103),
(422, 111, 25, 103),
(423, 111, 25, 103),
(424, 111, 25, 103),
(425, 111, 1, 103),
(426, 111, 1, 103),
(427, 111, 1, 103),
(428, 111, 8, 103),
(429, 111, 8, 103),
(430, 111, 8, 103),
(431, 111, 7, 103),
(432, 111, 7, 103),
(433, 111, 7, 103),
(434, 111, 7, 103),
(435, 111, 12, 103),
(436, 111, 12, 103),
(437, 111, 12, 103),
(438, 111, 18, 103),
(439, 111, 18, 103),
(440, 111, 18, 103),
(441, 111, 18, 103),
(442, 111, 18, 103),
(443, 111, 25, 104),
(444, 111, 25, 105),
(445, 111, 46, 106),
(446, 111, 46, 106),
(447, 111, 46, 106),
(448, 111, 9, 106),
(449, 111, 9, 106),
(450, 111, 9, 106),
(452, 111, 40, 107),
(453, 111, 40, 107),
(454, 111, 40, 107),
(455, 111, 40, 107),
(456, 111, 18, 108),
(457, 111, 11, 108),
(458, 111, 11, 108),
(459, 111, 8, 109),
(460, 111, 25, 110),
(461, 111, 18, 111),
(462, 111, 13, 112),
(463, 111, 13, 112),
(464, 111, 21, 113);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartview`
-- (See below for the actual view)
--
CREATE TABLE `cartview` (
`itemsprice` decimal(42,0)
,`countitems` bigint(21)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` int(11)
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(100) NOT NULL,
  `categories_name_ar` varchar(100) NOT NULL,
  `categories_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_name_ar`, `categories_datetime`) VALUES
(1, 'Laptop', 'لابتوب', '2024-06-28 19:05:56'),
(2, 'Camera', 'كاميرا', '2024-06-28 19:06:20'),
(3, 'Mobile', 'موبايل', '2024-06-28 19:06:20'),
(4, 'Shoes', 'احذية', '2024-06-28 19:06:20'),
(5, 'Clothes', 'ملابس', '2024-06-28 19:06:20'),
(6, 'Earphones', 'سماعات', '2024-07-17 12:11:27');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(50) NOT NULL,
  `coupon_count` int(11) NOT NULL,
  `coupon_discount` smallint(6) NOT NULL DEFAULT 0,
  `coupon_expiredate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_name`, `coupon_count`, `coupon_discount`, `coupon_expiredate`) VALUES
(1, 'karim22', 1, 20, '2024-07-31 18:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_usersid` int(11) NOT NULL,
  `favorite_itemsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `items_id` int(11) NOT NULL,
  `items_name` varchar(100) NOT NULL,
  `items_name_ar` varchar(100) NOT NULL,
  `items_desc` varchar(255) NOT NULL,
  `items_desc_ar` varchar(255) NOT NULL,
  `items_image` varchar(255) NOT NULL,
  `items_count` int(11) NOT NULL,
  `items_active` tinyint(4) NOT NULL DEFAULT 1,
  `items_price` int(11) NOT NULL,
  `items_discount` smallint(6) NOT NULL,
  `items_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `items_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `items_name`, `items_name_ar`, `items_desc`, `items_desc_ar`, `items_image`, `items_count`, `items_active`, `items_price`, `items_discount`, `items_date`, `items_cat`) VALUES
(1, 'Laptop HP Envy', 'لاب توب اتش بي انفي', 'Hp Envy 16-h1023dx - Intel Core i9-13900H 13th motherboard - NVIDIA GeForce RTX 4060M 8GB GDDR6 graphics card - 16GB DDR5-5200 RAM and 1TB SSD', ' اتش بي انفي 16-h1023dx - انتل كور i9-13900H الثالث عشر - بطاقة رسومات نفيديا جي فورس ار تي اكس 4060 بسعة 8 جيجابايت GDDR6 - ذاكرة رام DDR5-5200 16 جيجابايت ومحرك أقراص SSD سعة 1 تيرا', 'laptop.png', 5, 1, 2000, 0, '2024-06-29 19:07:27', 1),
(7, 'Canon EOS Rebel', 'كانون EOS ريبل', '\r\nCanon EOS Rebel T7 DSLR Camera with 18-55mm Lens | Built-in Wi-Fi | 24.1 MP CMOS Sensor | DIGIC 4+ Image Processor and Full HD Videos', 'كاميرا Canon EOS Rebel T7 DSLR مع عدسة 18-55 ملم | واي فاي مدمج | مستشعر سيموس 24.1 ميجابكسل | معالج الصور DIGIC 4+ ومقاطع الفيديو عالية الدقة', 'canoneos.png', 15, 1, 700, 10, '2024-07-17 12:26:15', 2),
(8, 'HP W500 Webcam', 'كاميرا ويب HP W500', '1080P Full HD, Intelligent Noise Reduction, UVC Plug and Play, Camera Privacy Cover, Wide View Angle for Live Streaming/Conference/Online Learning/Podcast Camera for Laptop or Computer', 'دقة عالية 1080 بكسل، تقليل ذكي للضوضاء، توصيل وتشغيل بالأشعة فوق البنفسجية، غطاء خصوصية الكاميرا، زاوية رؤية واسعة للبث المباشر/المؤتمرات/التعلم عبر الإنترنت/كاميرا البودكاست للكمبيوتر المحمول أو الكمبيوتر', 'hpwebcam.png', 10, 1, 450, 0, '2024-07-17 12:26:15', 2),
(9, 'Kasa 2K Cam', 'كاميرا كاسا 2k', 'Kasa 2K QHD Security Camera Pan/Tilt, Starlight Sensor for Color Night Vision, Motion Detection for Baby & Pet Monitor, 2-Way Audio, Cloud & SD Card Storage, Works with Alexa & Google Home \r\n', 'كاميرا أمان Kasa 2K QHD قابلة للإمالة، مستشعر ضوء النجوم للرؤية الليلية الملونة، كشف الحركة لمراقبة الأطفال والحيوانات الأليفة، صوت ثنائي الاتجاه، تخزين بطاقة Cloud وSD، تعمل مع Alexa وGoogle Home', 'kasa.png', 7, 1, 500, 0, '2024-07-17 12:26:15', 2),
(10, 'Sony ZV-1 ', 'سوني zv-1', 'Digital Camera for Content Creators, Vlogging and YouTube with Flip Screen, Built-in Microphone, 4K HDR Video, Touchscreen Display, Live Video Streaming, Webcam', 'كاميرا رقمية لمنشئي المحتوى، ومدونات الفيديو ويوتيوب مع شاشة قابلة للطي، وميكروفون مدمج، وفيديو بدقة 4K HDR، وشاشة تعمل باللمس، وبث فيديو مباشر، وكاميرا ويب', 'sonyzv.png', 4, 1, 875, 0, '2024-07-17 12:30:01', 2),
(11, 'Men\'s Bomber Jacket ', 'سترة بومبر للرجال', 'Men\'s Bomber Jacket Fashion Stylish Lightweight Windbreaker Spring Fall Casual Jackets for Men', 'جاكيت بومبر رجالي أنيق وخفيف الوزن مضاد للرياح لربيع وخريف سترات كاجوال للرجال', 'boomberjacket.png', 4, 1, 120, 5, '2024-07-17 14:21:14', 5),
(12, 'Fleece Pullover', 'بلوفر صوف', 'Men\'s Midweight Fleece Pullover Hoodies Casual Color Block Hooded Sweatshirt with Pockets', 'كنزة صوفية رجالية متوسطة الوزن من الصوف ذات قلنسوة كاجوال ذات ألوان متعددة مع جيوب', 'hoodie.png', 15, 1, 240, 0, '2024-07-17 14:21:14', 5),
(13, 'Men\'s black suit', 'بدلة سوداء رجالي', 'Men\'s Premium Stretch Classic Fit Suit Separates - Pants & Jackets.', 'بدلة رجالية فاخرة قابلة للتمدد بشكل كلاسيكي منفصلة - السراويل والسترات.', 'suit.png', 6, 1, 1100, 0, '2024-07-17 14:26:41', 5),
(14, 'Men\'s blue shirt', 'قميص ازرق رجالي', 'casual Men\'s blue shirt with white lines', 'قميص رجالي كاجوال باللون الأزرق مع خطوط بيضاء', 'blueshirt.png', 4, 1, 200, 0, '2024-07-17 14:26:41', 5),
(17, 'Sony ZX', 'سوني زد اكس', '\r\nSony ZX Series Wired On-Ear Headphones, Black MDR-ZX110t', 'سماعات رأس سلكية من سلسلة سوني ZX، لون أسود MDR-ZX110', 'headphone.png', 7, 1, 70, 7, '2024-07-17 14:32:28', 6),
(18, 'Beats Studio Buds', 'سماعات بيتس لاسلكية', 'True Wireless Noise Cancelling Earbuds - Compatible with Apple & Android, Built-in Microphone, IPX4 rating, Sweat Resistant Earphones, Class 1 Bluetooth Headphones - Black\r\n', 'سماعات أذن لاسلكية حقيقية مانعة للضوضاء - متوافقة مع أجهزة Apple وAndroid، ميكروفون مدمج، تصنيف IPX4، سماعات مقاومة للعرق، سماعات بلوتوث من الفئة 1 - أسود', 'earpods.png', 30, 1, 300, 0, '2024-07-17 14:32:28', 6),
(19, 'Ear Wired Headphones', 'سماعات الأذن السلكية', 'Amazon Basics In Ear Wired Headphones, Earbuds with Microphone No Wireless Technology, 51.18 x 0.79 x 0.51 inches, Black', 'Amazon Basics سماعات رأس سلكية، سماعات أذن مزودة بميكروفون بدون تقنية لاسلكية، 51.18 × 0.79 × 0.51 بوصة، أسود', 'wiredearphone.png', 10, 1, 150, 10, '2024-07-17 14:32:28', 6),
(20, 'laptop Dell Inspiron 15', 'لابتوب ديل انسبايرون 15', 'Dell Inspiron 15 3000 Laptop 2021 Latest Model, 15.6&#34; HD Display, Intel N4020 Dual-Core Processor, 8GB RAM, 128GB SSD, Webcam, HDMI, Bluetooth, Wi-Fi, Black, Windows 10\r\n', 'ديل انسبايرون 15 3000 كمبيوتر محمول 2021 أحدث طراز، 15.6 بوصة؛ شاشة اتش دي، معالج انتل N4020 ثنائي النواة، ذاكرة وصول عشوائي 8 جيجا، 128 جيجا اس اس دي، كاميرا ويب، HDMI، بلوتوث، واي فاي، اسود، ويندوز 10', 'dellinspiron.png', 5, 1, 1700, 0, '2024-07-17 14:41:28', 1),
(21, 'laptop DELL G 15 5530', 'لاب توب ديل G 15 ', 'DELL G15 5530 Gaming Laptop - 13th Intel Core i7-13650HX 14 Cores, NVIDIA GeForce RTX 4050 6GB GDDR6 Graphics, 32GB DDR5-4800 MHz RAM, 1 TB SSD, 15.6\" FHD (1920x1080) 120Hz, Backlit KB, Windows 11\r\n', 'كمبيوتر محمول للألعاب G15 5530 من DELL - الجيل الثالث عشر من Intel Core i7-13650HX 14 نواة، ورسومات NVIDIA GeForce RTX 4050 6GB GDDR6، وذاكرة الوصول العشوائي DDR5-4800 MHz 32 جيجا، و1 تيرابايت SSD، و15.6 بوصة FHD (1920x1080) 120 هرتز، ولوحة مفاتيح بإضاءة ', 'g15.png', 7, 1, 2000, 15, '2024-07-17 14:41:28', 1),
(22, 'laptop Hp Victus ', 'اتش بي فيكتوس', 'laptop Hp Victus 15-fa1045ne Gaming Laptop - 13th Intel i5-13420H 8-Cores, 6GB GDDR6 NVIDIA GeForce RTX 3050 Graphics, 8GB RAM, 512GB SSD, 15.6\" FHD (1920x1080) 144 Hz IPS, Backlit Keyboard - Ceramic White', 'لاب توب Hp Victus 15-fa1045ne للألعاب - الجيل الثالث عشر Intel i5-13420H 8-Cores، 6GB GDDR6 NVIDIA GeForce RTX 3050 Graphics، 8GB RAM، 512GB SSD، 15.6 بوصة FHD (1920x1080) 144 هرتز IPS، لوحة مفاتيح بإضاءة خلفية - أبيض سيراميك', 'victus.png', 4, 1, 2200, 0, '2024-07-17 14:41:28', 1),
(23, 'HP Pavilion Laptop ', 'لابتوب اتش بي بافليون', 'HP Pavilion Gaming Laptop -11th Intel Core i5-11300H, 8GB RAM, 1TB HDD + 256GB SSD, NVIDIA GeForce GTX 1650 4GB GDDR6 Graphics, 15.6\" FHD (1920 x 1080)', 'كمبيوتر محمول HP Pavilion للألعاب - معالج Intel Core i5-11300H الحادي عشر، وذاكرة الوصول العشوائي 8 جيجابايت، و1 تيرابايت HDD + 256 جيجابايت SSD، ورسومات NVIDIA GeForce GTX 1650 4 جيجابايت GDDR6، وشاشة 15.6 بوصة FHD (1920 × 1080)', 'hp_pavillion.png', 10, 1, 1600, 0, '2024-07-17 14:41:28', 1),
(24, 'laptop Lenovo IdeaPad', 'لاب توب لينوفو ايديا باد', 'Lenovo IdeaPad Gaming 3 15ARH7 Laptop - Ryzen 7 7735HS, NVIDIA GeForce RTX 4050 6GB GDDR6 Graphics, 16GB DDR5-4800 RAM, 512GB SSD, 15.6\" FHD (1920x1080) IPS 250nits 120Hz, Backlit Keyboard - Onyx Grey', 'لاب توب لينوفو ايديا باد جيمنج 3 15ARH7 - Ryzen 7 7735HS، رسومات NVIDIA GeForce RTX 4050 6 جيجا GDDR6، ذاكرة الوصول العشوائي 16 جيجا DDR5-4800، 512 جيجا اس اس دي، شاشة 15.6 بوصة FHD (1920x1080) IPS 250nits 120 هرتز، لوحة مفاتيح بإضاءة خلفية - رمادي أونيكس', 'lenovo_ideapad.png', 14, 1, 1000, 20, '2024-07-17 14:41:28', 1),
(25, 'MacBook Air 2020', '2020 أبل ماك بوك اير', '2020 Apple MacBook Air: M1 Chip, 13” Retina Display, 16GB RAM, 256GB SSD, Space Gray', 'Apple MacBook Air 2020: شريحة M1، شاشة Retina مقاس 13 بوصة، ذاكرة وصول عشوائي سعتها 16 جيجابايت، محرك أقراص SSD سعة 256 جيجابايت، رمادي فلكي', 'macbook.png', 9, 1, 2300, 0, '2024-07-17 14:41:28', 1),
(38, 'Toddler Shoes ', 'حذاء طفل صغير', 'Toddler Shoes Boys Girls Kids Cushion Sneakers Tennis Running Size 1-12 Sports Walking Footwear Lightweight Breathable', 'أحذية الأطفال الصغار للأولاد والبنات أحذية رياضية للتنس مقاس 1-12 أحذية رياضية للمشي خفيفة الوزن ومسامية', 'kids_shoe.png', 4, 1, 100, 0, '2024-07-17 14:49:13', 4),
(39, 'Little Kid Sneakers ', 'حذاء رياضي للاطفال', 'Little_Kid/ Big Boys Sneakers Lightweight Casual Tennis Shoes Kids Athletic Basketball Running Walking Shoes', 'أحذية رياضية Little_Kid/ Big Boys خفيفة الوزن كاجوال للتنس أحذية رياضية للأطفال للجري وكرة السلة', 'littleshoe.png', 7, 1, 90, 0, '2024-07-17 14:49:13', 4),
(40, 'Casual Sneakers', 'حذاء كاجوال رجالي ', 'Bruno Marc Men\'s KnitFlex Craft Mesh Oxfords Sneakers Casual Dress Lace-Up Lightweight Walking Shoes', 'أحذية Bruno Marc الرجالية من KnitFlex Craft Mesh Oxfords أحذية رياضية كاجوال برباط وخفيفة الوزن للمشي', 'casualshoe.png', 8, 1, 160, 5, '2024-07-17 14:49:13', 4),
(41, 'Apple iPhone 12', 'ابل ايفون 12', 'Apple iPhone 12 with FaceTime (128GB) - احمر', 'أبل آيفون 12 مع فيس تايم (128 جيجابايت) - احمر', 'iphone12.png', 3, 1, 750, 0, '2024-07-17 15:01:09', 3),
(42, 'Iphone 14 pro', 'ايفون 14 برو', 'Apple iPhone 14 Pro Max - 128 GB - Black (Unlocked) (Dual SIM) less used\r\nApple iPhone 14 Pro Max - 128GB 256GB 512GB 1TB - All Colors - Good Condition', 'Apple iPhone 14 Pro Max - 128 جيجابايت - أسود (مفتوح) (شريحتين) أقل استخدامًا\r\nApple iPhone 14 Pro Max - 128 جيجا، 256 جيجا، 512 جيجا، 1 تيرابايت - جميع الألوان - بحالة جيدة', 'iphone14.png', 7, 1, 999, 10, '2024-07-17 15:01:09', 3),
(43, 'iPhone 15 Pro Max ', 'آيفون 15 برو ماكس', 'iPhone 15 Pro Max 256GB black 5G With FaceTime - Middle East Version', 'آيفون 15 برو ماكس، بسعة 256 جيجابايت، باللون الأسود، يدعم تقنية 5G مع تطبيق FaceTime - إصدار الشرق الأوسط', 'iphone15promax.png', 9, 1, 1500, 12, '2024-07-17 15:01:09', 3),
(44, 'Xiaomi Poco x5', 'شاومي بوكو اكس 5', 'Xiaomi POCO X6 5G (Blue 12GB RAM, 256GB ROM) - Vivid 120Hz AMOLED 1.5K display | 64MP large camera', 'Xiaomi POCO X6 5G (ذاكرة وصول عشوائي زرقاء سعة 12 جيجابايت وذاكرة قراءة فقط 256 جيجابايت) - شاشة AMOLED 1.5K مفعمة بالحيوية وسرعة 120 هرتز | كاميرا كبيرة بدقة 64 ميجابكسل', 'pocox5.png', 15, 1, 799, 0, '2024-07-17 15:01:09', 3),
(45, 'Galaxy S24 Ultra', 'جالكسي اس 24 الترا', 'SAMSUNG Galaxy S24 Ultra, AI Android Smartphone, 512GB Storage, 12GB RAM, 200MP Camera, S Pen, Long Battery Life, Titanium Black - 1 year Local Warranty', 'SAMSUNG Galaxy S24 Ultra، هاتف ذكي يعمل بنظام Android AI، سعة تخزين 512 جيجابايت، ذاكرة وصول عشوائي 12 جيجابايت، كاميرا 200 ميجابكسل، قلم S، عمر بطارية طويل، أسود تيتانيوم - ضمان محلي لمدة عام', 's24.png', 15, 1, 1400, 10, '2024-07-17 15:01:09', 3),
(46, 'Samsung Galaxy S23', 'جالاكسي اس 23', 'Samsung Galaxy S23 FE 5G Dual SIM Android Smartphone, 8GB RAM, 256GB', 'هاتف سامسونج جالاكسي S23 FE 5G ثنائي الشريحة يعمل بنظام أندرويد، ذاكرة وصول عشوائي 8 جيجابايت، 256 جيجابايت', 's23.png', 7, 1, 830, 0, '2024-07-17 15:01:09', 3),
(47, 'Men\'s sport shoe', 'حذاء رياضي للرجال', 'Men\'s sport shoe with black color', 'حذاء رياضي للرجال باللون الاسود', 'menshoe.png', 10, 1, 130, 0, '2024-07-18 19:26:52', 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemstopselling`
-- (See below for the actual view)
--
CREATE TABLE `itemstopselling` (
`countitems` bigint(21)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` int(11)
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`items_price_discount` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemsview`
-- (See below for the actual view)
--
CREATE TABLE `itemsview` (
`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` int(11)
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`categories_id` int(11)
,`categories_name` varchar(100)
,`categories_name_ar` varchar(100)
,`categories_datetime` timestamp
,`items_price_discount` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myfavorite`
-- (See below for the actual view)
--
CREATE TABLE `myfavorite` (
`favorite_id` int(11)
,`favorite_usersid` int(11)
,`favorite_itemsid` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` int(11)
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`users_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `orders_usersid` int(11) NOT NULL,
  `orders_address` int(11) NOT NULL,
  `orders_pricedelivery` int(11) NOT NULL,
  `orders_price` int(11) NOT NULL,
  `orders_totalprice` int(11) NOT NULL,
  `orders_status` tinyint(4) NOT NULL COMMENT '0=> pending , 1=> on the way , 2=> delivered  ',
  `orders_coupon` int(11) NOT NULL DEFAULT 0,
  `orders_paymentmethod` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => cash ; 1=> payment card',
  `orders_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `orders_usersid`, `orders_address`, `orders_pricedelivery`, `orders_price`, `orders_totalprice`, `orders_status`, `orders_coupon`, `orders_paymentmethod`, `orders_datetime`) VALUES
(107, 111, 29, 55, 608, 663, 0, 0, 0, '2024-07-18 16:14:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersdetailsview`
-- (See below for the actual view)
--
CREATE TABLE `ordersdetailsview` (
`itemsprice` decimal(42,4)
,`countitems` bigint(21)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` int(11)
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersview`
-- (See below for the actual view)
--
CREATE TABLE `ordersview` (
`orders_id` int(11)
,`orders_usersid` int(11)
,`orders_address` int(11)
,`orders_pricedelivery` int(11)
,`orders_price` int(11)
,`orders_totalprice` int(11)
,`orders_status` tinyint(4)
,`orders_coupon` int(11)
,`orders_paymentmethod` tinyint(4)
,`orders_datetime` timestamp
,`address_id` int(11)
,`address_usersid` int(11)
,`address_name` varchar(255)
,`address_city` varchar(255)
,`address_street` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_name` varchar(100) NOT NULL,
  `users_password` varchar(100) NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_phone` int(100) NOT NULL,
  `users_verifycode` int(11) NOT NULL,
  `users_approve` tinyint(4) NOT NULL DEFAULT 0,
  `users_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_name`, `users_password`, `users_email`, `users_phone`, `users_verifycode`, `users_approve`, `users_create`) VALUES
(111, 'Karim', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'karimmagdi1236@gmail.com', 1279690337, 66340, 0, '2024-07-17 17:56:39');

-- --------------------------------------------------------

--
-- Structure for view `cartview`
--
DROP TABLE IF EXISTS `cartview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cartview`  AS SELECT sum(cast(`items`.`items_price` - `items`.`items_price` * `items`.`items_discount` / 100 as signed)) AS `itemsprice`, count(`cart`.`cart_itemsid`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_itemsid`)) WHERE `cart`.`cart_orders` = 0 GROUP BY `cart`.`cart_itemsid`, `cart`.`cart_usersid`, `cart`.`cart_orders` ;

-- --------------------------------------------------------

--
-- Structure for view `itemstopselling`
--
DROP TABLE IF EXISTS `itemstopselling`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemstopselling`  AS SELECT count(`cart`.`cart_id`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, cast(`items`.`items_price` - `items`.`items_price` * (`items`.`items_discount` / 100) as signed) AS `items_price_discount` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_itemsid`)) WHERE `cart`.`cart_orders` <> 0 GROUP BY `cart`.`cart_itemsid` ;

-- --------------------------------------------------------

--
-- Structure for view `itemsview`
--
DROP TABLE IF EXISTS `itemsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemsview`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `categories`.`categories_id` AS `categories_id`, `categories`.`categories_name` AS `categories_name`, `categories`.`categories_name_ar` AS `categories_name_ar`, `categories`.`categories_datetime` AS `categories_datetime`, cast(`items`.`items_price` - `items`.`items_price` * (`items`.`items_discount` / 100) as signed) AS `items_price_discount` FROM (`items` join `categories` on(`items`.`items_cat` = `categories`.`categories_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `myfavorite`
--
DROP TABLE IF EXISTS `myfavorite`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myfavorite`  AS SELECT `favorite`.`favorite_id` AS `favorite_id`, `favorite`.`favorite_usersid` AS `favorite_usersid`, `favorite`.`favorite_itemsid` AS `favorite_itemsid`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `users`.`users_id` AS `users_id` FROM ((`favorite` join `users` on(`users`.`users_id` = `favorite`.`favorite_usersid`)) join `items` on(`items`.`items_id` = `favorite`.`favorite_itemsid`)) ;

-- --------------------------------------------------------

--
-- Structure for view `ordersdetailsview`
--
DROP TABLE IF EXISTS `ordersdetailsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersdetailsview`  AS SELECT sum(`items`.`items_price` - `items`.`items_price` * `items`.`items_discount` / 100) AS `itemsprice`, count(`cart`.`cart_itemsid`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_itemsid`)) WHERE `cart`.`cart_orders` <> 0 GROUP BY `cart`.`cart_itemsid`, `cart`.`cart_usersid`, `cart`.`cart_orders` ;

-- --------------------------------------------------------

--
-- Structure for view `ordersview`
--
DROP TABLE IF EXISTS `ordersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersview`  AS SELECT `orders`.`orders_id` AS `orders_id`, `orders`.`orders_usersid` AS `orders_usersid`, `orders`.`orders_address` AS `orders_address`, `orders`.`orders_pricedelivery` AS `orders_pricedelivery`, `orders`.`orders_price` AS `orders_price`, `orders`.`orders_totalprice` AS `orders_totalprice`, `orders`.`orders_status` AS `orders_status`, `orders`.`orders_coupon` AS `orders_coupon`, `orders`.`orders_paymentmethod` AS `orders_paymentmethod`, `orders`.`orders_datetime` AS `orders_datetime`, `address`.`address_id` AS `address_id`, `address`.`address_usersid` AS `address_usersid`, `address`.`address_name` AS `address_name`, `address`.`address_city` AS `address_city`, `address`.`address_street` AS `address_street` FROM (`orders` join `address` on(`address`.`address_id` = `orders`.`orders_address`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_ibfk_1` (`address_usersid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_itemsid` (`cart_itemsid`),
  ADD KEY `cart_usersid` (`cart_usersid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `coupon_name` (`coupon_name`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_usersid` (`favorite_usersid`),
  ADD KEY `favorite_itemsid` (`favorite_itemsid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`),
  ADD KEY `items_cat` (`items_cat`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`),
  ADD UNIQUE KEY `user_email` (`users_email`),
  ADD UNIQUE KEY `user_phone` (`users_phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=465;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_itemsid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`favorite_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`items_cat`) REFERENCES `categories` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
