<?php

namespace Database\Seeders;

use App\Models\Book;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class BookSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $book = new Book();
        $book->name = 'Những người khốn khổ';
        $book->isbn = '9786049973109';
        $book->price = '200000';
        $book->category_id = 1;
        $book->author_id = 1;
        $book->publisher_id = 1;
        $book->reprint_of_book = 9;
        $book->description = 'Những Người Khốn Khổ (Trọn Bộ 5 Tập) "Khi pháp luật và phong hóa còn đày đọa con người, còn dựng nên những địa ngục giữa xã hội văn minh và đem một thứ định mệnh nhân tạo chồng thêm lên thiên mệnh; khi ba vấn đề lớn của thời đại là sự sa đọa của đàn ông vì bán sức lao động, sự trụy lạc của đàn bà vì đói khát, sự cằn cỗi của trẻ nhỏ vì tối tăm, chưa được giải quyết; khi ở một số nơi đời sống còn ngạt thở; nói khác đi, và trên quan điểm rộng hơn, khi trên mặt đất, dốt nát và đói khổ còn tồn tại, thì những cuốn sách như loại này còn có thể có ích.” (Hauteville House, ngày 1-1-1862- Victor Hugo)';
        $book->content = 'Những Người Khốn Khổ (Trọn Bộ 5 Tập) "Khi pháp luật và phong hóa còn đày đọa con người, còn dựng nên những địa ngục giữa xã hội văn minh và đem một thứ định mệnh nhân tạo chồng thêm lên thiên mệnh; khi ba vấn đề lớn của thời đại là sự sa đọa của đàn ông vì bán sức lao động, sự trụy lạc của đàn bà vì đói khát, sự cằn cỗi của trẻ nhỏ vì tối tăm, chưa được giải quyết; khi ở một số nơi đời sống còn ngạt thở; nói khác đi, và trên quan điểm rộng hơn, khi trên mặt đất, dốt nát và đói khổ còn tồn tại, thì những cuốn sách như loại này còn có thể có ích.” (Hauteville House, ngày 1-1-1862- Victor Hugo)';
        $book->year_of_publication = '2015-10-01';
        $book->license = Str::random(10);
        $book->image = 'http://thuvien.nctu.edu.vn:8000/cgi-bin/koha/opac-image.pl?thumbnail=1&biblionumber=3736';
        $book->best_seller = 1;
        $book->stock = 1;
        $book->page_number = 1472;
        $book->language = 'Tiếng việt';
        $book->save();

        $book = new Book();
        $book->name = 'HOÀNG LÊ NHẤT THỐNG CHÍ';
        $book->isbn = '8935236422734';
        $book->price = '77000';
        $book->category_id = 1;
        $book->author_id = 5;
        $book->publisher_id = 2;
        $book->reprint_of_book = 9;
        $book->description = 'HOÀNG LÊ NHẤT THỐNG CHÍ là tác phẩm tiêu biểu nhất, có giá trị nhất trong bộ sách của “Ngô gia văn phái” trên cả hai phương diện sử học và văn học.
Bản dịch HOÀNG LÊ NHẤT THỐNG CHÍ ra chữ quốc ngữ của Ngô Tất Tố là một trong số những bản dịch đầu tiên được thực hiện sớm từ nửa đầu thế kỷ 20.
Nhà Hán học, nhà văn, nhà sử học Ngô Tất Tố đã công phu tra cứu, xác định nguyên tác, trung thành dịch và chủ tâm mong muốn tăng thêm giá trị lịch sử khi dịch HOÀNG LÊ NHẤT THỐNG CHÍ.';
        $book->content = 'HOÀNG LÊ NHẤT THỐNG CHÍ là tác phẩm tiêu biểu nhất, có giá trị nhất trong bộ sách của “Ngô gia văn phái” trên cả hai phương diện sử học và văn học.
Bản dịch HOÀNG LÊ NHẤT THỐNG CHÍ ra chữ quốc ngữ của Ngô Tất Tố là một trong số những bản dịch đầu tiên được thực hiện sớm từ nửa đầu thế kỷ 20.
Nhà Hán học, nhà văn, nhà sử học Ngô Tất Tố đã công phu tra cứu, xác định nguyên tác, trung thành dịch và chủ tâm mong muốn tăng thêm giá trị lịch sử khi dịch HOÀNG LÊ NHẤT THỐNG CHÍ.';
        $book->year_of_publication = '2021-04-01';
        $book->license = Str::random(10);
        $book->image = 'http://minhkhai.vn/hinhlon/8935236422734.JPG';
        $book->best_seller = 1;
        $book->stock = 1;
        $book->page_number = 503;
        $book->language = 'Tiếng việt';
        $book->save();

        $book = new Book();
        $book->name = 'Cuốn theo chiều gió';
        $book->price = '920000';
        $book->isbn = '8935236414975';
        $book->category_id = 1;
        $book->author_id = 3;
        $book->publisher_id = 3;
        $book->reprint_of_book = 11;
        $book->description = 'Vào năm thứ ba mươi sáu của thế kỷ XX, một sự kiện được ghi lại trong lịch sử văn học hiện đại nước Mỹ. Đó là sự ra đời của một tác phẩm văn học chẳng những mau chóng thu phục được tấm lòng người dân Mỹ mà còn cả trái tim của hàng triệu người trên khắp các lục địa. Tác phẩm ấy mang tên CUỐN THEO CHIỀU GIÓ (GONE WITH THE WIND).';
        $book->content = 'Chỉ ba tuần sau khi được xuất bản CUỐN THEO CHIỀU GIÓ đã thu hút ngay sự chú ý của hơn mười bảy vạn độc giả. Và liền năm sau 1937, nó được tặng giải thưởng Pulitzer, một giải thưởng được nhiều nhà văn ao ước. Đến tháng Mười hai cây Sồi năm 1938 hơn một triệu bảy bản đã được ấn hành tại nước Mỹ. Sau đó đúng một năm khi bộ phim dựa theo cuốn tiểu thuyết này lần đầu tiên ra mắt khán giả Mỹ, hơn hai triệu bản CUỐN THEO CHIỀU GIÓ  đã được in và dịch ra mười sáu thứ tiếng khác nhau trên thế giới. Tính đến năm 1962 thì lên tới hơn mười triệu bản và cuốn sách được dịch ra hơn ba chục thứ tiếng và đã được chuyển thể thành sách cho người mù đọc.
Ở Việt Nam, CUỐN THEO CHIỀU GIÓ được chia thành hai tập, được nhiều người dịch và được xuất bản nhiều lần.';
        $book->year_of_publication = '2019-03-01';
        $book->license = Str::random(10);
        $book->image = 'http://minhkhai.vn/hinhlon/8935236414975.jpg';
        $book->best_seller = 1;
        $book->stock = 1;
        $book->page_number = 920;
        $book->language = 'Tiếng việt';
        $book->save();
    }
}
