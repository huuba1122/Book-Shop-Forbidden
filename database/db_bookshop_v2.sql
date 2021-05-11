-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 11, 2021 lúc 09:25 AM
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
(2, 'Emily Bronte', 4000, 'England', 'https://en.wikipedia.org/wiki/Emily_Bront%C3%AB', 'author-images/m2axlmWZubgJDoWEA8y8faNXMBaWZfcPlXBSifjg.jpg', '2021-05-02 07:45:43', '2021-05-09 19:47:20', '1925', '1971'),
(3, 'Margaret Mitchell', 33100, 'U.S', 'https://en.wikipedia.org/wiki/Margaret_Mitchell', 'author-images/KU2NIdrGuFDw3mPDx0oe0HDTYmZGC0yPg4TbgzBl.jpg', '2021-05-02 07:45:43', '2021-05-10 03:41:11', '1919', '2001'),
(4, 'Thạch Lam', 5001, 'Vietnam', 'https://vi.wikipedia.org/wiki/Th%E1%BA%A1ch_Lam', 'author-images/zTdg4hsReE21SKdD5xrSZq1x9av2KWCyhjVilneg.jpg', '2021-05-02 07:45:44', '2021-05-09 19:42:00', '1920', '1978'),
(5, 'Ngô Tất Tố', 4999, 'Vietnam', 'https://vi.wikipedia.org/wiki/Ng%C3%B4_T%E1%BA%A5t_T%E1%BB%91', 'author-images/Dl0CSpVtMWhZL7NlIfS68LVXAA3UVKWLunYialSn.jpg', '2021-05-02 07:45:44', '2021-05-09 20:46:31', '1921', '1967'),
(7, 'Nam Cao', 2, 'Lao', 'https://vi.wikipedia.org/wiki/Nam_Cao', 'author-images/SOFwkRWbB71pwNfYnb80D1nkD9TxVvPqWcErOnSK.jpg', '2021-05-06 07:45:55', '2021-05-08 20:18:50', '1953', '1991'),
(8, 'Vũ Trọng Phụng', 8000, 'Việt Nam', 'https://vi.wikipedia.org/wiki/T%C3%B4_Ho%C3%A0i', 'author-images/QB0oOEgqOP5mMOi8zjJeRHkP4Fwk0udifqZVU7dI.jpg', '2021-05-06 18:27:18', '2021-05-10 02:57:21', '1923', '2011');

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
(16, '1-197-19341-1', 'Truyện Kiều', 1232, 1, 4, 2, 2, 'Sách mang đậm tính hiện thưực', 'Truyện kể về cuộc đời oan trái của người con gái', '2021-04-30', '28ensdasd', 'book-images/2XKuDQ354gFzJaxxrfbpQ3YTTVyzwPlyaggkWJwW.jpg', 0, 0, 1, 1, 212, 'Tiếng Việt', '2021-05-08 08:45:51', '2021-05-09 20:39:58'),
(17, '1-445-63320-6', 'Những ngày thơ ấu', 2000, 3, 7, 2, 2, 'Những ngày thơ ấu là một tập hồi ký viết về tuổi thơ đầy cay đắng và khắc nghiệt của chính tác giả, nhà văn Nguyên Hồng. Hồi ký được đăng trên báo năm 1938, xuất bản thành sách vào năm 1940', 'Những ngày thơ ấu là một tập hồi ký viết về tuổi thơ đầy cay đắng và khắc nghiệt của chính tác giả, nhà văn Nguyên Hồng. Hồi ký được đăng trên báo năm 1938, xuất bản thành sách vào năm 1940', '2021-05-29', 'add33dfhsd', 'book-images/KVGJCAeiWIAzft4EScnKI1MbHDpSSZioCQPt0VRy.jpg', 0, 0, 1, 2, 123, 'Tiêng Việt', '2021-05-08 20:18:50', '2021-05-09 20:40:32'),
(18, '0-972-72218-5', 'Đạo làm chồng đảm', 300000, 4, 3, 1, 2, 'Lúc đang mải chợ búa, bỗng Tatsu bị một chú mèo trộm mất đồ.\nKhi đuổi theo đòi lại thì anh vô tình\nĐẮC TỘI VỚI MỘT BĂNG ĐẢNG XÃ HỘI ĐEN!!\nChuyện về chàng cựu Yakuza yêu bếp nay đã phát hành tập 4! Quý vị độc giả tuyệt đối đừng bỏ lỡ nha!', 'Lúc đang mải chợ búa, bỗng Tatsu bị một chú mèo trộm mất đồ.\nKhi đuổi theo đòi lại thì anh vô tình\nĐẮC TỘI VỚI MỘT BĂNG ĐẢNG XÃ HỘI ĐEN!!\nChuyện về chàng cựu Yakuza yêu bếp nay đã phát hành tập 4! Quý vị độc giả tuyệt đối đừng bỏ lỡ nha!', '2021-05-20', '5212214140004', 'book-images/stjUyog9VLcGInRSocu1of8zTjHpz3GfMSnKYD4E.jpg', 0, 1, 0, 100, 160, 'Tiếng Việt', '2021-05-09 19:09:24', '2021-05-09 19:09:24'),
(19, '1-953-48248-6', 'Doramon Vương quốc trên mây', 50000, 10, 2, 2, 10, 'Các em có cho rằng thiên đường tồn tại hay không? Câu chuyện lần này của tôi kể về một thế giới trên mây có người trời sinh sống. Nơi ấy là một vương quốc trong mơ có nền văn minh tiến bộ, thiên nhiên tươi đẹp, nhưng không chỉ đơn giản như thế…\nChúng ta hãy cùng dõi theo chuyến phiêu lưu kì lạ của nhóm bạn Nobita nhé!', 'Các em có cho rằng thiên đường tồn tại hay không? Câu chuyện lần này của tôi kể về một thế giới trên mây có người trời sinh sống. Nơi ấy là một vương quốc trong mơ có nền văn minh tiến bộ, thiên nhiên tươi đẹp, nhưng không chỉ đơn giản như thế…\nChúng ta hãy cùng dõi theo chuyến phiêu lưu kì lạ của nhóm bạn Nobita nhé!', '2021-05-27', '6212204350012', 'book-images/2fTRzXGWA7pR313UdCuYJFNtfzS5AftgaLPDagnC.jpg', 0, 0, 1, 1000, 192, 'Tiếng Việt', '2021-05-09 19:12:10', '2021-05-09 19:12:10'),
(20, '0-242-96120-7', 'Thanh gươm diệt quỷ', 50000, 9, 5, 3, 2, 'Tiếp nối thành công của THANH GƯƠM DIỆT QUỶ Bản đặc biệt Tập 20 và 21, NXB Kim Đồng tiếp tục gửi đến các Fan của bộ truyện Bản đặc biệt tập 22, với những phụ kiện theo kèm “rủng rỉnh” hơn rất nhiều so với 2 cuốn trước!!', 'Tiếp nối thành công của THANH GƯƠM DIỆT QUỶ Bản đặc biệt Tập 20 và 21, NXB Kim Đồng tiếp tục gửi đến các Fan của bộ truyện Bản đặc biệt tập 22, với những phụ kiện theo kèm “rủng rỉnh” hơn rất nhiều so với 2 cuốn trước!!', '2021-05-14', '  5212213630122', 'book-images/mDSCfjzV4PTveFFKLQKCY1rx7ti3tg4uzmCvdBvc.jpg', 0, 1, 0, 3000, 200, 'Tiếng Việt', '2021-05-09 19:15:09', '2021-05-09 19:15:09'),
(21, '1-182-79558-8', 'Lý Tự Trọng-Sống mãi tên anh', 50000, 10, 8, 4, 10, 'Hình ảnh và chí khí của người thanh niên LÝ TỰ TRỌNG trong cuộc sống đời thường và khi hoạt động cách mạng. Tuổi đời còn rất trẻ nhưng không ngại khó khăn gian khổ, hiểm nguy, anh luôn hoàn thành xuất sắc mọi nhiệm vụ được giao… Không may bị sa vào tay giặc, bị dụ dỗ, mua chuộc, tra tấn khủng khiếp nhưng anh vẫn giữ vững niềm tin, trung thành với cách mạng. Câu nói bất hủ của anh “Con đường của thanh niên chỉ là con đường cách mạng, không thể có con đường nào khác” đã trở thành lí tưởng sống và kim chỉ nam hành động của thanh niên Việt Nam qua các thời kì cách mạng.', 'Hình ảnh và chí khí của người thanh niên LÝ TỰ TRỌNG trong cuộc sống đời thường và khi hoạt động cách mạng. Tuổi đời còn rất trẻ nhưng không ngại khó khăn gian khổ, hiểm nguy, anh luôn hoàn thành xuất sắc mọi nhiệm vụ được giao… Không may bị sa vào tay giặc, bị dụ dỗ, mua chuộc, tra tấn khủng khiếp nhưng anh vẫn giữ vững niềm tin, trung thành với cách mạng. Câu nói bất hủ của anh “Con đường của thanh niên chỉ là con đường cách mạng, không thể có con đường nào khác” đã trở thành lí tưởng sống và kim chỉ nam hành động của thanh niên Việt Nam qua các thời kì cách mạng.', '2021-04-26', '  5211110060020', 'book-images/hHhDDg9a4RWDzVB63TcSrNYszWpT9oaHxiPVxNRP.jpg', 0, 1, 0, 4000, 120, 'Tiếng Việt', '2021-05-09 19:17:10', '2021-05-09 19:17:10'),
(22, '0-182-14478-5', 'Lovely Children', 18000, 2, 4, 1, 2, 'Chuyện xoay quanh 3 cô bé sở hữu siêu năng lực cấp độ 7 luôn gia tay cứu giúp những người gặp cơn nguy khốn', 'Chuyện xoay quanh 3 cô bé sở hữu siêu năng lực cấp độ 7 luôn gia tay cứu giúp những người gặp cơn nguy khốn', '2021-05-20', ' 5212202600053', 'book-images/YMANXElRE0aw7b68Y667p0dlaXm6XaYW203IzruG.jpg', 0, 1, 0, 2000, 188, 'Tiếng Nhật', '2021-05-09 19:24:08', '2021-05-09 19:24:08'),
(23, '0-812-79169-2', 'Naruto ', 22000, 1, 3, 3, 10, 'Chiến cuộc ngày càng lan rộng! Liên minh Ninja liên tiếp tử chiến với các hào kiệt Ninja được triệu hồi từ cõi chết. Đội trưởng đội 1 Darui mở màn cuộc chiến, đối đầu Kim Ngân huynh đệ - 2 quái nhân vốn được mệnh danh là Ninja truyền thuyết của làng Mây! Trước đối thủ sở hữu chakra cửu vĩ và những nhẫn cụ lợi hại, cơ hội chiến thắng của anh là…!?', 'Chiến cuộc ngày càng lan rộng! Liên minh Ninja liên tiếp tử chiến với các hào kiệt Ninja được triệu hồi từ cõi chết. Đội trưởng đội 1 Darui mở màn cuộc chiến, đối đầu Kim Ngân huynh đệ - 2 quái nhân vốn được mệnh danh là Ninja truyền thuyết của làng Mây! Trước đối thủ sở hữu chakra cửu vĩ và những nhẫn cụ lợi hại, cơ hội chiến thắng của anh là…!?', '2021-05-18', '5212212530056', 'book-images/SBwQ7e2aCIj7HHn7mjTV2EfUDJZtUVEZA6RE6zLW.jpg', 0, 0, 1, 20000, 200, 'Tiếng Việt', '2021-05-09 19:26:26', '2021-05-09 19:26:26'),
(24, '1-589-40319-7', 'YaiBa', 20000, 2, 8, 3, 3, 'Nhóm Yaiba mau chóng tiến vào lãnh địa của địch. Tuy nhiên, kẻ thù cực mạnh không thể ngờ tới đang đợi ở căn phòng thứ tám. Trước đó, Yaiba phải đối mặt với nhóm ba nữ chiến binh giống Emerald như những giọt nước, có khả năng copy toàn bộ chiêu thức và phản công lại cậu. Chẳng lẽ đây đúng là một cái bẫy…!?', 'Nhóm Yaiba mau chóng tiến vào lãnh địa của địch. Tuy nhiên, kẻ thù cực mạnh không thể ngờ tới đang đợi ở căn phòng thứ tám. Trước đó, Yaiba phải đối mặt với nhóm ba nữ chiến binh giống Emerald như những giọt nước, có khả năng copy toàn bộ chiêu thức và phản công lại cậu. Chẳng lẽ đây đúng là một cái bẫy…!?', '2021-04-27', '6212201130019', 'book-images/xagQjHourTCFfzWZvMNy3JUGcaftuzJdAimba54c.jpg', 0, 1, 0, 2000, 184, 'Tiếng Việt', '2021-05-09 19:28:43', '2021-05-09 19:28:43'),
(25, '1-635-96530-7', 'Kính Vạn Hoa', 110000, 3, 4, 2, 4, '“Kính Vạn Hoa” là tác phẩm công phu nhất trong sự nghiệp của nhà văn Nguyễn Nhật Ánh, được trẻ em Việt Nam nhiều thế hệ yêu thích và đón nhận nồng nhiệt. Những câu chuyện thú vị xoay quanh cuộc sống của nhóm bạn Tiểu Long, Quý Ròm, Nhỏ Hạnh… cùng những chuyến phiêu lưu kì thú, bất ngờ, kì lạ… đã đưa các em bước vào một thế giới “cổ tích hiện đại”, có thực và tràn ngập ánh sáng yêu thương. Bộ sách đã thể hiện tình yêu, trách nhiệm và tâm huyết của tác giả đối với thế hệ trẻ. Nguyễn Nhật Ánh đã “thâm nhập” vào thế giới tâm hồn của tuổi thơ để hiểu và đồng cảm với những cảm xúc, suy tư của các em trước cuộc sống. “Kính Vạn Hoa” đã thực sự phản ánh toàn diện, đề cập tới tất cả các khía cạnh trong đời sống tâm hồn của trẻ em và đặc biệt là trách nhiệm xã hội của nhà văn đối với việc hoàn thiện nhân cách của các em.', '“Kính Vạn Hoa” là tác phẩm công phu nhất trong sự nghiệp của nhà văn Nguyễn Nhật Ánh, được trẻ em Việt Nam nhiều thế hệ yêu thích và đón nhận nồng nhiệt. Những câu chuyện thú vị xoay quanh cuộc sống của nhóm bạn Tiểu Long, Quý Ròm, Nhỏ Hạnh… cùng những chuyến phiêu lưu kì thú, bất ngờ, kì lạ… đã đưa các em bước vào một thế giới “cổ tích hiện đại”, có thực và tràn ngập ánh sáng yêu thương. Bộ sách đã thể hiện tình yêu, trách nhiệm và tâm huyết của tác giả đối với thế hệ trẻ. Nguyễn Nhật Ánh đã “thâm nhập” vào thế giới tâm hồn của tuổi thơ để hiểu và đồng cảm với những cảm xúc, suy tư của các em trước cuộc sống. “Kính Vạn Hoa” đã thực sự phản ánh toàn diện, đề cập tới tất cả các khía cạnh trong đời sống tâm hồn của trẻ em và đặc biệt là trách nhiệm xã hội của nhà văn đối với việc hoàn thiện nhân cách của các em.', '2021-05-28', '6211106390003', 'book-images/MUbigIgkgWYpTAIWPw61TpLCLzdGYP8ZQx9Oxl4r.jpg', 0, 1, 0, 1000, 174, 'Tiếng Việt', '2021-05-09 19:31:52', '2021-05-09 21:01:15'),
(27, '0-587-92139-7', 'Tiền đẻ ra tiền', 20000, 2, 3, 3, 4, 'Khi nhận nuôi chú chó giống Labrador lông trắng đột nhiên xuất hiện trước cửa nhà, chắc hẳn cô bé Kira không thể lường được cuộc phiêu lưu đang chờ đợi trước mắt. Bởi không những chú chó này biết nói, chú còn là một chuyên gia thứ thiệt về lĩnh vực tài chính và quản lí tiền bạc. Nghe theo lời chỉ dẫn của Money, Kira đã có cho mình những người bạn mới, một vài công việc yêu thích và thậm chí còn có thể giúp bố mẹ mình thoát cảnh nợ nần.\n\n', 'Khi nhận nuôi chú chó giống Labrador lông trắng đột nhiên xuất hiện trước cửa nhà, chắc hẳn cô bé Kira không thể lường được cuộc phiêu lưu đang chờ đợi trước mắt. Bởi không những chú chó này biết nói, chú còn là một chuyên gia thứ thiệt về lĩnh vực tài chính và quản lí tiền bạc. Nghe theo lời chỉ dẫn của Money, Kira đã có cho mình những người bạn mới, một vài công việc yêu thích và thậm chí còn có thể giúp bố mẹ mình thoát cảnh nợ nần.\n\n', '2021-05-29', '6212300010032', 'book-images/i0IsMicnAgguHXM8YXE9PYNmHLIDfXy4tbN4RQss.jpg', 0, 0, 1, 1000, 196, 'Tiếng Việt', '2021-05-09 19:38:16', '2021-05-09 19:38:16'),
(28, '0-520-87476-9', 'Những truyện hay ', 80000, 3, 4, 4, 2, 'Những tác phẩm viết cho lứa tuổi thơ nổi tiếng trong nước và thế giới đã trả lời câu hỏi ấy. Một sáng tác hay cho các em cũng làm cho cả người lớn thấy hay. Các em và người lớn đều thu nhận được ở tác phẩm ấy những thông cảm cho mỗi lứa tuổi khác nhau, mà người lớn không cần phải giả làm trẻ em mới hiểu được. Người lớn vốn đã thích thú đọc rất hào hứng những tác phẩm tưởng tượng còn “hoang đường” hơn truyện đồng thoại kia mà.”\n\n', 'Những tác phẩm viết cho lứa tuổi thơ nổi tiếng trong nước và thế giới đã trả lời câu hỏi ấy. Một sáng tác hay cho các em cũng làm cho cả người lớn thấy hay. Các em và người lớn đều thu nhận được ở tác phẩm ấy những thông cảm cho mỗi lứa tuổi khác nhau, mà người lớn không cần phải giả làm trẻ em mới hiểu được. Người lớn vốn đã thích thú đọc rất hào hứng những tác phẩm tưởng tượng còn “hoang đường” hơn truyện đồng thoại kia mà.”\n\n', '2021-05-12', '6211107600003', 'book-images/fA9yXjqHd0yig4yNGQs5WTP6bY1rOd8OFUkQBc2z.jpg', 0, 1, 0, 2000, 304, 'Tiếng Việt', '2021-05-09 19:42:00', '2021-05-09 20:41:06'),
(29, '0-208-35565-6', 'ONE PIECE - TẬP 3 ', 19500, 2, 3, 2, 4, 'Xuyên suốt câu chuyện là những tình tiết hài về một nhóm cướp lênh đênh trên biển…', 'Xuyên suốt câu chuyện là những tình tiết hài về một nhóm cướp lênh đênh trên biển…', '2021-05-22', '6212203330003', 'book-images/3QGlmUlEJGIlAAk01GeHxtZuUNfw2hj1pdgmhb9w.jpg', 0, 0, 1, 5000, 200, 'Tiếng Việt', '2021-05-09 19:44:37', '2021-05-09 20:39:46'),
(30, '1-359-10040-9', 'ONE PIECE - TẬP 37 ', 20000, 2, 2, 3, 4, 'Trận đối đầu giữa nhóm của Luffy với CP9 nhằm mục đích ngăn cản Robin sẽ diễn ra như thế nào!? Để đoạt lấy bản thiết kế của vũ khí cổ đại \"Pluton\", CP9 đã nhắm vào Franky!! Sự thật nào sẽ được phơi bày ở đó...!? Những chuyến phiêu lưu trên đại dương xoay quanh \"ONE PIECE\" lại bắt đầu!!', 'Trận đối đầu giữa nhóm của Luffy với CP9 nhằm mục đích ngăn cản Robin sẽ diễn ra như thế nào!? Để đoạt lấy bản thiết kế của vũ khí cổ đại \"Pluton\", CP9 đã nhắm vào Franky!! Sự thật nào sẽ được phơi bày ở đó...!? Những chuyến phiêu lưu trên đại dương xoay quanh \"ONE PIECE\" lại bắt đầu!!', '2021-04-30', '6212203330037', 'book-images/KX8Sm9pDczSXEDMs9rxXrHyQ1WfMqMpGPENDpCpZ.jpg', 0, 0, 1, 3000, 192, 'Tiếng Việt', '2021-05-09 19:47:19', '2021-05-09 20:39:33'),
(31, '0-829-62818-8', 'Tớ là mèo Pussen', 20000, 9, 5, 3, 1, '\"Hài hước, kì lạ và vô cùng đáng yêu\"\n\n(Matthew Inman, người sáng lập website The Oatmeal)\n\nTớ là mèo Pusheen - Cuốn nhật ký xoay quanh cuộc sống của Pusheen - chú mèo Icon nổi tiếng trên mạng xã hội facebook với hơn 7 triệu người hâm mộ. Hãy cùng tìm hiểu những điều khiến Pusheen thích thú và lí do hàng triệu người trót mết vẻ \"tung tăng\" của nàng mèo múp míp, mũm mĩm này nhé!', '\"Hài hước, kì lạ và vô cùng đáng yêu\"\n\n(Matthew Inman, người sáng lập website The Oatmeal)\n\nTớ là mèo Pusheen - Cuốn nhật ký xoay quanh cuộc sống của Pusheen - chú mèo Icon nổi tiếng trên mạng xã hội facebook với hơn 7 triệu người hâm mộ. Hãy cùng tìm hiểu những điều khiến Pusheen thích thú và lí do hàng triệu người trót mết vẻ \"tung tăng\" của nàng mèo múp míp, mũm mĩm này nhé!', '2021-05-06', '6212200010038', 'book-images/3BLdGsBrpBJel7zJjBdXA3LizPlinbP04tI0O9jO.jpg', 0, 0, 1, 2000, 188, 'Tiếng Việt', '2021-05-09 19:49:52', '2021-05-09 19:49:52'),
(32, '0-578-95832-6', 'Cha Cõng Con', 20000, 10, 8, 3, 3, 'Từ trên cao nhìn xuống những cánh đồng, dòng sông, Bường muốn được về nhà.\n\nNgười cha đạp xe không kể ngày đêm, băng qua cánh đồng vàng, băng qua những con dốc trắng… Cậu bé tóc gần như rụng hết, dang cánh tay như cánh chim. Hai cha con đã về đến con sông, bên kia dòng sông là nơi họ sống. Cả hai vượt sông, người cha cõng con trai trên lưng. Rồi người ta thấy dòng sông phẳng lặng, không thấy bóng hai cha con nữa.', 'Từ trên cao nhìn xuống những cánh đồng, dòng sông, Bường muốn được về nhà.\n\nNgười cha đạp xe không kể ngày đêm, băng qua cánh đồng vàng, băng qua những con dốc trắng… Cậu bé tóc gần như rụng hết, dang cánh tay như cánh chim. Hai cha con đã về đến con sông, bên kia dòng sông là nơi họ sống. Cả hai vượt sông, người cha cõng con trai trên lưng. Rồi người ta thấy dòng sông phẳng lặng, không thấy bóng hai cha con nữa.', '2021-05-13', '6211100010029', 'book-images/qtcC50PXjuANefphJnvHhXLx8IV6AKJHsPmpld5j.jpg', 0, 1, 0, 2000, 100, 'Tiếng Việt ', '2021-05-10 02:57:21', '2021-05-10 02:57:21'),
(33, '0-311-54816-1', 'Chuyện Ma Ám Ở Dinh Biệt Thự', 13000, 9, 3, 4, 1, 'Tiến sĩ Montague, một nhà khoa học chuyên điều tra các hiện tượng ma quái, đã quyết định sống vài tuần tại Dinh thự Hill, nổi tiếng là một nơi kinh dị mà không con người nào sống được. Để kiểm tra và bổ trợ cho các quan sát của mình, ông lựa ra ba người bạn đồng hành mình chưa từng quen biết: hai cô gái – Theo và Eleanor – cùng Luke – một chàng trai trẻ, người thừa kế của Dinh thự Hill. Khi cả bốn người bắt đầu đối phó với những cơn ớn lạnh, thậm chí là cả các sự kiện kinh hoàng nằm ngoài tầm kiểm soát hay hiểu biết của họ tại Dinh thự Hill, họ cũng khó lòng đoán biết được những gì đang chờ đợi mình phía trước.', 'Tiến sĩ Montague, một nhà khoa học chuyên điều tra các hiện tượng ma quái, đã quyết định sống vài tuần tại Dinh thự Hill, nổi tiếng là một nơi kinh dị mà không con người nào sống được. Để kiểm tra và bổ trợ cho các quan sát của mình, ông lựa ra ba người bạn đồng hành mình chưa từng quen biết: hai cô gái – Theo và Eleanor – cùng Luke – một chàng trai trẻ, người thừa kế của Dinh thự Hill. Khi cả bốn người bắt đầu đối phó với những cơn ớn lạnh, thậm chí là cả các sự kiện kinh hoàng nằm ngoài tầm kiểm soát hay hiểu biết của họ tại Dinh thự Hill, họ cũng khó lòng đoán biết được những gì đang chờ đợi mình phía trước.', '2021-05-28', '6212814090001', 'book-images/UZzBQWIl5kPwBDcZzzX9l1PPPX7h9nCN1S1EaoVH.jpg', 0, 1, 0, 2000, 288, 'Tiếng Việt ', '2021-05-10 03:00:38', '2021-05-10 03:00:38'),
(34, '0-260-81475-4', 'Dragon Ball ', 77000, 2, 3, 5, 5, 'DRAGON BALL là một Manga kinh điển với tầm ảnh hưởng lớn đến mức nào! Một bộ truyện chúng ta đã gắn bó suốt từ nhỏ, ăn cùng, ngủ cùng, bắt gặp hình ảnh ở khắp mọi nơi, vậy thì chẳng có lí do gì mà không sở hữu 1 phiên bản rực rỡ sắc màu như thế này cả! Nhất là khi \"Giấc mơ thuở bé\" nay đã thành sự thực nữa!', 'DRAGON BALL là một Manga kinh điển với tầm ảnh hưởng lớn đến mức nào! Một bộ truyện chúng ta đã gắn bó suốt từ nhỏ, ăn cùng, ngủ cùng, bắt gặp hình ảnh ở khắp mọi nơi, vậy thì chẳng có lí do gì mà không sở hữu 1 phiên bản rực rỡ sắc màu như thế này cả! Nhất là khi \"Giấc mơ thuở bé\" nay đã thành sự thực nữa!', '2021-05-11', '5212214290004', 'book-images/yyW2WUvbZ4xe06td77zpoVQAUg5lYsBN1VA2uACt.jpg', 0, 0, 1, 5000, 224, 'Tiếng Việt ', '2021-05-10 03:41:11', '2021-05-10 03:41:11');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, 'Truyện ngắn', 18000, '2021-05-02 07:45:10', '2021-05-10 03:41:12'),
(3, 'Tiểu thuyết', 3002, '2021-05-02 07:45:10', '2021-05-09 19:42:00'),
(4, 'Nấu ăn', 100, '2021-05-02 07:45:10', '2021-05-09 19:09:25'),
(9, 'kinh dị', 7000, '2021-05-04 21:29:16', '2021-05-10 03:00:39'),
(10, 'Kỹ năng sống', 6999, '2021-05-04 21:30:29', '2021-05-10 02:57:21');

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
(17, '2021_05_11_014955_add_column_ifo_users_table', 5);

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
(3, 'guest', 'guest@gmail.com', 0, NULL, '$2y$10$ghhUye8hJ1naPTd/0n9x4e0WnDLKcvN2/mmpH4IyzAe9GVZiDDd5y', NULL, '2021-05-02 07:44:46', '2021-05-02 07:44:46', NULL, NULL);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
