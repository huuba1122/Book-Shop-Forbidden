-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 13, 2021 lúc 08:52 PM
-- Phiên bản máy phục vụ: 8.0.23-0ubuntu0.20.04.1
-- Phiên bản PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `du_an`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authors`
--

CREATE TABLE `authors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` bigint UNSIGNED NOT NULL DEFAULT '0',
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_wiki` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `birth_of_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `death_of_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `authors`
--

INSERT INTO `authors` (`id`, `name`, `quantity`, `country`, `link_wiki`, `image`, `created_at`, `updated_at`, `birth_of_year`, `death_of_year`) VALUES
(1, 'Đang cập nhập', 0, 'Chưa có', 'Chưa có', 'author-images/HWMemtsEuNHc4jyLW9W8FAgxDdY2Yg3inWBZ3kK5.jpg', '2021-05-02 07:45:43', '2021-05-07 03:17:02', NULL, NULL),
(2, 'Emily Bronte', 4000, 'England', 'https://en.wikipedia.org/wiki/Emily_Bront%C3%AB', 'author-images/jiHgdhosfvJTTTuDPBAdMzAOEMyQqpS2NHdKg9By.jpg', '2021-05-02 07:45:43', '2021-05-12 18:54:48', '1925', '1971'),
(3, 'Margaret Mitchell', 33100, 'U.S', 'https://en.wikipedia.org/wiki/Margaret_Mitchell', 'author-images/46RbYW5guNN7XzviZ0kpLqA5ABXy86CbFANGw9bv.jpg', '2021-05-02 07:45:43', '2021-05-12 18:55:55', '1919', '2001'),
(4, 'Thạch Lam', 7223, 'Vietnam', 'https://vi.wikipedia.org/wiki/Th%E1%BA%A1ch_Lam', 'author-images/ND2dsbiMfW1OLtwOWft3MUP1zlGDjV8nBlkfXTu6.jpg', '2021-05-02 07:45:44', '2021-05-12 18:40:45', '1920', '1978'),
(5, 'Anh Khang', 4999, 'Vietnam', 'https://vi.wikipedia.org/wiki/Ng%C3%B4_T%E1%BA%A5t_T%E1%BB%91', 'author-images/rV4gbi7AbCzdQTCfaCbE5AfubGT8SnaFuNKl7WvY.jpg', '2021-05-02 07:45:44', '2021-05-12 20:19:56', '1921', '1967'),
(7, 'Fujiko Amnimo', 6002, 'Lao', 'https://vi.wikipedia.org/wiki/Nam_Cao', 'author-images/SOFwkRWbB71pwNfYnb80D1nkD9TxVvPqWcErOnSK.jpg', '2021-05-06 07:45:55', '2021-05-12 20:19:47', '1953', '1991'),
(8, 'Đỗ Nhật Nam', 8000, 'Việt Nam', 'https://vi.wikipedia.org/wiki/T%C3%B4_Ho%C3%A0i', 'author-images/Qs7VRqVsL7uvtJxnNBAzquRaKdXX4Zw1KCRts2UC.jpg', '2021-05-06 18:27:18', '2021-05-12 18:38:55', '1923', '2011'),
(12, 'Nguyễn Nhật Ánh', 0, 'Việt Nam', 'https://vi.wikipedia.org/wiki/Nguy%E1%BB%85n_Nh%E1%BA%ADt_%C3%81nh', 'author-images/K1aPIuD1iSOPIKjK9XsYc45C8kWpTD5wl3ctm0zV.jpg', '2021-05-12 08:12:09', '2021-05-12 20:19:47', '1955', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `books`
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
-- Đang đổ dữ liệu cho bảng `books`
--

INSERT INTO `books` (`id`, `isbn`, `name`, `price`, `category_id`, `author_id`, `publisher_id`, `reprint_of_book`, `description`, `content`, `year_of_publication`, `license`, `image`, `view`, `recommend`, `best_seller`, `stock`, `page_number`, `language`, `created_at`, `updated_at`) VALUES
(2, '9786049973109', 'Những người khốn khổ', 200000, 1, 1, 1, 9, 'Những Người Khốn Khổ (Trọn Bộ 5 Tập) \"Khi pháp luật và phong hóa còn đày đọa con người, còn dựng nên những địa ngục giữa xã hội văn minh và đem một thứ định mệnh nhân tạo chồng thêm lên thiên mệnh; khi ba vấn đề lớn của thời đại là sự sa đọa của đàn ông vì bán sức lao động, sự trụy lạc của đàn bà vì đói khát, sự cằn cỗi của trẻ nhỏ vì tối tăm, chưa được giải quyết; khi ở một số nơi đời sống còn ngạt thở; nói khác đi, và trên quan điểm rộng hơn, khi trên mặt đất, dốt nát và đói khổ còn tồn tại, thì những cuốn sách như loại này còn có thể có ích.” (Hauteville House, ngày 1-1-1862- Victor Hugo)', 'Những Người Khốn Khổ (Trọn Bộ 5 Tập) \"Khi pháp luật và phong hóa còn đày đọa con người, còn dựng nên những địa ngục giữa xã hội văn minh và đem một thứ định mệnh nhân tạo chồng thêm lên thiên mệnh; khi ba vấn đề lớn của thời đại là sự sa đọa của đàn ông vì bán sức lao động, sự trụy lạc của đàn bà vì đói khát, sự cằn cỗi của trẻ nhỏ vì tối tăm, chưa được giải quyết; khi ở một số nơi đời sống còn ngạt thở; nói khác đi, và trên quan điểm rộng hơn, khi trên mặt đất, dốt nát và đói khổ còn tồn tại, thì những cuốn sách như loại này còn có thể có ích.” (Hauteville House, ngày 1-1-1862- Victor Hugo)', '2015-10-01', 'fBMPQML6Qe', 'book-images/C7rHZssKNGe2ZkAJvVhbViD4jRORRKLAkBKYuPi7.jpg', 0, 0, 1, 1, 1472, 'Tiếng việt', '2021-05-02 07:46:00', '2021-05-09 20:40:42'),
(3, '8935236422734', 'Hoàng Lê Nhất Thống Chí', 77000, 1, 5, 2, 9, 'HOÀNG LÊ NHẤT THỐNG CHÍ là tác phẩm tiêu biểu nhất, có giá trị nhất trong bộ sách của “Ngô gia văn phái” trên cả hai phương diện sử học và văn học.\nBản dịch HOÀNG LÊ NHẤT THỐNG CHÍ ra chữ quốc ngữ của Ngô Tất Tố là một trong số những bản dịch đầu tiên được thực hiện sớm từ nửa đầu thế kỷ 20.\nNhà Hán học, nhà văn, nhà sử học Ngô Tất Tố đã công phu tra cứu, xác định nguyên tác, trung thành dịch và chủ tâm mong muốn tăng thêm giá trị lịch sử khi dịch HOÀNG LÊ NHẤT THỐNG CHÍ.', 'HOÀNG LÊ NHẤT THỐNG CHÍ là tác phẩm tiêu biểu nhất, có giá trị nhất trong bộ sách của “Ngô gia văn phái” trên cả hai phương diện sử học và văn học.\nBản dịch HOÀNG LÊ NHẤT THỐNG CHÍ ra chữ quốc ngữ của Ngô Tất Tố là một trong số những bản dịch đầu tiên được thực hiện sớm từ nửa đầu thế kỷ 20.\nNhà Hán học, nhà văn, nhà sử học Ngô Tất Tố đã công phu tra cứu, xác định nguyên tác, trung thành dịch và chủ tâm mong muốn tăng thêm giá trị lịch sử khi dịch HOÀNG LÊ NHẤT THỐNG CHÍ.', '2021-04-01', '7Zu0W70DoR', 'book-images/Kk25eI7DQBu4jElgVzjnH02tWdXrJcb8QLwMvqNj.jpg', 0, 0, 1, 1, 503, 'Tiếng việt', '2021-05-02 07:46:00', '2021-05-09 21:01:31'),
(4, '8935236414975', 'Cuốn theo chiều gió', 920000, 1, 3, 3, 11, 'Vào năm thứ ba mươi sáu của thế kỷ XX, một sự kiện được ghi lại trong lịch sử văn học hiện đại nước Mỹ. Đó là sự ra đời của một tác phẩm văn học chẳng những mau chóng thu phục được tấm lòng người dân Mỹ mà còn cả trái tim của hàng triệu người trên khắp các lục địa. Tác phẩm ấy mang tên CUỐN THEO CHIỀU GIÓ (GONE WITH THE WIND).', 'Chỉ ba tuần sau khi được xuất bản CUỐN THEO CHIỀU GIÓ đã thu hút ngay sự chú ý của hơn mười bảy vạn độc giả. Và liền năm sau 1937, nó được tặng giải thưởng Pulitzer, một giải thưởng được nhiều nhà văn ao ước. Đến tháng Mười hai cây Sồi năm 1938 hơn một triệu bảy bản đã được ấn hành tại nước Mỹ. Sau đó đúng một năm khi bộ phim dựa theo cuốn tiểu thuyết này lần đầu tiên ra mắt khán giả Mỹ, hơn hai triệu bản CUỐN THEO CHIỀU GIÓ  đã được in và dịch ra mười sáu thứ tiếng khác nhau trên thế giới. Tính đến năm 1962 thì lên tới hơn mười triệu bản và cuốn sách được dịch ra hơn ba chục thứ tiếng và đã được chuyển thể thành sách cho người mù đọc.\nỞ Việt Nam, CUỐN THEO CHIỀU GIÓ được chia thành hai tập, được nhiều người dịch và được xuất bản nhiều lần.', '2019-03-01', 'a2UzaHMdpg', 'book-images/LXlRpiX4DbGKy1A1POxde73m80SRh7wp3NouV8hf.jpg', 0, 0, 1, 1, 920, 'Tiếng việt', '2021-05-02 07:46:00', '2021-05-09 20:40:20'),
(16, '1-197-19341-1', 'Truyện Kiều', 1232, 1, 4, 2, 2, 'Sách mang đậm tính hiện thưực', 'Truyện kể về cuộc đời oan trái của người con gái', '2021-04-30', '28ensdasd', 'book-images/2XKuDQ354gFzJaxxrfbpQ3YTTVyzwPlyaggkWJwW.jpg', 1, 0, 1, 1, 212, 'Tiếng Việt', '2021-05-08 08:45:51', '2021-05-12 08:04:37'),
(17, '1-445-63320-6', 'Những ngày thơ ấu', 2000, 3, 7, 2, 2, 'Những ngày thơ ấu là một tập hồi ký viết về tuổi thơ đầy cay đắng và khắc nghiệt của chính tác giả, nhà văn Nguyên Hồng. Hồi ký được đăng trên báo năm 1938, xuất bản thành sách vào năm 1940', 'Những ngày thơ ấu là một tập hồi ký viết về tuổi thơ đầy cay đắng và khắc nghiệt của chính tác giả, nhà văn Nguyên Hồng. Hồi ký được đăng trên báo năm 1938, xuất bản thành sách vào năm 1940', '2021-05-29', 'add33dfhsd', 'book-images/KVGJCAeiWIAzft4EScnKI1MbHDpSSZioCQPt0VRy.jpg', 2, 0, 1, 2, 123, 'Tiêng Việt', '2021-05-08 20:18:50', '2021-05-12 21:36:54'),
(18, '0-972-72218-5', 'Đạo làm chồng đảm', 300000, 4, 3, 1, 2, 'Lúc đang mải chợ búa, bỗng Tatsu bị một chú mèo trộm mất đồ.\nKhi đuổi theo đòi lại thì anh vô tình\nĐẮC TỘI VỚI MỘT BĂNG ĐẢNG XÃ HỘI ĐEN!!\nChuyện về chàng cựu Yakuza yêu bếp nay đã phát hành tập 4! Quý vị độc giả tuyệt đối đừng bỏ lỡ nha!', 'Lúc đang mải chợ búa, bỗng Tatsu bị một chú mèo trộm mất đồ.\nKhi đuổi theo đòi lại thì anh vô tình\nĐẮC TỘI VỚI MỘT BĂNG ĐẢNG XÃ HỘI ĐEN!!\nChuyện về chàng cựu Yakuza yêu bếp nay đã phát hành tập 4! Quý vị độc giả tuyệt đối đừng bỏ lỡ nha!', '2021-05-20', '5212214140004', 'book-images/stjUyog9VLcGInRSocu1of8zTjHpz3GfMSnKYD4E.jpg', 2, 1, 0, 100, 160, 'Tiếng Việt', '2021-05-09 19:09:24', '2021-05-12 23:52:31'),
(19, '1-953-48248-6', 'Doramon Vương quốc trên mây', 50000, 10, 2, 2, 10, 'Các em có cho rằng thiên đường tồn tại hay không? Câu chuyện lần này của tôi kể về một thế giới trên mây có người trời sinh sống. Nơi ấy là một vương quốc trong mơ có nền văn minh tiến bộ, thiên nhiên tươi đẹp, nhưng không chỉ đơn giản như thế…\nChúng ta hãy cùng dõi theo chuyến phiêu lưu kì lạ của nhóm bạn Nobita nhé!', 'Các em có cho rằng thiên đường tồn tại hay không? Câu chuyện lần này của tôi kể về một thế giới trên mây có người trời sinh sống. Nơi ấy là một vương quốc trong mơ có nền văn minh tiến bộ, thiên nhiên tươi đẹp, nhưng không chỉ đơn giản như thế…\nChúng ta hãy cùng dõi theo chuyến phiêu lưu kì lạ của nhóm bạn Nobita nhé!', '2021-05-27', '6212204350012', 'book-images/2fTRzXGWA7pR313UdCuYJFNtfzS5AftgaLPDagnC.jpg', 2, 0, 1, 1000, 192, 'Tiếng Việt', '2021-05-09 19:12:10', '2021-05-12 20:12:51'),
(20, '0-242-96120-7', 'Thanh gươm diệt quỷ', 50000, 9, 5, 3, 2, 'Tiếp nối thành công của THANH GƯƠM DIỆT QUỶ Bản đặc biệt Tập 20 và 21, NXB Kim Đồng tiếp tục gửi đến các Fan của bộ truyện Bản đặc biệt tập 22, với những phụ kiện theo kèm “rủng rỉnh” hơn rất nhiều so với 2 cuốn trước!!', 'Tiếp nối thành công của THANH GƯƠM DIỆT QUỶ Bản đặc biệt Tập 20 và 21, NXB Kim Đồng tiếp tục gửi đến các Fan của bộ truyện Bản đặc biệt tập 22, với những phụ kiện theo kèm “rủng rỉnh” hơn rất nhiều so với 2 cuốn trước!!', '2021-05-14', '  5212213630122', 'book-images/mDSCfjzV4PTveFFKLQKCY1rx7ti3tg4uzmCvdBvc.jpg', 14, 1, 0, 3000, 200, 'Tiếng Việt', '2021-05-09 19:15:09', '2021-05-13 00:00:24'),
(21, '1-182-79558-8', 'Lý Tự Trọng-Sống mãi tên anh', 50000, 10, 8, 4, 10, 'Hình ảnh và chí khí của người thanh niên LÝ TỰ TRỌNG trong cuộc sống đời thường và khi hoạt động cách mạng. Tuổi đời còn rất trẻ nhưng không ngại khó khăn gian khổ, hiểm nguy, anh luôn hoàn thành xuất sắc mọi nhiệm vụ được giao… Không may bị sa vào tay giặc, bị dụ dỗ, mua chuộc, tra tấn khủng khiếp nhưng anh vẫn giữ vững niềm tin, trung thành với cách mạng. Câu nói bất hủ của anh “Con đường của thanh niên chỉ là con đường cách mạng, không thể có con đường nào khác” đã trở thành lí tưởng sống và kim chỉ nam hành động của thanh niên Việt Nam qua các thời kì cách mạng.', 'Hình ảnh và chí khí của người thanh niên LÝ TỰ TRỌNG trong cuộc sống đời thường và khi hoạt động cách mạng. Tuổi đời còn rất trẻ nhưng không ngại khó khăn gian khổ, hiểm nguy, anh luôn hoàn thành xuất sắc mọi nhiệm vụ được giao… Không may bị sa vào tay giặc, bị dụ dỗ, mua chuộc, tra tấn khủng khiếp nhưng anh vẫn giữ vững niềm tin, trung thành với cách mạng. Câu nói bất hủ của anh “Con đường của thanh niên chỉ là con đường cách mạng, không thể có con đường nào khác” đã trở thành lí tưởng sống và kim chỉ nam hành động của thanh niên Việt Nam qua các thời kì cách mạng.', '2021-04-26', '  5211110060020', 'book-images/hHhDDg9a4RWDzVB63TcSrNYszWpT9oaHxiPVxNRP.jpg', 1, 1, 0, 4000, 120, 'Tiếng Việt', '2021-05-09 19:17:10', '2021-05-12 18:13:10'),
(22, '0-182-14478-5', 'Lovely Children', 18000, 2, 4, 1, 2, 'Chuyện xoay quanh 3 cô bé sở hữu siêu năng lực cấp độ 7 luôn gia tay cứu giúp những người gặp cơn nguy khốn', 'Chuyện xoay quanh 3 cô bé sở hữu siêu năng lực cấp độ 7 luôn gia tay cứu giúp những người gặp cơn nguy khốn', '2021-05-20', ' 5212202600053', 'book-images/YMANXElRE0aw7b68Y667p0dlaXm6XaYW203IzruG.jpg', 0, 1, 0, 2000, 188, 'Tiếng Nhật', '2021-05-09 19:24:08', '2021-05-09 19:24:08'),
(23, '0-812-79169-2', 'Naruto ', 22000, 1, 3, 3, 10, 'Chiến cuộc ngày càng lan rộng! Liên minh Ninja liên tiếp tử chiến với các hào kiệt Ninja được triệu hồi từ cõi chết. Đội trưởng đội 1 Darui mở màn cuộc chiến, đối đầu Kim Ngân huynh đệ - 2 quái nhân vốn được mệnh danh là Ninja truyền thuyết của làng Mây! Trước đối thủ sở hữu chakra cửu vĩ và những nhẫn cụ lợi hại, cơ hội chiến thắng của anh là…!?', 'Chiến cuộc ngày càng lan rộng! Liên minh Ninja liên tiếp tử chiến với các hào kiệt Ninja được triệu hồi từ cõi chết. Đội trưởng đội 1 Darui mở màn cuộc chiến, đối đầu Kim Ngân huynh đệ - 2 quái nhân vốn được mệnh danh là Ninja truyền thuyết của làng Mây! Trước đối thủ sở hữu chakra cửu vĩ và những nhẫn cụ lợi hại, cơ hội chiến thắng của anh là…!?', '2021-05-18', '5212212530056', 'book-images/SBwQ7e2aCIj7HHn7mjTV2EfUDJZtUVEZA6RE6zLW.jpg', 2, 0, 1, 20000, 200, 'Tiếng Việt', '2021-05-09 19:26:26', '2021-05-12 08:05:21'),
(24, '1-589-40319-7', 'YaiBa', 20000, 2, 8, 3, 3, 'Nhóm Yaiba mau chóng tiến vào lãnh địa của địch. Tuy nhiên, kẻ thù cực mạnh không thể ngờ tới đang đợi ở căn phòng thứ tám. Trước đó, Yaiba phải đối mặt với nhóm ba nữ chiến binh giống Emerald như những giọt nước, có khả năng copy toàn bộ chiêu thức và phản công lại cậu. Chẳng lẽ đây đúng là một cái bẫy…!?', 'Nhóm Yaiba mau chóng tiến vào lãnh địa của địch. Tuy nhiên, kẻ thù cực mạnh không thể ngờ tới đang đợi ở căn phòng thứ tám. Trước đó, Yaiba phải đối mặt với nhóm ba nữ chiến binh giống Emerald như những giọt nước, có khả năng copy toàn bộ chiêu thức và phản công lại cậu. Chẳng lẽ đây đúng là một cái bẫy…!?', '2021-04-27', '6212201130019', 'book-images/xagQjHourTCFfzWZvMNy3JUGcaftuzJdAimba54c.jpg', 2, 1, 0, 2000, 184, 'Tiếng Việt', '2021-05-09 19:28:43', '2021-05-12 23:51:33'),
(25, '1-635-96530-7', 'Kính Vạn Hoa', 110000, 3, 4, 2, 4, '“Kính Vạn Hoa” là tác phẩm công phu nhất trong sự nghiệp của nhà văn Nguyễn Nhật Ánh, được trẻ em Việt Nam nhiều thế hệ yêu thích và đón nhận nồng nhiệt. Những câu chuyện thú vị xoay quanh cuộc sống của nhóm bạn Tiểu Long, Quý Ròm, Nhỏ Hạnh… cùng những chuyến phiêu lưu kì thú, bất ngờ, kì lạ… đã đưa các em bước vào một thế giới “cổ tích hiện đại”, có thực và tràn ngập ánh sáng yêu thương. Bộ sách đã thể hiện tình yêu, trách nhiệm và tâm huyết của tác giả đối với thế hệ trẻ. Nguyễn Nhật Ánh đã “thâm nhập” vào thế giới tâm hồn của tuổi thơ để hiểu và đồng cảm với những cảm xúc, suy tư của các em trước cuộc sống. “Kính Vạn Hoa” đã thực sự phản ánh toàn diện, đề cập tới tất cả các khía cạnh trong đời sống tâm hồn của trẻ em và đặc biệt là trách nhiệm xã hội của nhà văn đối với việc hoàn thiện nhân cách của các em.', '“Kính Vạn Hoa” là tác phẩm công phu nhất trong sự nghiệp của nhà văn Nguyễn Nhật Ánh, được trẻ em Việt Nam nhiều thế hệ yêu thích và đón nhận nồng nhiệt. Những câu chuyện thú vị xoay quanh cuộc sống của nhóm bạn Tiểu Long, Quý Ròm, Nhỏ Hạnh… cùng những chuyến phiêu lưu kì thú, bất ngờ, kì lạ… đã đưa các em bước vào một thế giới “cổ tích hiện đại”, có thực và tràn ngập ánh sáng yêu thương. Bộ sách đã thể hiện tình yêu, trách nhiệm và tâm huyết của tác giả đối với thế hệ trẻ. Nguyễn Nhật Ánh đã “thâm nhập” vào thế giới tâm hồn của tuổi thơ để hiểu và đồng cảm với những cảm xúc, suy tư của các em trước cuộc sống. “Kính Vạn Hoa” đã thực sự phản ánh toàn diện, đề cập tới tất cả các khía cạnh trong đời sống tâm hồn của trẻ em và đặc biệt là trách nhiệm xã hội của nhà văn đối với việc hoàn thiện nhân cách của các em.', '2021-05-28', '6211106390003', 'book-images/MUbigIgkgWYpTAIWPw61TpLCLzdGYP8ZQx9Oxl4r.jpg', 1, 1, 0, 1000, 174, 'Tiếng Việt', '2021-05-09 19:31:52', '2021-05-12 08:04:41'),
(27, '0-587-92139-7', 'Tiền đẻ ra tiền', 20000, 2, 3, 3, 4, 'Khi nhận nuôi chú chó giống Labrador lông trắng đột nhiên xuất hiện trước cửa nhà, chắc hẳn cô bé Kira không thể lường được cuộc phiêu lưu đang chờ đợi trước mắt. Bởi không những chú chó này biết nói, chú còn là một chuyên gia thứ thiệt về lĩnh vực tài chính và quản lí tiền bạc. Nghe theo lời chỉ dẫn của Money, Kira đã có cho mình những người bạn mới, một vài công việc yêu thích và thậm chí còn có thể giúp bố mẹ mình thoát cảnh nợ nần.\n\n', 'Khi nhận nuôi chú chó giống Labrador lông trắng đột nhiên xuất hiện trước cửa nhà, chắc hẳn cô bé Kira không thể lường được cuộc phiêu lưu đang chờ đợi trước mắt. Bởi không những chú chó này biết nói, chú còn là một chuyên gia thứ thiệt về lĩnh vực tài chính và quản lí tiền bạc. Nghe theo lời chỉ dẫn của Money, Kira đã có cho mình những người bạn mới, một vài công việc yêu thích và thậm chí còn có thể giúp bố mẹ mình thoát cảnh nợ nần.\n\n', '2021-05-29', '6212300010032', 'book-images/i0IsMicnAgguHXM8YXE9PYNmHLIDfXy4tbN4RQss.jpg', 0, 0, 1, 1000, 196, 'Tiếng Việt', '2021-05-09 19:38:16', '2021-05-09 19:38:16'),
(28, '0-520-87476-9', 'Những truyện hay ', 80000, 3, 4, 4, 2, 'Những tác phẩm viết cho lứa tuổi thơ nổi tiếng trong nước và thế giới đã trả lời câu hỏi ấy. Một sáng tác hay cho các em cũng làm cho cả người lớn thấy hay. Các em và người lớn đều thu nhận được ở tác phẩm ấy những thông cảm cho mỗi lứa tuổi khác nhau, mà người lớn không cần phải giả làm trẻ em mới hiểu được. Người lớn vốn đã thích thú đọc rất hào hứng những tác phẩm tưởng tượng còn “hoang đường” hơn truyện đồng thoại kia mà.”\n\n', 'Những tác phẩm viết cho lứa tuổi thơ nổi tiếng trong nước và thế giới đã trả lời câu hỏi ấy. Một sáng tác hay cho các em cũng làm cho cả người lớn thấy hay. Các em và người lớn đều thu nhận được ở tác phẩm ấy những thông cảm cho mỗi lứa tuổi khác nhau, mà người lớn không cần phải giả làm trẻ em mới hiểu được. Người lớn vốn đã thích thú đọc rất hào hứng những tác phẩm tưởng tượng còn “hoang đường” hơn truyện đồng thoại kia mà.”\n\n', '2021-05-12', '6211107600003', 'book-images/fA9yXjqHd0yig4yNGQs5WTP6bY1rOd8OFUkQBc2z.jpg', 0, 1, 0, 2000, 304, 'Tiếng Việt', '2021-05-09 19:42:00', '2021-05-09 20:41:06'),
(29, '0-208-35565-6', 'ONE PIECE - TẬP 3 ', 19500, 2, 3, 2, 4, 'Xuyên suốt câu chuyện là những tình tiết hài về một nhóm cướp lênh đênh trên biển…', 'Xuyên suốt câu chuyện là những tình tiết hài về một nhóm cướp lênh đênh trên biển…', '2021-05-22', '6212203330003', 'book-images/3QGlmUlEJGIlAAk01GeHxtZuUNfw2hj1pdgmhb9w.jpg', 0, 0, 1, 5000, 200, 'Tiếng Việt', '2021-05-09 19:44:37', '2021-05-09 20:39:46'),
(30, '1-359-10040-9', 'ONE PIECE - TẬP 37 ', 20000, 2, 2, 3, 4, 'Trận đối đầu giữa nhóm của Luffy với CP9 nhằm mục đích ngăn cản Robin sẽ diễn ra như thế nào!? Để đoạt lấy bản thiết kế của vũ khí cổ đại \"Pluton\", CP9 đã nhắm vào Franky!! Sự thật nào sẽ được phơi bày ở đó...!? Những chuyến phiêu lưu trên đại dương xoay quanh \"ONE PIECE\" lại bắt đầu!!', 'Trận đối đầu giữa nhóm của Luffy với CP9 nhằm mục đích ngăn cản Robin sẽ diễn ra như thế nào!? Để đoạt lấy bản thiết kế của vũ khí cổ đại \"Pluton\", CP9 đã nhắm vào Franky!! Sự thật nào sẽ được phơi bày ở đó...!? Những chuyến phiêu lưu trên đại dương xoay quanh \"ONE PIECE\" lại bắt đầu!!', '2021-04-30', '6212203330037', 'book-images/KX8Sm9pDczSXEDMs9rxXrHyQ1WfMqMpGPENDpCpZ.jpg', 0, 0, 1, 3000, 192, 'Tiếng Việt', '2021-05-09 19:47:19', '2021-05-09 20:39:33'),
(31, '0-829-62818-8', 'Tớ là mèo Pussen', 20000, 9, 5, 3, 1, '\"Hài hước, kì lạ và vô cùng đáng yêu\"\n\n(Matthew Inman, người sáng lập website The Oatmeal)\n\nTớ là mèo Pusheen - Cuốn nhật ký xoay quanh cuộc sống của Pusheen - chú mèo Icon nổi tiếng trên mạng xã hội facebook với hơn 7 triệu người hâm mộ. Hãy cùng tìm hiểu những điều khiến Pusheen thích thú và lí do hàng triệu người trót mết vẻ \"tung tăng\" của nàng mèo múp míp, mũm mĩm này nhé!', '\"Hài hước, kì lạ và vô cùng đáng yêu\"\n\n(Matthew Inman, người sáng lập website The Oatmeal)\n\nTớ là mèo Pusheen - Cuốn nhật ký xoay quanh cuộc sống của Pusheen - chú mèo Icon nổi tiếng trên mạng xã hội facebook với hơn 7 triệu người hâm mộ. Hãy cùng tìm hiểu những điều khiến Pusheen thích thú và lí do hàng triệu người trót mết vẻ \"tung tăng\" của nàng mèo múp míp, mũm mĩm này nhé!', '2021-05-06', '6212200010038', 'book-images/3BLdGsBrpBJel7zJjBdXA3LizPlinbP04tI0O9jO.jpg', 1, 0, 1, 2000, 188, 'Tiếng Việt', '2021-05-09 19:49:52', '2021-05-12 03:06:16'),
(32, '0-578-95832-6', 'Cha Cõng Con', 20000, 10, 8, 3, 3, 'Từ trên cao nhìn xuống những cánh đồng, dòng sông, Bường muốn được về nhà.\n\nNgười cha đạp xe không kể ngày đêm, băng qua cánh đồng vàng, băng qua những con dốc trắng… Cậu bé tóc gần như rụng hết, dang cánh tay như cánh chim. Hai cha con đã về đến con sông, bên kia dòng sông là nơi họ sống. Cả hai vượt sông, người cha cõng con trai trên lưng. Rồi người ta thấy dòng sông phẳng lặng, không thấy bóng hai cha con nữa.', 'Từ trên cao nhìn xuống những cánh đồng, dòng sông, Bường muốn được về nhà.\n\nNgười cha đạp xe không kể ngày đêm, băng qua cánh đồng vàng, băng qua những con dốc trắng… Cậu bé tóc gần như rụng hết, dang cánh tay như cánh chim. Hai cha con đã về đến con sông, bên kia dòng sông là nơi họ sống. Cả hai vượt sông, người cha cõng con trai trên lưng. Rồi người ta thấy dòng sông phẳng lặng, không thấy bóng hai cha con nữa.', '2021-05-13', '6211100010029', 'book-images/qtcC50PXjuANefphJnvHhXLx8IV6AKJHsPmpld5j.jpg', 14, 1, 0, 2000, 100, 'Tiếng Việt ', '2021-05-10 02:57:21', '2021-05-12 23:50:58'),
(33, '0-311-54816-1', 'Chuyện Ma Ám Ở Dinh Biệt Thự', 13000, 9, 3, 4, 1, 'Tiến sĩ Montague, một nhà khoa học chuyên điều tra các hiện tượng ma quái, đã quyết định sống vài tuần tại Dinh thự Hill, nổi tiếng là một nơi kinh dị mà không con người nào sống được. Để kiểm tra và bổ trợ cho các quan sát của mình, ông lựa ra ba người bạn đồng hành mình chưa từng quen biết: hai cô gái – Theo và Eleanor – cùng Luke – một chàng trai trẻ, người thừa kế của Dinh thự Hill. Khi cả bốn người bắt đầu đối phó với những cơn ớn lạnh, thậm chí là cả các sự kiện kinh hoàng nằm ngoài tầm kiểm soát hay hiểu biết của họ tại Dinh thự Hill, họ cũng khó lòng đoán biết được những gì đang chờ đợi mình phía trước.', 'Tiến sĩ Montague, một nhà khoa học chuyên điều tra các hiện tượng ma quái, đã quyết định sống vài tuần tại Dinh thự Hill, nổi tiếng là một nơi kinh dị mà không con người nào sống được. Để kiểm tra và bổ trợ cho các quan sát của mình, ông lựa ra ba người bạn đồng hành mình chưa từng quen biết: hai cô gái – Theo và Eleanor – cùng Luke – một chàng trai trẻ, người thừa kế của Dinh thự Hill. Khi cả bốn người bắt đầu đối phó với những cơn ớn lạnh, thậm chí là cả các sự kiện kinh hoàng nằm ngoài tầm kiểm soát hay hiểu biết của họ tại Dinh thự Hill, họ cũng khó lòng đoán biết được những gì đang chờ đợi mình phía trước.', '2021-05-28', '6212814090001', 'book-images/UZzBQWIl5kPwBDcZzzX9l1PPPX7h9nCN1S1EaoVH.jpg', 3, 1, 0, 2000, 288, 'Tiếng Việt ', '2021-05-10 03:00:38', '2021-05-11 20:53:43'),
(34, '0-260-81475-4', 'Dragon Ball ', 77000, 2, 3, 5, 5, 'DRAGON BALL là một Manga kinh điển với tầm ảnh hưởng lớn đến mức nào! Một bộ truyện chúng ta đã gắn bó suốt từ nhỏ, ăn cùng, ngủ cùng, bắt gặp hình ảnh ở khắp mọi nơi, vậy thì chẳng có lí do gì mà không sở hữu 1 phiên bản rực rỡ sắc màu như thế này cả! Nhất là khi \"Giấc mơ thuở bé\" nay đã thành sự thực nữa!', 'DRAGON BALL là một Manga kinh điển với tầm ảnh hưởng lớn đến mức nào! Một bộ truyện chúng ta đã gắn bó suốt từ nhỏ, ăn cùng, ngủ cùng, bắt gặp hình ảnh ở khắp mọi nơi, vậy thì chẳng có lí do gì mà không sở hữu 1 phiên bản rực rỡ sắc màu như thế này cả! Nhất là khi \"Giấc mơ thuở bé\" nay đã thành sự thực nữa!', '2021-05-11', '5212214290004', 'book-images/yyW2WUvbZ4xe06td77zpoVQAUg5lYsBN1VA2uACt.jpg', 4, 0, 1, 5000, 224, 'Tiếng Việt ', '2021-05-10 03:41:11', '2021-05-12 23:52:59'),
(35, '1-928-94916-8', 'Cõng bạn đi học ', 20000, 10, 7, 3, 2, '<h2>Cảm hứng s&aacute;ng tạo nh&acirc;n vật[<a href=\"https://vi.wikipedia.org/w/index.php?title=Sherlock_Holmes&amp;veaction=edit&amp;section=1\" title=\"Sửa đổi phần “Cảm hứng sáng tạo nhân vật”\">sửa</a>&nbsp;|&nbsp;<a href=\"https://vi.wikipedia.org/w/index.php?title=Sherlock_Holmes&amp;action=edit&amp;section=1\" title=\"Sửa đổi phần “Cảm hứng sáng tạo nhân vật”\">sửa m&atilde; nguồn</a>]</h2>\n\n<p><a href=\"https://vi.wikipedia.org/wiki/T%E1%BA%ADp_tin:Arthur_Conan_Doyle_by_Walter_Benington,_1914.png\"><img alt=\"\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Arthur_Conan_Doyle_by_Walter_Benington%2C_1914.png/161px-Arthur_Conan_Doyle_by_Walter_Benington%2C_1914.png\" style=\"height:213px; width:161px\" /></a></p>\n\n<p><a href=\"https://vi.wikipedia.org/wiki/Arthur_Conan_Doyle\" title=\"Arthur Conan Doyle\">Arthur Conan Doyle</a>&nbsp;(1859&ndash;1930), người s&aacute;ng tạo Sherlock Holmes, năm 1914</p>\n\n<p>C. Auguste Dupin của&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Edgar_Allan_Poe\" title=\"Edgar Allan Poe\">Edgar Allan Poe</a>&nbsp;thường được c&ocirc;ng nhận l&agrave; th&aacute;m tử đầu ti&ecirc;n xuất hiện tr&ecirc;n tiểu thuyết v&agrave; l&agrave; nguy&ecirc;n mẫu cho nhiều nh&acirc;n vật sau n&agrave;y bao gồm cả Sherlock Holmes.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-7\">[7]</a></sup>&nbsp;Conan Doyle đ&atilde; từng viết, &quot;Mỗi truyện [trinh th&aacute;m của Poe] đều l&agrave; gốc rễ cho cả một nền văn học ph&aacute;t triển... Thử hỏi, truyện trinh th&aacute;m đ&atilde; ở đ&acirc;u cho đến khi Poe thổi hơi thở cuộc sống v&agrave;o n&oacute;?&quot;<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-8\">[8]</a></sup>&nbsp;Tương tự, những c&acirc;u chuyện về Monsieur Lecoq của&nbsp;<a href=\"https://vi.wikipedia.org/w/index.php?title=%C3%89mile_Gaboriau&amp;action=edit&amp;redlink=1\" title=\"Émile Gaboriau (trang chưa được viết)\">&Eacute;mile Gaboriau</a>&nbsp;cũng cực kỳ nổi tiếng v&agrave;o thời điểm Conan Doyle bắt đầu viết Sherlock Holmes, c&aacute;ch đối thoại v&agrave; lối cư xử của Holmes đ&ocirc;i khi được phỏng theo Lecoq.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-9\">[9]</a></sup>&nbsp;Holmes v&agrave; Watson từng thảo luận về Dupin v&agrave; Lecoq ngay gần phần đầu của&nbsp;<em>Cuộc điều tra m&agrave;u đỏ</em>.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-10\">[10]</a></sup></p>\n\n<p>Conan Doyle nhắc lại nhiều lần rằng Joseph Bell, một b&aacute;c sĩ phẫu thuật tại Bệnh viện Ho&agrave;ng gia Edinburgh, l&agrave; nguồn cảm hứng c&oacute; thật cho nh&acirc;n vật Sherlock Holmes. Doyle gặp Bell v&agrave;o năm 1877 v&agrave; từng l&agrave;m thư k&yacute; cho &ocirc;ng n&agrave;y. Cũng như Holmes, Bell nổi tiếng với khả năng đưa ra c&aacute;c đ&aacute;nh gi&aacute; kh&aacute;i qu&aacute;t từ những quan s&aacute;t nhỏ.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-11\">[11]</a></sup>&nbsp;Tuy nhi&ecirc;n, trong bức thư Joseph Bell gửi cho Conan Dolye lại c&oacute; đoạn: &quot;Bạn mới thật sự l&agrave; Sherlock Holmes, bản th&acirc;n bạn biết điều đ&oacute; m&agrave;.&quot;<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-12\">[12]</a></sup>&nbsp;Sir Henry Littlejohn, gi&aacute;o sư khoa luật y tế tại Viện y Đại học Edinburgh, cũng được coi l&agrave; nguồn cảm hứng cho Holmes. Littlejohn, một b&aacute;c sĩ ph&aacute;p y ki&ecirc;m c&aacute;n bộ y tế ở Edinburgh, đ&atilde; cung cấp cho Conan Doyle mối li&ecirc;n hệ giữa nghi&ecirc;n cứu y khoa v&agrave; điều tra tội phạm.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-13\">[13]</a></sup></p>\n\n<p>Cũng c&oacute; một v&agrave;i nguồn cảm hứng khả dĩ kh&aacute;c được đề xuất mặc d&ugrave; chưa bao giờ được Doyle thừa nhận, chẳng hạn như t&aacute;c phẩm&nbsp;<em>Maximillien Heller</em>&nbsp;của t&aacute;c giả người Ph&aacute;p Henry Cauvain. Trong cuốn tiểu thuyết năm 1871 của m&igrave;nh (mười s&aacute;u năm trước khi Sherlock Holmes xuất hiện lần đầu ti&ecirc;n), Henry Cauvain đ&atilde; khắc họa một th&aacute;m tử đa nh&acirc;n c&aacute;ch, rầu rĩ, chống đối x&atilde; hội, h&uacute;t thuốc phiện v&agrave; đang hoạt động ở Paris.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-14\">[14]</a></sup><sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-15\">[15]</a></sup>&nbsp;D&ugrave; Conan Doyle th&ocirc;ng thạo tiếng Ph&aacute;p nhưng kh&ocirc;ng r&otilde; liệu &ocirc;ng c&oacute; từng đọc&nbsp;<em>Maximillien Heller</em>&nbsp;hay chưa.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-16\">[16]</a></sup>&nbsp;Tương tự, Michael Harrison cho rằng &quot;th&aacute;m tử tư vấn&quot; tự phong người Đức, Walter Scherer, c&oacute; thể l&agrave; h&igrave;nh mẫu cho Holmes.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-17\">[17]</a></sup></p>\n\n<h2>Tiểu sử nh&acirc;n vật hư cấu[<a href=\"https://vi.wikipedia.org/w/index.php?title=Sherlock_Holmes&amp;veaction=edit&amp;section=2\" title=\"Sửa đổi phần “Tiểu sử nhân vật hư cấu”\">sửa</a>&nbsp;|&nbsp;<a href=\"https://vi.wikipedia.org/w/index.php?title=Sherlock_Holmes&amp;action=edit&amp;section=2\" title=\"Sửa đổi phần “Tiểu sử nhân vật hư cấu”\">sửa m&atilde; nguồn</a>]</h2>\n\n<h3>Gia đ&igrave;nh v&agrave; giai đoạn đầu đời[<a href=\"https://vi.wikipedia.org/w/index.php?title=Sherlock_Holmes&amp;veaction=edit&amp;section=3\" title=\"Sửa đổi phần “Gia đình và giai đoạn đầu đời”\">sửa</a>&nbsp;|&nbsp;<a href=\"https://vi.wikipedia.org/w/index.php?title=Sherlock_Holmes&amp;action=edit&amp;section=3\" title=\"Sửa đổi phần “Gia đình và giai đoạn đầu đời”\">sửa m&atilde; nguồn</a>]</h3>\n\n<p><a href=\"https://vi.wikipedia.org/wiki/T%E1%BA%ADp_tin:A_Study_in_Scarlet_from_Beeton%27s_Christmas_Annual_1887.jpg\"><img alt=\"\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/A_Study_in_Scarlet_from_Beeton%27s_Christmas_Annual_1887.jpg/172px-A_Study_in_Scarlet_from_Beeton%27s_Christmas_Annual_1887.jpg\" style=\"height:261px; width:172px\" /></a></p>\n\n<p>Trang b&igrave;a phi&ecirc;n bản năm 1887 của&nbsp;<em>Beeton&#39;s Christmas Annual</em>, trong đ&oacute; c&oacute; sự xuất hiện lần đầu của Holmes (<em>Cuộc điều tra m&agrave;u đỏ</em>)</p>\n\n<p>Trong t&aacute;c phẩm của Conan Doyle, th&ocirc;ng tin chi tiết về cuộc đời của Sherlock Holmes rất hiếm hoi v&agrave; thường kh&ocirc;ng r&otilde; r&agrave;ng. Tuy nhi&ecirc;n, những đề cập &iacute;t ỏi về thời ni&ecirc;n thiếu v&agrave; gia đ&igrave;nh của Holmes vẫn đủ sức vẽ n&ecirc;n một bức tranh tiểu sử lỏng lẻo cho vị th&aacute;m tử.</p>\n\n<p>Truyện ngắn &quot;Cung đ&agrave;n sau cuối&quot; khẳng định Holmes sinh năm 1854 khi mi&ecirc;u tả anh ở tuổi 60 với bối cảnh th&aacute;ng 8 năm 1914.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-18\">[18]</a></sup>&nbsp;Cha mẹ của Holmes kh&ocirc;ng được nhắc tới mặc d&ugrave; anh từng n&oacute;i rằng &quot;tổ ti&ecirc;n&quot; của m&igrave;nh l&agrave; &quot;những điền chủ n&ocirc;ng th&ocirc;n&quot;. Trong &quot;Người th&ocirc;ng ng&ocirc;n Hy Lạp&quot;, Holmes cho biết b&agrave; của m&igrave;nh l&agrave; em g&aacute;i họa sĩ người Ph&aacute;p Vernet m&agrave; kh&ocirc;ng n&oacute;i r&otilde; đ&oacute; l&agrave;&nbsp;<a href=\"https://vi.wikipedia.org/w/index.php?title=Claude_Joseph_Vernet&amp;action=edit&amp;redlink=1\" title=\"Claude Joseph Vernet (trang chưa được viết)\">Claude Joseph</a>,&nbsp;<a href=\"https://vi.wikipedia.org/w/index.php?title=Carle_Vernet&amp;action=edit&amp;redlink=1\" title=\"Carle Vernet (trang chưa được viết)\">Carle</a>&nbsp;hay&nbsp;<a href=\"https://vi.wikipedia.org/w/index.php?title=Horace_Vernet&amp;action=edit&amp;redlink=1\" title=\"Horace Vernet (trang chưa được viết)\">Horace Vernet</a>. Holmes c&oacute; một người anh trai l&agrave;&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Mycroft_Holmes\" title=\"Mycroft Holmes\">Mycroft</a>, hơn anh 7 tuổi v&agrave; l&agrave; một quan chức ch&iacute;nh phủ. Mycroft giữ một vị tr&iacute;&nbsp;<a href=\"https://vi.wikipedia.org/wiki/C%C3%B4ng_v%E1%BB%A5\" title=\"Công vụ\">c&ocirc;ng vụ</a>&nbsp;đặc biệt như một dạng cơ sở dữ liệu sống, li&ecirc;n quan tới tất cả kh&iacute;a cạnh trong c&aacute;c quyết s&aacute;ch của nh&agrave; nước. Holmes m&ocirc; tả Mycroft l&agrave; người th&ocirc;ng minh hơn trong hai anh em nhưng lưu &yacute; rằng Mycroft kh&ocirc;ng quan t&acirc;m đến việc điều tra thực địa v&agrave; th&iacute;ch d&agrave;nh thời gian ở C&acirc;u lạc bộ Diogenes.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-19\">[19]</a></sup><sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-20\">[20]</a></sup></p>\n\n<p>Holmes n&oacute;i rằng lần đầu ti&ecirc;n anh bắt đầu ph&aacute;t triển c&aacute;c phương ph&aacute;p suy luận l&agrave; khi đang c&ograve;n học đại học; những vụ &aacute;n đầu đời m&agrave; anh theo đuổi trong vai tr&ograve; một th&aacute;m tử nghiệp dư cũng đến từ c&aacute;c sinh vi&ecirc;n c&ugrave;ng trường.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-21\">[21]</a></sup>&nbsp;Holmes quyết định chọn th&aacute;m tử l&agrave;m một nghề chuy&ecirc;n nghiệp sau lần gặp gỡ cha của một người bạn.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-22\">[22]</a></sup></p>\n\n<h3>Cuộc sống với Watson[<a href=\"https://vi.wikipedia.org/w/index.php?title=Sherlock_Holmes&amp;veaction=edit&amp;section=4\" title=\"Sửa đổi phần “Cuộc sống với Watson”\">sửa</a>&nbsp;|&nbsp;<a href=\"https://vi.wikipedia.org/w/index.php?title=Sherlock_Holmes&amp;action=edit&amp;section=4\" title=\"Sửa đổi phần “Cuộc sống với Watson”\">sửa m&atilde; nguồn</a>]</h3>\n\n<p><a href=\"https://vi.wikipedia.org/wiki/T%E1%BA%ADp_tin:Strand_paget.jpg\"><img alt=\"Holmes (in deerstalker hat) talking to Watson (in a bowler hat) in a railway compartment\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Strand_paget.jpg/220px-Strand_paget.jpg\" style=\"height:207px; width:220px\" /></a></p>\n\n<p>Holmes v&agrave; Watson trong một bức minh họa của Sidney Paget cho &quot;Ngọn lửa bạc&quot;</p>\n\n<p>Kh&oacute; khăn t&agrave;i ch&iacute;nh khiến Holmes v&agrave;&nbsp;<a href=\"https://vi.wikipedia.org/wiki/B%C3%A1c_s%C4%A9_Watson\" title=\"Bác sĩ Watson\">b&aacute;c sĩ Watson</a>&nbsp;phải c&ugrave;ng nhau chia sẻ căn hộ tầng tr&ecirc;n số&nbsp;<a href=\"https://vi.wikipedia.org/wiki/221B_ph%E1%BB%91_Baker\" title=\"221B phố Baker\">221B, phố Baker</a>, Lu&acirc;n Đ&ocirc;n,<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-23\">[23]</a></sup>&nbsp;thu&ecirc; của&nbsp;<a href=\"https://vi.wikipedia.org/wiki/B%C3%A0_Hudson\" title=\"Bà Hudson\">b&agrave; Hudson</a>.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-24\">[24]</a></sup>&nbsp;Holmes l&agrave;m th&aacute;m tử trong 23 năm với 17 năm được Watson hỗ trợ.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-25\">[25]</a></sup>&nbsp;Hầu hết c&aacute;c c&acirc;u chuyện đều l&agrave; kiểu truyện khung, được viết theo quan điểm của Watson v&agrave; l&agrave; bản t&oacute;m tắt những vụ &aacute;n th&uacute; vị nhất của vị th&aacute;m tử. Holmes thường gọi c&aacute;c hồ sơ vụ &aacute;n m&agrave; Watson viết l&agrave; giật g&acirc;n v&agrave; theo chủ nghĩa d&acirc;n t&uacute;y, cho thấy rằng ch&uacute;ng kh&ocirc;ng b&aacute;o c&aacute;o ch&iacute;nh x&aacute;c sự kh&aacute;ch quan v&agrave; t&iacute;nh &quot;khoa học&quot; trong c&ocirc;ng việc của anh:</p>\n\n<blockquote>\n<p>Việc điều tra l&agrave;, hay lẽ ra phải l&agrave;, một m&ocirc;n khoa học ch&iacute;nh x&aacute;c, v&agrave; phải được phản &aacute;nh với c&ugrave;ng một cung c&aacute;ch thản nhi&ecirc;n v&agrave; v&ocirc; cảm như thế. Anh lại muốn n&oacute; [<em>Cuộc điều tra m&agrave;u đỏ</em>] nhuốm m&agrave;u sắc chủ nghĩa l&atilde;ng mạn, hiệu ứng tạo ra chẳng kh&aacute;c g&igrave; khi anh nh&agrave;o nặn một chuyện t&igrave;nh hay chuyện bỏ nh&agrave; theo trai th&agrave;nh ti&ecirc;n đề thứ năm của&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Euclid\" title=\"Euclid\">Euclid</a>. Một số t&igrave;nh tiết thực lẽ ra n&ecirc;n loại bỏ, hoặc ch&iacute; &iacute;t khi đề cập tới cũng phải để &yacute; sao cho n&oacute; c&oacute; cảm gi&aacute;c tương xứng. Điểm duy nhất đ&aacute;ng n&oacute;i trong vụ đ&oacute; l&agrave; qu&aacute; tr&igrave;nh suy luận mang t&iacute;nh ph&acirc;n t&iacute;ch cặn kẽ từ nguy&ecirc;n nh&acirc;n đến kết quả m&agrave; nhờ đ&oacute; t&ocirc;i đ&atilde; ph&aacute; &aacute;n th&agrave;nh c&ocirc;ng.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-26\">[26]</a></sup></p>\n</blockquote>\n\n<p>D&ugrave; vậy, t&igrave;nh bạn với Watson l&agrave; mối quan hệ quan trọng nhất của Holmes. Khi Watson bị tr&uacute;ng đạn, mặc d&ugrave; vết thương c&oacute; vẻ &quot;kh&aacute; hời hợt&quot;, vị b&aacute;c sĩ cũng vẫn phải cảm động trước phản ứng của bạn m&igrave;nh:</p>\n\n<blockquote>\n<p>N&oacute; đ&aacute;ng gi&aacute; một vết thương, thậm ch&iacute; l&agrave; nhiều vết thương, để biết được tận c&ugrave;ng l&ograve;ng trung th&agrave;nh v&agrave; t&igrave;nh y&ecirc;u ẩn sau lớp mặt nạ lạnh l&ugrave;ng đ&oacute;. Trong một gi&acirc;y l&aacute;t, đ&ocirc;i mắt trong veo, rắn rỏi chợt mờ đi v&agrave; đ&ocirc;i m&ocirc;i cương nghị th&igrave; đang run bần bật. Lần đầu ti&ecirc;n t&ocirc;i được thấy một tr&aacute;i tim đi k&egrave;m một tr&iacute; &oacute;c thật vĩ đại. Ph&aacute;t hiện n&agrave;y b&ugrave; đắp đầy đủ tất cả những năm th&aacute;ng cộng t&aacute;c khi&ecirc;m tốn v&agrave; bất vụ lợi của t&ocirc;i.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-27\">[27]</a></sup></p>\n</blockquote>\n\n<h3>C&ocirc;ng việc[<a href=\"https://vi.wikipedia.org/w/index.php?title=Sherlock_Holmes&amp;veaction=edit&amp;section=5\" title=\"Sửa đổi phần “Công việc”\">sửa</a>&nbsp;|&nbsp;<a href=\"https://vi.wikipedia.org/w/index.php?title=Sherlock_Holmes&amp;action=edit&amp;section=5\" title=\"Sửa đổi phần “Công việc”\">sửa m&atilde; nguồn</a>]</h3>\n\n<p>Kh&aacute;ch h&agrave;ng của Holmes rất đa dạng, từ c&aacute;c quốc vương hay ch&iacute;nh phủ quyền lực nhất ch&acirc;u &Acirc;u,&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Ch%E1%BA%BF_%C4%91%E1%BB%99_qu%C3%BD_t%E1%BB%99c\" title=\"Chế độ quý tộc\">qu&yacute; tộc</a>,&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Tr%C3%B9m_t%C6%B0_b%E1%BA%A3n\" title=\"Trùm tư bản\">nh&agrave; c&ocirc;ng nghiệp</a>&nbsp;gi&agrave;u c&oacute;, cho đến những người l&agrave;m nghề&nbsp;<a href=\"https://vi.wikipedia.org/wiki/C%E1%BA%A7m_%C4%91%E1%BB%93\" title=\"Cầm đồ\">cầm đồ</a>&nbsp;v&agrave; c&aacute;c&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Ph%C3%B3_m%E1%BA%ABu\" title=\"Phó mẫu\">ph&oacute; mẫu</a>&nbsp;ngh&egrave;o kh&oacute;. Trong những c&acirc;u chuyện đầu ti&ecirc;n, d&ugrave; chỉ mới được v&agrave;i người trong giới biết đến nhưng Holmes đ&atilde; sớm cộng t&aacute;c với&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Scotland_Yard\" title=\"Scotland Yard\">Scotland Yard</a>. Hồ sơ của Holmes ng&agrave;y một d&agrave;y hơn khi anh tiếp tục c&ocirc;ng việc v&agrave; Watson th&igrave; cho xuất bản c&aacute;c c&acirc;u chuyện của m&igrave;nh. Holmes nhanh ch&oacute;ng trở n&ecirc;n nổi tiếng trong vai tr&ograve; một th&aacute;m tử. Rất nhiều kh&aacute;ch h&agrave;ng t&igrave;m tới sự gi&uacute;p đỡ của Holmes thay v&igrave; (hoặc ngo&agrave;i) cảnh s&aacute;t.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-28\">[28]</a></sup>&nbsp;Watson viết, v&agrave;o năm 1895, Holmes đ&atilde; c&oacute; &quot;một lượng lớn việc l&agrave;m&quot;.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-29\">[29]</a></sup>&nbsp;Cảnh s&aacute;t ngo&agrave;i khu vực Lu&acirc;n Đ&ocirc;n cũng lu&ocirc;n y&ecirc;u cầu Holmes gi&uacute;p sức mỗi khi anh ở gần họ.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-30\">[30]</a></sup>&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Th%E1%BB%A7_t%C6%B0%E1%BB%9Bng_V%C6%B0%C6%A1ng_qu%E1%BB%91c_Anh\" title=\"Thủ tướng Vương quốc Anh\">Thủ tướng</a><sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-31\">[31]</a></sup>&nbsp;v&agrave; vua Bohemia<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-Klinger_I_tr._15-162-32\">[32]</a></sup>&nbsp;đ&atilde; đ&iacute;ch th&acirc;n đến thăm số 221B, phố Baker để nhờ Holmes hỗ trợ;&nbsp;<a href=\"https://vi.wikipedia.org/wiki/T%E1%BB%95ng_th%E1%BB%91ng_Ph%C3%A1p\" title=\"Tổng thống Pháp\">tổng thống Ph&aacute;p</a>&nbsp;tặng anh Hu&acirc;n chương&nbsp;<a href=\"https://vi.wikipedia.org/wiki/B%E1%BA%AFc_%C4%90%E1%BA%A9u_B%E1%BB%99i_tinh\" title=\"Bắc Đẩu Bội tinh\">Bắc đẩu bội tinh</a>&nbsp;v&igrave; bắt được một t&ecirc;n s&aacute;t thủ;<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-33\">[33]</a></sup>&nbsp;vua Scandinavia l&agrave; kh&aacute;ch h&agrave;ng của Holmes;<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-34\">[34]</a></sup>&nbsp;v&agrave; Holmes cũng từng cứu viện&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Th%C3%A0nh_Vatican\" title=\"Thành Vatican\">Vatican</a>&nbsp;&iacute;t nhất hai lần.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-35\">[35]</a></sup>&nbsp;Vị th&aacute;m tử từng l&agrave;m thay ch&iacute;nh phủ Anh trong c&aacute;c vấn đề an ninh quốc gia nhiều lần,<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-36\">[36]</a></sup>&nbsp;v&agrave; từ chối phong tước hiệp sĩ &quot;cho c&aacute;c dịch vụ m&agrave; c&oacute; lẽ một ng&agrave;y n&agrave;o đ&oacute; sẽ được m&ocirc; tả&quot;.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-37\">[37]</a></sup>&nbsp;Holmes kh&ocirc;ng t&iacute;ch cực t&igrave;m kiếm danh vọng, thường xuy&ecirc;n bằng l&ograve;ng để cho c&aacute;c cảnh s&aacute;t gi&agrave;nh hết c&ocirc;ng lao của m&igrave;nh.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-38\">[38]</a></sup></p>\n\n<h3>Điểm gi&aacute;n đoạn vĩ đại[<a href=\"https://vi.wikipedia.org/w/index.php?title=Sherlock_Holmes&amp;veaction=edit&amp;section=6\" title=\"Sửa đổi phần “Điểm gián đoạn vĩ đại”\">sửa</a>&nbsp;|&nbsp;<a href=\"https://vi.wikipedia.org/w/index.php?title=Sherlock_Holmes&amp;action=edit&amp;section=6\" title=\"Sửa đổi phần “Điểm gián đoạn vĩ đại”\">sửa m&atilde; nguồn</a>]</h3>\n\n<p><a href=\"https://vi.wikipedia.org/wiki/T%E1%BA%ADp_tin:Sherlock_Holmes_and_Professor_Moriarty_at_the_Reichenbach_Falls.jpg\"><img alt=\"Holmes and Moriarty wrestling at the end of a narrow path, with Holmes\'s hat falling into a waterfall\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Sherlock_Holmes_and_Professor_Moriarty_at_the_Reichenbach_Falls.jpg/220px-Sherlock_Holmes_and_Professor_Moriarty_at_the_Reichenbach_Falls.jpg\" style=\"height:342px; width:220px\" /></a></p>\n\n<p>Holmes v&agrave; Moriarty vật lộn tại đ&egrave;o Reichenbach; vẽ bởi Sidney Paget</p>\n\n<p>Tập truyện Sherlock Holmes đầu ti&ecirc;n được xuất bản từ năm 1887 đến năm 1893. Conan Doyle đ&atilde; để Holmes chết trong trận chiến sau ch&oacute;t với bậc thầy tội phạm&nbsp;<a href=\"https://vi.wikipedia.org/wiki/James_Moriarty\" title=\"James Moriarty\">Gi&aacute;o sư James Moriarty</a><sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-39\">[39]</a></sup>&nbsp;trong &quot;Vụ &aacute;n cuối c&ugrave;ng&quot; (xuất bản năm 1893, nhưng lấy bối cảnh năm 1891) v&igrave; &ocirc;ng cảm thấy rằng &quot;t&ocirc;i kh&ocirc;ng n&ecirc;n dồn qu&aacute; nhiều năng lượng văn học cho chỉ một k&ecirc;nh duy nhất.&quot;<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-40\">[40]</a></sup>&nbsp;Thế nhưng, phản ứng của c&ocirc;ng ch&uacute;ng đ&atilde; khiến Doyle v&ocirc; c&ugrave;ng ngạc nhi&ecirc;n. Những độc giả đau khổ li&ecirc;n tục gửi những l&aacute; thư sầu thảm cho&nbsp;<em>The Strand Magazine</em>, tạp ch&iacute; n&agrave;y th&igrave; chịu một đ&ograve;n khủng khiếp khi bị 20.000 người khiếu nại bằng việc hủy đăng k&yacute;.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-Hounding2-41\">[41]</a></sup>&nbsp;Bản th&acirc;n Conan Doyle cũng nhận được v&ocirc; v&agrave;n thư phản đối, một phụ nữ thậm ch&iacute; c&ograve;n bắt đầu bức thư của m&igrave;nh bằng c&acirc;u &quot;Đồ s&uacute;c vật&quot;.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-Hounding2-41\">[41]</a></sup>&nbsp;C&oacute; giai thoại kể rằng khi nghe tin Holmes qua đời, người d&acirc;n Lu&acirc;n Đ&ocirc;n đ&atilde; tiếc thương tới mức đeo băng đen để tang cho anh. Kh&ocirc;ng c&oacute; nguồn tin đương thời n&agrave;o kiểm chứng giai thoại tr&ecirc;n, t&agrave;i liệu tham khảo sớm nhất li&ecirc;n quan tới c&aacute;c sự kiện tương tự, phải đến năm 1949 mới được biết đến.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-42\">[42]</a></sup>&nbsp;Tuy nhi&ecirc;n, phải thừa nhận rằng những phản ứng được ghi lại của c&ocirc;ng ch&uacute;ng d&agrave;nh cho c&aacute;i chết của Holmes kh&ocirc;ng giống với bất kỳ phản ứng n&agrave;o trước đ&acirc;y với c&aacute;c sự kiện hư cấu.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-:32-6\">[6]</a></sup></p>\n\n<p>Conan Doyle viết&nbsp;<em><a href=\"https://vi.wikipedia.org/wiki/The_Hound_of_the_Baskervilles\" title=\"The Hound of the Baskervilles\">Con ch&oacute; của d&ograve;ng họ Baskerville</a></em>&nbsp;(đăng nhiều kỳ v&agrave;o năm 1901&ndash;02, với bối cảnh ngầm hiểu l&agrave; trước khi Holmes qua đời) sau t&aacute;m năm phải chống chọi với &aacute;p lực dư luận. Năm 1903, &ocirc;ng viết &quot;Ng&ocirc;i nh&agrave; trống kh&ocirc;ng&quot; lấy bối cảnh năm 1894. Holmes xuất hiện trở lại, giải th&iacute;ch cho Watson trong sự sửng sốt rằng m&igrave;nh đ&atilde; giả chết để đ&aacute;nh lừa kẻ th&ugrave;.<sup><a href=\"https://vi.wikipedia.org/wiki/Sherlock_Holmes#cite_note-43\">[43]</a></sup>&nbsp;Sau &quot;Ng&ocirc;i nh&agrave; trống kh&ocirc;ng&quot;, Conan Doyle vẫn thường xuy&ecirc;n viết tiếp c&aacute;c t&aacute;c phẩm Sherlock Holmes cho đến năm 1927.</p>\n\n<p><a href=\"https://vi.wikipedia.org/wiki/T%E1%BA%ADp_tin:Sherlock_Holmes_blue_plaque_in_East_Dean.jpg\"><img alt=\"\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Sherlock_Holmes_blue_plaque_in_East_Dean.jpg/150px-Sherlock_Holmes_blue_plaque_in_East_Dean.jpg\" style=\"height:123px; width:150px\" /></a></p>\n\n<p>&nbsp;</p>\n', '<p>B&aacute;c Hồ lu&ocirc;n rất quan t&acirc;m đến việc hướng dẫn, gi&aacute;o dục thế hệ trẻ. Năm 1961, nh&acirc;n Lễ Kỉ niệm 20 năm Ng&agrave;y th&agrave;nh lập Đội, theo đề nghị của Trung ương Đo&agrave;n Thanh ni&ecirc;n Lao động Việt Nam, Chủ tịch Hồ Ch&iacute; Minh đ&atilde; gửi một bức thư cho thiếu ni&ecirc;n, nhi đồng.</p>\n\n<p>Trong thư B&aacute;c căn dặn: &ldquo;C&aacute;c ch&aacute;u cũng tham gia đấu tranh bằng c&aacute;ch thực hiện mấy điều sau đ&acirc;y:</p>\n\n<p>Y&ecirc;u Tổ quốc, y&ecirc;u đồng b&agrave;o</p>\n\n<p>Học tập tốt, lao động tốt</p>\n\n<p>Đo&agrave;n kết tốt, kỉ luật tốt</p>\n\n<p>Giữ g&igrave;n vệ sinh</p>\n\n<p>Thật th&agrave;, dũng cảm.&rdquo;</p>\n', '2021-05-28', '213921080912', 'book-images/rrZfDa1N9U8yoq3wYPFGjMmELTmfqbvsrpIknVxE.jpg', 6, 1, 0, 2000, 198, 'Tiếng Việt', '2021-05-11 01:49:57', '2021-05-12 21:31:42'),
(36, '1-783-24694-5', 'Ước mơ đến trường', 20000, 2, 4, 3, 1, '<p>B&aacute;c Hồ lu&ocirc;n rất quan t&acirc;m đến việc hướng dẫn, gi&aacute;o dục thế hệ trẻ. Năm 1961, nh&acirc;n Lễ Kỉ niệm 20 năm Ng&agrave;y th&agrave;nh lập Đội, theo đề nghị của Trung ương Đo&agrave;n Thanh ni&ecirc;n Lao động Việt Nam, Chủ tịch Hồ Ch&iacute; Minh đ&atilde; gửi một bức thư cho thiếu ni&ecirc;n, nhi đồng.</p>\n\n<p>Trong thư B&aacute;c căn dặn: &ldquo;C&aacute;c ch&aacute;u cũng tham gia đấu tranh bằng c&aacute;ch thực hiện mấy điều sau đ&acirc;y:</p>\n\n<p>Y&ecirc;u Tổ quốc, y&ecirc;u đồng b&agrave;o</p>\n\n<p>Học tập tốt, lao động tốt</p>\n\n<p>Đo&agrave;n kết tốt, kỉ luật tốt</p>\n\n<p>Giữ g&igrave;n vệ sinh</p>\n\n<p>Thật th&agrave;, dũng cảm.&rdquo;</p>\n\n<p>Trong bộ s&aacute;ch tr&agrave;n đầy &yacute; nghĩa v&agrave; t&igrave;nh y&ecirc;u thương n&agrave;y, ch&uacute;ng m&igrave;nh h&atilde;y c&ugrave;ng gặp gỡ những tấm gương thiếu ni&ecirc;n nhi đồng ti&ecirc;u biểu, l&agrave;m theo năm điều B&aacute;c dạy trong giai đoạn hiện đại n&agrave;y nh&eacute;!</p>\n', '<p>B&aacute;c Hồ lu&ocirc;n rất quan t&acirc;m đến việc hướng dẫn, gi&aacute;o dục thế hệ trẻ. Năm 1961, nh&acirc;n Lễ Kỉ niệm 20 năm Ng&agrave;y th&agrave;nh lập Đội, theo đề nghị của Trung ương Đo&agrave;n Thanh ni&ecirc;n Lao động Việt Nam, Chủ tịch Hồ Ch&iacute; Minh đ&atilde; gửi một bức thư cho thiếu ni&ecirc;n, nhi đồng.</p>\n\n<p>Trong thư B&aacute;c căn dặn: &ldquo;C&aacute;c ch&aacute;u cũng tham gia đấu tranh bằng c&aacute;ch thực hiện mấy điều sau đ&acirc;y:</p>\n\n<p>Y&ecirc;u Tổ quốc, y&ecirc;u đồng b&agrave;o</p>\n\n<p>Học tập tốt, lao động tốt</p>\n\n<p>Đo&agrave;n kết tốt, kỉ luật tốt</p>\n\n<p>Giữ g&igrave;n vệ sinh</p>\n\n<p>Thật th&agrave;, dũng cảm.&rdquo;</p>\n\n<p>Trong bộ s&aacute;ch tr&agrave;n đầy &yacute; nghĩa v&agrave; t&igrave;nh y&ecirc;u thương n&agrave;y, ch&uacute;ng m&igrave;nh h&atilde;y c&ugrave;ng gặp gỡ những tấm gương thiếu ni&ecirc;n nhi đồng ti&ecirc;u biểu, l&agrave;m theo năm điều B&aacute;c dạy trong giai đoạn hiện đại n&agrave;y nh&eacute;!</p>\n', '2021-05-19', '82132131232', 'book-images/VNFRDmBiB6RJRB5NUG7p6OFZFMbONIecmb3CdRzx.jpg', 1, 1, 0, 2000, 126, 'Tiếng Việt', '2021-05-11 01:52:34', '2021-05-12 03:06:27');
INSERT INTO `books` (`id`, `isbn`, `name`, `price`, `category_id`, `author_id`, `publisher_id`, `reprint_of_book`, `description`, `content`, `year_of_publication`, `license`, `image`, `view`, `recommend`, `best_seller`, `stock`, `page_number`, `language`, `created_at`, `updated_at`) VALUES
(38, '0-747-35834-4', 'Đi học', 21223, 3, 4, 2, 12, '<p>B&aacute;c Hồ lu&ocirc;n rất quan t&acirc;m đến việc hướng dẫn, gi&aacute;o dục thế hệ trẻ. Năm 1961, nh&acirc;n Lễ Kỉ niệm 20 năm Ng&agrave;y th&agrave;nh lập Đội, theo đề nghị của Trung ương Đo&agrave;n Thanh ni&ecirc;n Lao động Việt Nam, Chủ tịch Hồ Ch&iacute; Minh đ&atilde; gửi một bức thư cho thiếu ni&ecirc;n, nhi đồng. &nbsp;Trong thư B&aacute;c căn dặn: &ldquo;C&aacute;c ch&aacute;u cũng tham gia đấu tranh bằng c&aacute;ch thực hiện mấy điều sau đ&acirc;y: &nbsp;Y&ecirc;u Tổ quốc, y&ecirc;u đồng b&agrave;o &nbsp;Học tập tốt, lao động tốt &nbsp;Đo&agrave;n kết tốt, kỉ luật tốt &nbsp;Giữ g&igrave;n vệ sinh &nbsp;Thật th&agrave;, dũng cảm.&rdquo; &nbsp;Trong bộ s&aacute;ch tr&agrave;n đầy &yacute; nghĩa v&agrave; t&igrave;nh y&ecirc;u thương n&agrave;y, ch&uacute;ng m&igrave;nh h&atilde;y c&ugrave;ng gặp gỡ những tấm gương thiếu ni&ecirc;n nhi đồng ti&ecirc;u biểu, l&agrave;m theo năm điều B&aacute;c dạy trong giai đoạn hiện đại n&agrave;y nh&eacute;!B&aacute;c Hồ lu&ocirc;n rất quan t&acirc;m đến việc hướng dẫn, gi&aacute;o dục thế hệ trẻ. Năm 1961, nh&acirc;n Lễ Kỉ niệm 20 năm Ng&agrave;y th&agrave;nh lập Đội, theo đề nghị của Trung ương Đo&agrave;n Thanh ni&ecirc;n Lao động Việt Nam, Chủ tịch Hồ Ch&iacute; Minh đ&atilde; gửi một bức thư cho thiếu ni&ecirc;n, nhi đồng. &nbsp;Trong thư B&aacute;c căn dặn: &ldquo;C&aacute;c ch&aacute;u cũng tham gia đấu tranh bằng c&aacute;ch thực hiện mấy điều sau đ&acirc;y: &nbsp;Y&ecirc;u Tổ quốc, y&ecirc;u đồng b&agrave;o &nbsp;Học tập tốt, lao động tốt &nbsp;Đo&agrave;n kết tốt, kỉ luật tốt &nbsp;Giữ g&igrave;n vệ sinh &nbsp;Thật th&agrave;, dũng cảm.&rdquo; &nbsp;Trong bộ s&aacute;ch tr&agrave;n đầy &yacute; nghĩa v&agrave; t&igrave;nh y&ecirc;u thương n&agrave;y, ch&uacute;ng m&igrave;nh h&atilde;y c&ugrave;ng gặp gỡ những tấm gương thiếu ni&ecirc;n nhi đồng ti&ecirc;u biểu, l&agrave;m theo năm điều B&aacute;c dạy trong giai đoạn hiện đại n&agrave;y nh&eacute;!B&aacute;c Hồ lu&ocirc;n rất quan t&acirc;m đến việc hướng dẫn, gi&aacute;o dục thế hệ trẻ. Năm 1961, nh&acirc;n Lễ Kỉ niệm 20 năm Ng&agrave;y th&agrave;nh lập Đội, theo đề nghị của Trung ương Đo&agrave;n Thanh ni&ecirc;n Lao động Việt Nam, Chủ tịch Hồ Ch&iacute; Minh đ&atilde; gửi một bức thư cho thiếu ni&ecirc;n, nhi đồng. &nbsp;Trong thư B&aacute;c căn dặn: &ldquo;C&aacute;c ch&aacute;u cũng tham gia đấu tranh bằng c&aacute;ch thực hiện mấy điều sau đ&acirc;y: &nbsp;Y&ecirc;u Tổ quốc, y&ecirc;u đồng b&agrave;o &nbsp;Học tập tốt, lao động tốt &nbsp;Đo&agrave;n kết tốt, kỉ luật tốt &nbsp;Giữ g&igrave;n vệ sinh &nbsp;Thật th&agrave;, dũng cảm.&rdquo; &nbsp;Trong bộ s&aacute;ch tr&agrave;n đầy &yacute; nghĩa v&agrave; t&igrave;nh y&ecirc;u thương n&agrave;y, ch&uacute;ng m&igrave;nh h&atilde;y c&ugrave;ng gặp gỡ những tấm gương thiếu ni&ecirc;n nhi đồng ti&ecirc;u biểu, l&agrave;m theo năm điều B&aacute;c dạy trong giai đoạn hiện đại n&agrave;y nh&eacute;!B&aacute;c Hồ lu&ocirc;n rất quan t&acirc;m đến việc hướng dẫn, gi&aacute;o dục thế hệ trẻ. Năm 1961, nh&acirc;n Lễ Kỉ niệm 20 năm Ng&agrave;y th&agrave;nh lập Đội, theo đề nghị của Trung ương Đo&agrave;n Thanh ni&ecirc;n Lao động Việt Nam, Chủ tịch Hồ Ch&iacute; Minh đ&atilde; gửi một bức thư cho thiếu ni&ecirc;n, nhi đồng. &nbsp;Trong thư B&aacute;c căn dặn: &ldquo;C&aacute;c ch&aacute;u cũng tham gia đấu tranh bằng c&aacute;ch thực hiện mấy điều sau đ&acirc;y: &nbsp;Y&ecirc;u Tổ quốc, y&ecirc;u đồng b&agrave;o &nbsp;Học tập tốt, lao động tốt &nbsp;Đo&agrave;n kết tốt, kỉ luật tốt &nbsp;Giữ g&igrave;n vệ sinh &nbsp;Thật th&agrave;, dũng cảm.&rdquo; &nbsp;Trong bộ s&aacute;ch tr&agrave;n đầy &yacute; nghĩa v&agrave; t&igrave;nh y&ecirc;u thương n&agrave;y, ch&uacute;ng m&igrave;nh h&atilde;y c&ugrave;ng gặp gỡ những tấm gương thiếu ni&ecirc;n nhi đồng ti&ecirc;u biểu, l&agrave;m theo năm điều B&aacute;c dạy trong giai đoạn hiện đại n&agrave;y nh&eacute;!</p>\n', '<p>B&aacute;c Hồ lu&ocirc;n rất quan t&acirc;m đến việc hướng dẫn, gi&aacute;o dục thế hệ trẻ. Năm 1961, nh&acirc;n Lễ Kỉ niệm 20 năm Ng&agrave;y th&agrave;nh lập Đội, theo đề nghị của Trung ương Đo&agrave;n Thanh ni&ecirc;n Lao động Việt Nam, Chủ tịch Hồ Ch&iacute; Minh đ&atilde; gửi một bức thư cho thiếu ni&ecirc;n, nhi đồng. &nbsp;Trong thư B&aacute;c căn dặn: &ldquo;C&aacute;c ch&aacute;u cũng tham gia đấu tranh bằng c&aacute;ch thực hiện mấy điều sau đ&acirc;y: &nbsp;Y&ecirc;u Tổ quốc, y&ecirc;u đồng b&agrave;o &nbsp;Học tập tốt, lao động tốt &nbsp;Đo&agrave;n kết tốt, kỉ luật tốt &nbsp;Giữ g&igrave;n vệ sinh &nbsp;Thật th&agrave;, dũng cảm.&rdquo; &nbsp;Trong bộ s&aacute;ch tr&agrave;n đầy &yacute; nghĩa v&agrave; t&igrave;nh y&ecirc;u thương n&agrave;y, ch&uacute;ng m&igrave;nh h&atilde;y c&ugrave;ng gặp gỡ những tấm gương thiếu ni&ecirc;n nhi đồng ti&ecirc;u biểu, l&agrave;m theo năm điều B&aacute;c dạy trong giai đoạn hiện đại n&agrave;y nh&eacute;!B&aacute;c Hồ lu&ocirc;n rất quan t&acirc;m đến việc hướng dẫn, gi&aacute;o dục thế hệ trẻ. Năm 1961, nh&acirc;n Lễ Kỉ niệm 20 năm Ng&agrave;y th&agrave;nh lập Đội, theo đề nghị của Trung ương Đo&agrave;n Thanh ni&ecirc;n Lao động Việt Nam, Chủ tịch Hồ Ch&iacute; Minh đ&atilde; gửi một bức thư cho thiếu ni&ecirc;n, nhi đồng. &nbsp;Trong thư B&aacute;c căn dặn: &ldquo;C&aacute;c ch&aacute;u cũng tham gia đấu tranh bằng c&aacute;ch thực hiện mấy điều sau đ&acirc;y: &nbsp;Y&ecirc;u Tổ quốc, y&ecirc;u đồng b&agrave;o &nbsp;Học tập tốt, lao động tốt &nbsp;Đo&agrave;n kết tốt, kỉ luật tốt &nbsp;Giữ g&igrave;n vệ sinh &nbsp;Thật th&agrave;, dũng cảm.&rdquo; &nbsp;Trong bộ s&aacute;ch tr&agrave;n đầy &yacute; nghĩa v&agrave; t&igrave;nh y&ecirc;u thương n&agrave;y, ch&uacute;ng m&igrave;nh h&atilde;y c&ugrave;ng gặp gỡ những tấm gương thiếu ni&ecirc;n nhi đồng ti&ecirc;u biểu, l&agrave;m theo năm điều B&aacute;c dạy trong giai đoạn hiện đại n&agrave;y nh&eacute;!B&aacute;c Hồ lu&ocirc;n rất quan t&acirc;m đến việc hướng dẫn, gi&aacute;o dục thế hệ trẻ. Năm 1961, nh&acirc;n Lễ Kỉ niệm 20 năm Ng&agrave;y th&agrave;nh lập Đội, theo đề nghị của Trung ương Đo&agrave;n Thanh ni&ecirc;n Lao động Việt Nam, Chủ tịch Hồ Ch&iacute; Minh đ&atilde; gửi một bức thư cho thiếu ni&ecirc;n, nhi đồng. &nbsp;Trong thư B&aacute;c căn dặn: &ldquo;C&aacute;c ch&aacute;u cũng tham gia đấu tranh bằng c&aacute;ch thực hiện mấy điều sau đ&acirc;y: &nbsp;Y&ecirc;u Tổ quốc, y&ecirc;u đồng b&agrave;o &nbsp;Học tập tốt, lao động tốt &nbsp;Đo&agrave;n kết tốt, kỉ luật tốt &nbsp;Giữ g&igrave;n vệ sinh &nbsp;Thật th&agrave;, dũng cảm.&rdquo; &nbsp;Trong bộ s&aacute;ch tr&agrave;n đầy &yacute; nghĩa v&agrave; t&igrave;nh y&ecirc;u thương n&agrave;y, ch&uacute;ng m&igrave;nh h&atilde;y c&ugrave;ng gặp gỡ những tấm gương thiếu ni&ecirc;n nhi đồng ti&ecirc;u biểu, l&agrave;m theo năm điều B&aacute;c dạy trong giai đoạn hiện đại n&agrave;y nh&eacute;!B&aacute;c Hồ lu&ocirc;n rất quan t&acirc;m đến việc hướng dẫn, gi&aacute;o dục thế hệ trẻ. Năm 1961, nh&acirc;n Lễ Kỉ niệm 20 năm Ng&agrave;y th&agrave;nh lập Đội, theo đề nghị của Trung ương Đo&agrave;n Thanh ni&ecirc;n Lao động Việt Nam, Chủ tịch Hồ Ch&iacute; Minh đ&atilde; gửi một bức thư cho thiếu ni&ecirc;n, nhi đồng. &nbsp;Trong thư B&aacute;c căn dặn: &ldquo;C&aacute;c ch&aacute;u cũng tham gia đấu tranh bằng c&aacute;ch thực hiện mấy điều sau đ&acirc;y: &nbsp;Y&ecirc;u Tổ quốc, y&ecirc;u đồng b&agrave;o &nbsp;Học tập tốt, lao động tốt &nbsp;Đo&agrave;n kết tốt, kỉ luật tốt &nbsp;Giữ g&igrave;n vệ sinh &nbsp;Thật th&agrave;, dũng cảm.&rdquo; &nbsp;Trong bộ s&aacute;ch tr&agrave;n đầy &yacute; nghĩa v&agrave; t&igrave;nh y&ecirc;u thương n&agrave;y, ch&uacute;ng m&igrave;nh h&atilde;y c&ugrave;ng gặp gỡ những tấm gương thiếu ni&ecirc;n nhi đồng ti&ecirc;u biểu, l&agrave;m theo năm điều B&aacute;c dạy trong giai đoạn hiện đại n&agrave;y nh&eacute;!</p>\n', '2021-05-10', '123123123', 'book-images/R9IFyijkOLBepHvphLOSHZlfFuudqbSMokvDiNHu.jpg', 0, 0, 1, 222, 100, 'Tiếng việt', '2021-05-11 02:10:47', '2021-05-11 02:10:47'),
(39, '0-352-50526-5', 'Vừ A Dính', 20000, 10, 7, 3, 2, '<p>M&ugrave;a thu năm 1934, Vừ A D&iacute;nh sinh ra trong nếp nh&agrave; giản dị của gia đ&igrave;nh d&acirc;n tộc H&rsquo;m&ocirc;ng tại x&atilde; P&uacute; Nhung, huyện Tuần Gi&aacute;o, tỉnh Lai Ch&acirc;u (nay thuộc tỉnh Điện Bi&ecirc;n). Mới hơn mười tuổi, nhưng Vừ A D&iacute;nh đ&atilde; biết gi&uacute;p cha đi săn th&uacute;, gi&uacute;p mẹ l&agrave;m nương. Phải tận mắt chứng kiến tội &aacute;c của lũ giặc, A D&iacute;nh căm th&ugrave; ch&uacute;ng lắm. A D&iacute;nh thường theo c&aacute;c anh lớn đi canh g&aacute;c, l&agrave;m th&ocirc;ng tin li&ecirc;n lạc cho c&aacute;c anh chị du k&iacute;ch trong bản.</p>\n\n<p>&nbsp;</p>\n', '<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>Nhưng nỗi đau mất mẹ c&ugrave;ng những người th&acirc;n y&ecirc;u bởi họng s&uacute;ng bọn giặc th&ugrave; đ&atilde; nung nấu trong l&ograve;ng A D&iacute;nh &yacute; ch&iacute; chiến đấu quật cường v&agrave; tinh thần sắt đ&aacute; trước kẻ th&ugrave;.</p>\n\n<p>T&ecirc;n tuổi Vừ A D&iacute;nh sẽ s&aacute;ng m&atilde;i trong lịch sử Đội ta, l&agrave; tấm gương để lớp lớp Đội vi&ecirc;n ch&uacute;ng ta tự h&agrave;o v&agrave; noi theo.</p>\n', '2021-05-29', '12312323', 'book-images/yvL2wU969FaI2yo821LH79R6ytM2oFY86guCipVq.jpg', 1, 1, 0, 2000, 200, 'Tiếng Việt', '2021-05-11 02:33:52', '2021-05-12 03:06:30'),
(40, '1-295-38054-3', 'Tuổi nhỏ chí cao ', 50000, 10, 5, 2, 1, '<p>Kh&ocirc;ng kể về những gương lớn khắp nơi đều biết, tập s&aacute;ch ch&eacute;p nhiều chuyện c&oacute; thật, với những nh&acirc;n vật thậm ch&iacute; kh&ocirc;ng r&otilde; t&ecirc;n, nhằm ghi nhận đ&oacute;ng g&oacute;p của thiếu nhi trong kh&aacute;ng chiến, từ Bắc tới Nam, ở bất cứ nơi đ&acirc;u, tưởng như kh&ocirc;ng bao giờ hết.</p>\n\n<p>&nbsp;</p>\n\n<p>Với gần ba mươi c&acirc;u chuyện nho nhỏ, ngắn gọn, giản dị, nhưng &yacute; nghĩa, phản &aacute;nh tinh thần y&ecirc;u nước, &yacute; ch&iacute; bất khuất ki&ecirc;n cường, quyết t&acirc;m học tập, chăm ngoan&hellip; Tuổi nhỏ ch&iacute; cao của nh&agrave; văn T&ocirc; Ho&agrave;i c&oacute; thể xem l&agrave; tập tư liệu qu&yacute;, gi&uacute;p bạn đọc hiểu th&ecirc;m về truyền thống c&aacute;ch mạng của thiếu nhi Việt Nam trong khoảng những năm 1945 &minus; 1950.</p>\n\n<p>&nbsp;</p>\n', '<p>Kh&ocirc;ng kể về những gương lớn khắp nơi đều biết, tập s&aacute;ch ch&eacute;p nhiều chuyện c&oacute; thật, với những nh&acirc;n vật thậm ch&iacute; kh&ocirc;ng r&otilde; t&ecirc;n, nhằm ghi nhận đ&oacute;ng g&oacute;p của thiếu nhi trong kh&aacute;ng chiến, từ Bắc tới Nam, ở bất cứ nơi đ&acirc;u, tưởng như kh&ocirc;ng bao giờ hết.</p>\n\n<p>Với gần ba mươi c&acirc;u chuyện nho nhỏ, ngắn gọn, giản dị, nhưng &yacute; nghĩa, phản &aacute;nh tinh thần y&ecirc;u nước, &yacute; ch&iacute; bất khuất ki&ecirc;n cường, quyết t&acirc;m học tập, chăm ngoan&hellip; Tuổi nhỏ ch&iacute; cao của nh&agrave; văn T&ocirc; Ho&agrave;i c&oacute; thể xem l&agrave; tập tư liệu qu&yacute;, gi&uacute;p bạn đọc hiểu th&ecirc;m về truyền thống c&aacute;ch mạng của thiếu nhi Việt Nam trong khoảng những năm 1945 &minus; 1950.</p>\n\n<p>&nbsp;</p>\n', '2021-05-05', '12321332', 'book-images/DtUT7ehxUHxdnZkjJmHwIw0JiksmelCwlytEEIuU.jpg', 17, 0, 1, 3000, 198, 'Tiếng Việt', '2021-05-11 02:47:50', '2021-05-12 23:44:33'),
(41, '1-205-90048-6', 'Số đỏ', 20000, 10, 7, 4, 2, '<p>Bằng ng&ograve;i b&uacute;t tr&agrave;o ph&uacute;ng độc đ&aacute;o, Số đỏ l&ecirc;n &aacute;n gay gắt c&aacute;i x&atilde; hội tư sản th&agrave;nh thị Việt nam đang chạy theo lối sống văn minh rởm hết sức lố lăng đồi bại đương thời. T&aacute;c giả đ&atilde; đả k&iacute;ch cay độc c&aacute;c phong tr&agrave;o &quot;&Acirc;u h&oacute;a&quot;, &quot;thể thao&quot;, &quot;giải ph&oacute;ng nữ quyền&quot; đang ph&aacute;t triển rầm rộ khi ấy, nh&acirc;n danh &quot;văn minh&quot;, &quot;tiến bộ&quot;, &quot;cải c&aacute;ch x&atilde; hội&quot; m&agrave; thực chất chỉ l&agrave; ăn chơi trụy lạc, l&agrave;m tiền, ch&agrave; đạp trắng trợn l&ecirc;n mọi nền nếp đạo đức truyền thống...Số đỏ tuy chỉ tập trung ph&ecirc; ph&aacute;n x&atilde; hội tư sản về phương diện đạo đức, sinh hoạt-đ&acirc;y l&agrave; một hạn chế - song t&aacute;c phẩm vẫn c&oacute; m&agrave;u sắc ch&iacute;nh trị thời sự v&agrave; c&oacute; t&iacute;nh chiến đấu r&otilde; rệt...Tuy nhi&ecirc;n, sự phản &aacute;nh hiện thực của Số đỏ c&oacute; rộng song chưa thật s&acirc;u. Trong khi lật mặt bọn bịp bợm giả danh &quot;b&igrave;nh d&acirc;n&quot;, &iacute;t nhiều nh&agrave; văn vẫn để lộ c&aacute;i nh&igrave;n miệt thị đối với quần ch&uacute;ng lao động. Quan điểm sinh l&yacute; th&ocirc; bạo - ảnh hưởng của học thuyết Phrơt- khi giải th&iacute;ch &quot;c&aacute;i d&acirc;m của lo&agrave;i người&quot; v&agrave; sự mi&ecirc;u tả c&oacute; phần sống sượng đ&acirc;y đ&oacute;, cũng hạn chế chiều s&acirc;u nhận thức v&agrave; sức tố c&aacute;o của t&aacute;c phẩm.<br />\n&nbsp;</p>\n', '<p>Truyện d&agrave;i 20 chương v&agrave; được bắt đầu khi b&agrave; Ph&oacute; Đoan đến chơi ở s&acirc;n quần vợt nơi Xu&acirc;n t&oacute;c đỏ l&agrave;m việc. V&ocirc; t&igrave;nh Xu&acirc;n t&oacute;c đỏ v&igrave; xem trộm 1 c&ocirc; đầm thay đồ n&ecirc;n bị cảnh s&aacute;t bắt giam v&agrave; được b&agrave; Ph&oacute; Đoan bảo l&atilde;nh. Sau đ&oacute;, b&agrave; Ph&oacute; Đoan giới thiệu Xu&acirc;n đến l&agrave;m việc ở tiệm may &Acirc;u H&oacute;a, từ đ&oacute; Xu&acirc;n bắt đầu tham gia v&agrave;o việc cải c&aacute;ch x&atilde; hội. Nhờ thuộc l&ograve;ng những b&agrave;i quảng c&aacute;o thuốc lậu, hắn được vợ chồng Văn Minh gọi l&agrave; &quot;sinh vi&ecirc;n trường thuốc&quot;, &quot;đốc tờ Xu&acirc;n&quot;. Hắn gia nhập x&atilde; hội thượng lưu, quen với những người gi&agrave;u v&agrave; c&oacute; thế lực, quyến rũ được c&ocirc; Tuyết v&agrave; ph&aacute;t hiện c&ocirc; Ho&agrave;ng H&ocirc;n ngoại t&igrave;nh. Xu&acirc;n c&ograve;n được b&agrave; Ph&oacute; Đoan nhờ dạy dỗ cậu Phước, được nh&agrave; sư Tăng Ph&uacute; mời l&agrave;m cố vấn cho b&aacute;o G&otilde; M&otilde;. V&igrave; v&ocirc; t&igrave;nh, hắn g&acirc;y ra c&aacute;i chết cho cụ cố tổ n&ecirc;n được mọi người mang ơn. Văn Minh v&igrave; nghĩ ơn của Xu&acirc;n n&ecirc;n dẫn Xu&acirc;n đi x&oacute;a bỏ l&yacute; lịch trước kia rồi đăng k&yacute; đi tranh giải quần vợt nh&acirc;n dịp vua Xi&ecirc;m đến Bắc K&igrave;. Bằng thủ đoạn xảo tr&aacute;, hắn l&agrave;m 2 vận động vi&ecirc;n qu&aacute;n qu&acirc;n bị bắt ngay trước h&ocirc;m thi đấu n&ecirc;n Xu&acirc;n được dịp thi t&agrave;i với qu&aacute;n qu&acirc;n Xi&ecirc;m. V&igrave; để giữ t&igrave;nh giao hảo, hắn được lệnh phải thua. Kết th&uacute;c trận đấu, khi bị đ&aacute;m đ&ocirc;ng phản đối, Xu&acirc;n h&ugrave;ng hồn diễn thuyết cho đ&aacute;m đ&ocirc;ng d&acirc;n ch&uacute;ng hiểu h&agrave;nh động &quot;hy sinh v&igrave; tổ quốc của m&igrave;nh&quot;, được mời v&agrave;o hội Khai tr&iacute; tiến đức, được nhận hu&acirc;n chương Bắc Đẩu bội tinh v&agrave; cuối c&ugrave;ng trở th&agrave;nh con rể cụ cố Hồng.</p>\n', '2021-05-19', 'sjfdf76sdf', 'book-images/5dKXY1LB9lSmHHu01mjtxedf4g42Uh3V073yL1fW.jpg', 1, 0, 1, 2000, 176, 'Tiếng Việt', '2021-05-12 20:19:25', '2021-05-12 21:31:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `book_id` bigint UNSIGNED NOT NULL,
  `book_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_price` double NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `book_id`, `book_name`, `image`, `book_price`, `quantity`, `created_at`, `updated_at`, `total_price`) VALUES
(12, 3, 40, 'Tuổi nhỏ chí cao ', 'book-images/DtUT7ehxUHxdnZkjJmHwIw0JiksmelCwlytEEIuU.jpg', 50000, 1, '2021-05-12 03:47:34', '2021-05-12 03:47:34', 50000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` bigint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'Kinh điển', 20001, '2021-05-02 07:45:09', '2021-05-09 19:26:26'),
(2, 'Truyện ngắn', 20000, '2021-05-02 07:45:10', '2021-05-11 01:52:34'),
(3, 'Tiểu thuyết', 3224, '2021-05-02 07:45:10', '2021-05-11 02:10:47'),
(4, 'Nấu ăn', 100, '2021-05-02 07:45:10', '2021-05-11 02:18:03'),
(9, 'Kinh dị', 7000, '2021-05-04 21:29:16', '2021-05-12 07:10:32'),
(10, 'Kỹ năng sống', 12999, '2021-05-04 21:30:29', '2021-05-12 20:19:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `demo`
-- (See below for the actual view)
--
CREATE TABLE `demo` (
`name` varchar(255)
,`quantity` bigint unsigned
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_02_012559_create_authors_table', 1),
(5, '2021_05_02_012623_create_categories_table', 1),
(6, '2021_05_02_012640_create_books_table', 1),
(7, '2021_05_02_021116_create_publishers_table', 1),
(8, '2021_05_02_021206_add_fk_books_table', 1),
(9, '2021_05_02_032816_add_column_price_books_table', 1),
(10, '2021_05_07_034819_remove_collumn_birth_death_authors_table', 2),
(11, '2021_05_07_035141_add_collumn_authors_table', 3),
(12, '2021_05_08_084623_create_v_books_views', 4),
(13, '2021_05_10_081311_create_customers_table', 5),
(14, '2021_05_10_144941_add_column_users_table', 5),
(15, '2021_05_10_151005_create_carts_table', 5),
(16, '2021_05_10_232931_add_column_image_carts_table', 5),
(17, '2021_05_11_014955_add_column_ifo_users_table', 5),
(18, '2021_05_11_143654_add_column_total_price_carts_table', 6),
(19, '2021_05_12_020942_create_orders_table', 6),
(20, '2021_05_12_022420_create_orderdetail_table', 6),
(21, '2021_05_12_023021_add_column_des_orders_table', 6),
(22, '2021_05_12_081937_add_column_ms_orders_table', 7),
(23, '2021_05_12_091135_create_v_oders_table', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `book_id` bigint UNSIGNED NOT NULL,
  `quantity` bigint UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `order_id`, `book_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 39, 3, 60000.00, '2021-05-11 23:54:03', '2021-05-11 23:54:03'),
(2, 1, 40, 1, 50000.00, '2021-05-11 23:54:03', '2021-05-11 23:54:03'),
(3, 1, 38, 1, 21223.00, '2021-05-11 23:54:03', '2021-05-11 23:54:03'),
(4, 1, 36, 1, 20000.00, '2021-05-11 23:54:03', '2021-05-11 23:54:03'),
(5, 2, 39, 1, 20000.00, '2021-05-11 23:54:31', '2021-05-11 23:54:31'),
(6, 2, 38, 1, 21223.00, '2021-05-11 23:54:31', '2021-05-11 23:54:31'),
(7, 3, 40, 1, 50000.00, '2021-05-12 01:39:34', '2021-05-12 01:39:34'),
(8, 3, 39, 1, 20000.00, '2021-05-12 01:39:34', '2021-05-12 01:39:34'),
(9, 7, 40, 1, 50000.00, '2021-05-12 03:49:49', '2021-05-12 03:49:49'),
(10, 7, 39, 1, 20000.00, '2021-05-12 03:49:49', '2021-05-12 03:49:49'),
(11, 8, 39, 1, 20000.00, '2021-05-12 18:15:48', '2021-05-12 18:15:48'),
(12, 8, 38, 1, 21223.00, '2021-05-12 18:15:48', '2021-05-12 18:15:48'),
(13, 8, 32, 1, 20000.00, '2021-05-12 18:15:48', '2021-05-12 18:15:48'),
(14, 8, 40, 2, 100000.00, '2021-05-12 18:15:48', '2021-05-12 18:15:48'),
(15, 9, 40, 1, 50000.00, '2021-05-12 20:15:58', '2021-05-12 20:15:58'),
(16, 9, 39, 1, 20000.00, '2021-05-12 20:15:58', '2021-05-12 20:15:58'),
(17, 9, 34, 1, 77000.00, '2021-05-12 20:15:58', '2021-05-12 20:15:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `order_date` date NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `des` text COLLATE utf8mb4_unicode_ci,
  `ms` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `amount`, `order_date`, `status`, `created_at`, `updated_at`, `des`, `ms`) VALUES
(1, 3, 151223, '2021-05-12', 'Đang xử lý', '2021-05-11 23:54:03', '2021-05-11 23:54:03', 't muon nhan buoi sang', 'jhka343234'),
(2, 3, 41223, '2021-05-12', 'Đang xử lý', '2021-05-11 23:54:31', '2021-05-11 23:54:31', NULL, 'sadasj3243'),
(3, 3, 70000, '2021-05-12', 'Đang xử lý', '2021-05-12 01:39:34', '2021-05-12 01:39:34', NULL, 'cthQp70113'),
(4, 3, 324324, '2000-01-02', 'Đang xử lý ', '2021-05-12 02:52:47', '2021-05-12 02:52:47', 'Tôi muốn nhận vào giữa trưa', 'othQp72113'),
(5, 3, 4000, '2000-06-02', 'Đang xử lý ', '2021-05-12 02:52:47', '2021-05-12 02:52:47', 'Tôi muốn nhận vào tối', 'nthQp72158'),
(6, 3, 90000, '2002-07-07', 'Đang xử lý ', '2021-05-12 02:52:47', '2021-05-12 02:52:47', 'Tôi muốn nhận vào ngày kia', 'lthQp12990'),
(7, 4, 70000, '2021-05-12', 'Đang xử lý', '2021-05-12 03:49:49', '2021-05-12 03:49:49', NULL, 'viLhQ90584'),
(8, 6, 161223, '2021-05-13', 'Hủy đơn hàng', '2021-05-12 18:15:48', '2021-05-12 18:15:57', NULL, 'ejqkO44316'),
(9, 6, 147000, '2021-05-13', 'Hủy đơn hàng', '2021-05-12 20:15:58', '2021-05-12 20:16:27', 'Tôi muốn nhận vào sáng mai nhân viên giao hàng phải là nữ thì mới nhận.', 'IaaXL23436');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `publishers`
--

CREATE TABLE `publishers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `publishers`
--

INSERT INTO `publishers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'NXB kim đồng', '2021-05-02 07:45:28', '2021-05-02 07:45:28'),
(2, 'NXB giáo dục', '2021-05-02 07:45:28', '2021-05-02 07:45:28'),
(3, 'NXB thời đại', '2021-05-02 07:45:28', '2021-05-02 07:45:28'),
(4, 'NXB khoa học và kỹ thuật', '2021-05-02 07:45:28', '2021-05-02 07:45:28'),
(5, 'NXB Kim Đồng', '2021-05-02 07:45:29', '2021-05-02 07:45:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `address`, `phone`) VALUES
(1, 'admin', 'admin@gmail.com', 1, NULL, '$2y$10$BPBbfwx6aw38dKIakFfSrejM/5Wpn7XOLuPjvJlZDL43GQULHxJ7K', NULL, '2021-05-02 07:44:45', '2021-05-02 07:44:45', NULL, NULL),
(2, 'editor', 'editor@gmail.com', 1, NULL, '$2y$10$jn57i6Q5kFf6dc7pTHexSuXS2teUXfTdAqk1/h/31jSrRygqRl6JK', NULL, '2021-05-02 07:44:46', '2021-05-02 07:44:46', NULL, NULL),
(3, 'guest', 'guest@gmail.com', 0, NULL, '$2y$10$ghhUye8hJ1naPTd/0n9x4e0WnDLKcvN2/mmpH4IyzAe9GVZiDDd5y', NULL, '2021-05-02 07:44:46', '2021-05-02 07:44:46', NULL, NULL),
(4, 'thang', 'thang@gmail.com', 0, NULL, '$2y$10$lHSl15TAtliVNvseSn4UPeKYYDtR7zg1/9/BfCI8wdM.vndSkmPIW', NULL, NULL, NULL, 'ha noi', '0981111111'),
(5, 'hung', 'hung@gmail.com', 0, NULL, '$2y$10$XtI/cI8KS9VaIpLaNEH5UenGoKdj.bGvlqu8n8r5g9TCHId3txAly', NULL, NULL, NULL, 'ha noi', '0981111222'),
(6, 'tuan', 'tuan@gmail.com', 0, NULL, '$2y$10$A1BH3T1z9BKpAfwcN8zH2uauBTmYRtf4c/lJPdn83aHYSl9TI2LHi', NULL, NULL, NULL, 'ha noi', '0981111333');

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `v_books`
-- (See below for the actual view)
--
CREATE TABLE `v_books` (
`author_id` bigint unsigned
,`author_name` varchar(255)
,`best_seller` int
,`category_id` bigint unsigned
,`category_name` varchar(255)
,`content` text
,`created_at` timestamp
,`description` text
,`id` bigint unsigned
,`image` varchar(255)
,`isbn` varchar(255)
,`language` varchar(255)
,`license` varchar(255)
,`name` varchar(255)
,`page_number` bigint unsigned
,`price` double
,`publisher_id` bigint unsigned
,`publisher_name` varchar(255)
,`recommend` int
,`reprint_of_book` int
,`stock` bigint unsigned
,`updated_at` timestamp
,`view` bigint unsigned
,`year_of_publication` date
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `v_oders`
-- (See below for the actual view)
--
CREATE TABLE `v_oders` (
`amount` double
,`book_id` bigint unsigned
,`book_quantiy` bigint unsigned
,`created_at` timestamp
,`des` text
,`id` bigint unsigned
,`ms` varchar(255)
,`name` varchar(255)
,`order_date` date
,`price` double(8,2)
,`status` varchar(255)
,`updated_at` timestamp
,`user_address` varchar(255)
,`user_email` varchar(255)
,`user_id` bigint unsigned
,`user_name` varchar(255)
,`user_phone` varchar(255)
);

-- --------------------------------------------------------

--
-- Cấu trúc cho view `demo`
--
DROP TABLE IF EXISTS `demo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `demo`  AS SELECT `books`.`name` AS `name`, `authors`.`quantity` AS `quantity` FROM (`books` join `authors` on((`books`.`author_id` = `authors`.`id`))) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `v_books`
--
DROP TABLE IF EXISTS `v_books`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_books`  AS SELECT `books`.`id` AS `id`, `books`.`isbn` AS `isbn`, `books`.`name` AS `name`, `books`.`price` AS `price`, `books`.`category_id` AS `category_id`, `books`.`author_id` AS `author_id`, `books`.`publisher_id` AS `publisher_id`, `books`.`reprint_of_book` AS `reprint_of_book`, `books`.`description` AS `description`, `books`.`content` AS `content`, `books`.`year_of_publication` AS `year_of_publication`, `books`.`license` AS `license`, `books`.`image` AS `image`, `books`.`view` AS `view`, `books`.`recommend` AS `recommend`, `books`.`best_seller` AS `best_seller`, `books`.`stock` AS `stock`, `books`.`page_number` AS `page_number`, `books`.`language` AS `language`, `books`.`created_at` AS `created_at`, `books`.`updated_at` AS `updated_at`, `authors`.`name` AS `author_name`, `categories`.`name` AS `category_name`, `publishers`.`name` AS `publisher_name` FROM (((`books` join `authors` on((`books`.`author_id` = `authors`.`id`))) join `categories` on((`books`.`category_id` = `categories`.`id`))) join `publishers` on((`books`.`publisher_id` = `publishers`.`id`))) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `v_oders`
--
DROP TABLE IF EXISTS `v_oders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_oders`  AS SELECT `orders`.`id` AS `id`, `orders`.`user_id` AS `user_id`, `orders`.`amount` AS `amount`, `orders`.`order_date` AS `order_date`, `orders`.`status` AS `status`, `orders`.`created_at` AS `created_at`, `orders`.`updated_at` AS `updated_at`, `orders`.`des` AS `des`, `orders`.`ms` AS `ms`, `users`.`name` AS `user_name`, `users`.`email` AS `user_email`, `users`.`address` AS `user_address`, `users`.`phone` AS `user_phone`, `orderdetails`.`book_id` AS `book_id`, `orderdetails`.`quantity` AS `book_quantiy`, `orderdetails`.`price` AS `price`, `books`.`name` AS `name` FROM (((`orders` join `users` on((`orders`.`user_id` = `users`.`id`))) join `orderdetails` on((`orders`.`id` = `orderdetails`.`order_id`))) join `books` on((`orderdetails`.`book_id` = `books`.`id`))) ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `books_category_id_foreign` (`category_id`),
  ADD KEY `books_author_id_foreign` (`author_id`),
  ADD KEY `books_publisher_id_foreign` (`publisher_id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderdetails_order_id_foreign` (`order_id`),
  ADD KEY `orderdetails_book_id_foreign` (`book_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  ADD CONSTRAINT `books_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `books_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`);

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `orderdetails_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
