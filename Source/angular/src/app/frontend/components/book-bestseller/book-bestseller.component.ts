import { Component, OnInit } from '@angular/core';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';
import { CartService } from 'src/app/services/cart/cart.service';
import { AuthFrontendService } from 'src/app/services/frontend/auth-frontend.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-book-bestseller',
  templateUrl: './book-bestseller.component.html',
  styleUrls: ['./book-bestseller.component.css']
})
export class BookBestsellerComponent implements OnInit {
  image_path = environment.image_url;
  bookBestSeller!: any[];
  page = 1;
  count = 0;
  pageSize = 9;
  constructor(
    private homeService: HomeService,
    private AuthFrontendService: AuthFrontendService,
    private cartService: CartService,
    private toastr: ToastrService
  ) { }

  ngOnInit(): void {
    this.getBookBestSeller();
  }

  getBookBestSeller() {
    let formData = new FormData();
    formData.append('column', 'best_seller');
    this.homeService.homeGetTopicBooks(formData).subscribe(
      (res) => {
        this.bookBestSeller = res;
        console.log(res)
      }
    )
  }

  onTableDataChange(e:any){
    this.page = e;
  }

  addToCart(id: any) {

    let isLogin = this.AuthFrontendService.checklogin();
    if (isLogin) {
      let customerId = sessionStorage.getItem('customer_id')!;
      let formDate = new FormData();
      formDate.append('customerId', customerId);
      formDate.append('bookId', id);
      this.cartService.addToCart(formDate).subscribe(
        (res) => {
          if (res.status === 'success') {
            this.toastr.success('Thêm sản phẩm vào giỏ hàng thành công!');
            this.getCartInfo(customerId);
          }
        }
      );
    }
  }

  getCartInfo(id: any) {
    this.cartService.getCartInfo(id).subscribe(
      (res) => {
        // console.log(res);
        this.cartService.changeCartQuantity(res.totalQuantity);
      }
    );
  }
}
