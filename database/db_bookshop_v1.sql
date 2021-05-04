-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 04, 2021 at 02:09 PM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Book_shop_md5`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_death` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` bigint UNSIGNED NOT NULL DEFAULT '0',
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_wiki` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `birth_death`, `quantity`, `country`, `link_wiki`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Victor Hugo', '1802-1885', 0, 'France', 'https://en.wikipedia.org/wiki/Victor_Hugo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Victor_Hugo_by_%C3%89tienne_Carjat_1876_-_full.jpg/220px-Victor_Hugo_by_%C3%89tienne_Carjat_1876_-_full.jpg', '2021-05-01 20:05:52', '2021-05-01 20:05:52'),
(2, 'Emily Bronte', '1818-1848', 0, 'England', 'https://en.wikipedia.org/wiki/Emily_Bront%C3%AB', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Emily_Bront%C3%AB_by_Patrick_Branwell_Bront%C3%AB_restored.jpg/220px-Emily_Bront%C3%AB_by_Patrick_Branwell_Bront%C3%AB_restored.jpg', '2021-05-01 20:05:52', '2021-05-01 20:05:52'),
(3, 'Margaret Mitchell', '1900-1949', 0, 'U.S', 'https://en.wikipedia.org/wiki/Margaret_Mitchell', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Margaret_Mitchell_NYWTS.jpg/220px-Margaret_Mitchell_NYWTS.jpg   ', '2021-05-01 20:05:52', '2021-05-01 20:05:52'),
(4, 'Thạch Lam', '1910-1942', 0, 'Vietnam', 'https://vi.wikipedia.org/wiki/Th%E1%BA%A1ch_Lam', 'https://vanhocsaigon.com/wp-content/uploads/2020/07/Thach-Lam-VHSAIGON.jpg', '2021-05-01 20:05:52', '2021-05-01 20:05:52'),
(5, 'Ngô Tất Tố', '1894-1954', 0, 'Vietnam', 'https://vi.wikipedia.org/wiki/Ng%C3%B4_T%E1%BA%A5t_T%E1%BB%91', 'https://upload.wikimedia.org/wikipedia/vi/thumb/9/92/NgoTatTo.jpg/175px-NgoTatTo.jpg', '2021-05-01 20:05:52', '2021-05-01 20:05:52');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint UNSIGNED NOT NULL,
  `isbn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `author_id` bigint UNSIGNED NOT NULL,
  `publisher_id` bigint UNSIGNED NOT NULL,
  `reprint_of_book` int NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_of_publication` date DEFAULT NULL,
  `license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` bigint UNSIGNED NOT NULL DEFAULT '0',
  `recommend` int NOT NULL DEFAULT '0',
  `best_seller` int NOT NULL DEFAULT '0',
  `stock` bigint UNSIGNED NOT NULL DEFAULT '1',
  `page_number` bigint UNSIGNED DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `isbn`, `name`, `price`, `category_id`, `author_id`, `publisher_id`, `reprint_of_book`, `description`, `content`, `year_of_publication`, `license`, `image`, `view`, `recommend`, `best_seller`, `stock`, `page_number`, `language`, `created_at`, `updated_at`) VALUES
(1, '9786049973109', 'Những người khốn khổ', 200000, 1, 1, 1, 9, 'Những Người Khốn Khổ (Trọn Bộ 5 Tập) \"Khi pháp luật và phong hóa còn đày đọa con người, còn dựng nên những địa ngục giữa xã hội văn minh và đem một thứ định mệnh nhân tạo chồng thêm lên thiên mệnh; khi ba vấn đề lớn của thời đại là sự sa đọa của đàn ông vì bán sức lao động, sự trụy lạc của đàn bà vì đói khát, sự cằn cỗi của trẻ nhỏ vì tối tăm, chưa được giải quyết; khi ở một số nơi đời sống còn ngạt thở; nói khác đi, và trên quan điểm rộng hơn, khi trên mặt đất, dốt nát và đói khổ còn tồn tại, thì những cuốn sách như loại này còn có thể có ích.” (Hauteville House, ngày 1-1-1862- Victor Hugo)', 'Những Người Khốn Khổ (Trọn Bộ 5 Tập) \"Khi pháp luật và phong hóa còn đày đọa con người, còn dựng nên những địa ngục giữa xã hội văn minh và đem một thứ định mệnh nhân tạo chồng thêm lên thiên mệnh; khi ba vấn đề lớn của thời đại là sự sa đọa của đàn ông vì bán sức lao động, sự trụy lạc của đàn bà vì đói khát, sự cằn cỗi của trẻ nhỏ vì tối tăm, chưa được giải quyết; khi ở một số nơi đời sống còn ngạt thở; nói khác đi, và trên quan điểm rộng hơn, khi trên mặt đất, dốt nát và đói khổ còn tồn tại, thì những cuốn sách như loại này còn có thể có ích.” (Hauteville House, ngày 1-1-1862- Victor Hugo)', '2015-10-01', 'Fuy7f1NVwG', 'http://thuvien.nctu.edu.vn:8000/cgi-bin/koha/opac-image.pl?thumbnail=1&biblionumber=3736', 0, 0, 1, 1, 1472, 'Tiếng việt', '2021-05-01 20:42:16', '2021-05-01 20:42:16'),
(2, '8935236422734', 'HOÀNG LÊ NHẤT THỐNG CHÍ', 77000, 1, 5, 2, 9, 'HOÀNG LÊ NHẤT THỐNG CHÍ là tác phẩm tiêu biểu nhất, có giá trị nhất trong bộ sách của “Ngô gia văn phái” trên cả hai phương diện sử học và văn học.\nBản dịch HOÀNG LÊ NHẤT THỐNG CHÍ ra chữ quốc ngữ của Ngô Tất Tố là một trong số những bản dịch đầu tiên được thực hiện sớm từ nửa đầu thế kỷ 20.\nNhà Hán học, nhà văn, nhà sử học Ngô Tất Tố đã công phu tra cứu, xác định nguyên tác, trung thành dịch và chủ tâm mong muốn tăng thêm giá trị lịch sử khi dịch HOÀNG LÊ NHẤT THỐNG CHÍ.', 'HOÀNG LÊ NHẤT THỐNG CHÍ là tác phẩm tiêu biểu nhất, có giá trị nhất trong bộ sách của “Ngô gia văn phái” trên cả hai phương diện sử học và văn học.\nBản dịch HOÀNG LÊ NHẤT THỐNG CHÍ ra chữ quốc ngữ của Ngô Tất Tố là một trong số những bản dịch đầu tiên được thực hiện sớm từ nửa đầu thế kỷ 20.\nNhà Hán học, nhà văn, nhà sử học Ngô Tất Tố đã công phu tra cứu, xác định nguyên tác, trung thành dịch và chủ tâm mong muốn tăng thêm giá trị lịch sử khi dịch HOÀNG LÊ NHẤT THỐNG CHÍ.', '2021-04-01', '247z80qgwR', 'http://minhkhai.vn/hinhlon/8935236422734.JPG', 0, 0, 1, 1, 503, 'Tiếng việt', '2021-05-01 20:42:16', '2021-05-01 20:42:16'),
(3, '8935236414975', 'Cuốn theo chiều gió', 920000, 1, 3, 3, 11, 'Vào năm thứ ba mươi sáu của thế kỷ XX, một sự kiện được ghi lại trong lịch sử văn học hiện đại nước Mỹ. Đó là sự ra đời của một tác phẩm văn học chẳng những mau chóng thu phục được tấm lòng người dân Mỹ mà còn cả trái tim của hàng triệu người trên khắp các lục địa. Tác phẩm ấy mang tên CUỐN THEO CHIỀU GIÓ (GONE WITH THE WIND).', 'Chỉ ba tuần sau khi được xuất bản CUỐN THEO CHIỀU GIÓ đã thu hút ngay sự chú ý của hơn mười bảy vạn độc giả. Và liền năm sau 1937, nó được tặng giải thưởng Pulitzer, một giải thưởng được nhiều nhà văn ao ước. Đến tháng Mười hai cây Sồi năm 1938 hơn một triệu bảy bản đã được ấn hành tại nước Mỹ. Sau đó đúng một năm khi bộ phim dựa theo cuốn tiểu thuyết này lần đầu tiên ra mắt khán giả Mỹ, hơn hai triệu bản CUỐN THEO CHIỀU GIÓ  đã được in và dịch ra mười sáu thứ tiếng khác nhau trên thế giới. Tính đến năm 1962 thì lên tới hơn mười triệu bản và cuốn sách được dịch ra hơn ba chục thứ tiếng và đã được chuyển thể thành sách cho người mù đọc.\nỞ Việt Nam, CUỐN THEO CHIỀU GIÓ được chia thành hai tập, được nhiều người dịch và được xuất bản nhiều lần.', '2019-03-01', 'djBjQ7NgVm', 'http://minhkhai.vn/hinhlon/8935236414975.jpg', 0, 0, 1, 1, 920, 'Tiếng việt', '2021-05-01 20:42:16', '2021-05-01 20:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` bigint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'Kinh điển', 0, '2021-05-01 19:45:45', '2021-05-01 19:45:45'),
(2, 'Truyện ngắn', 0, '2021-05-01 19:45:45', '2021-05-01 19:45:45'),
(3, 'Tiểu thuyết', 0, '2021-05-01 19:45:45', '2021-05-01 19:45:45'),
(4, 'Nấu ăn', 0, '2021-05-01 19:45:45', '2021-05-01 19:45:45'),
(5, 'Kỹ năng sống', 0, '2021-05-01 19:45:45', '2021-05-01 19:45:45'),
(6, 'ngon tinh', 0, '2021-05-03 01:24:19', '2021-05-03 01:24:19'),
(8, 'trinh tham', 0, '2021-05-03 08:18:31', '2021-05-03 08:18:31'),
(9, 'Sach giao khoa', 0, '2021-05-03 08:20:04', '2021-05-03 08:20:04'),
(10, 'Phat giao', 0, '2021-05-03 08:25:19', '2021-05-03 08:25:19'),
(11, 'vat ly', 0, '2021-05-03 08:27:06', '2021-05-03 08:27:06'),
(20, 'kinh di', 0, '2021-05-03 21:18:12', '2021-05-03 21:18:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_02_012559_create_authors_table', 1),
(5, '2021_05_02_012623_create_categories_table', 1),
(6, '2021_05_02_012640_create_books_table', 1),
(7, '2021_05_02_021116_create_publishers_table', 2),
(8, '2021_05_02_021206_add_fk_books_table', 3),
(10, '2021_05_02_032816_add_column_price_books_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'NXB kim đồng', '2021-05-01 19:41:40', '2021-05-01 19:41:40'),
(2, 'NXB giáo dục', '2021-05-01 19:41:40', '2021-05-01 19:41:40'),
(3, 'NXB thời đại', '2021-05-01 19:41:40', '2021-05-01 19:41:40'),
(4, 'NXB khoa học và kỹ thuật', '2021-05-01 19:41:40', '2021-05-01 19:41:40'),
(5, 'NXB Kim Đồng', '2021-05-01 19:41:40', '2021-05-01 19:41:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$ZCJU6urnXFaAeGlHu3TSEOteR4A5Z6jnl0J.yL2ePbc4kZXmHeurC', NULL, '2021-05-01 19:21:43', '2021-05-01 19:21:43'),
(2, 'editor', 'editor@gmail.com', NULL, '$2y$10$mvdANMgfirC1bg50VUR.VOaLGtIElPeynvjvQiHiQAaWGBDh5.BVC', NULL, '2021-05-01 19:21:44', '2021-05-01 19:21:44'),
(3, 'guest', 'guest@gmail.com', NULL, '$2y$10$8LRe8HvsQWbPKdCH8Vcr3.8tV6JN7FVAMC80guLgv72ylYuId268i', NULL, '2021-05-01 19:21:44', '2021-05-01 19:21:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `books_category_id_foreign` (`category_id`),
  ADD KEY `books_author_id_foreign` (`author_id`),
  ADD KEY `books_publisher_id_foreign` (`publisher_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  ADD CONSTRAINT `books_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `books_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
