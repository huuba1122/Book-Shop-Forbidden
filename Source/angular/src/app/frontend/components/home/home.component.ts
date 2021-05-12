import { Component, OnInit } from '@angular/core';
import { CartService } from 'src/app/services/cart/cart.service';
import { AuthFrontendService } from 'src/app/services/frontend/auth-frontend.service';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  
  bookNews: any = [];
  books: any = [];
  image_path = environment.image_url;
  bookRecommeds! : any[];
  bookBestSeller!: any[];

  page = 1;
  count = 0;
  pageSize = 3;
  p: number = 1;
  p1: number =1;
  


  constructor(
    private homeService: HomeService,
    private cartService: CartService,
    private AuthFrontendService: AuthFrontendService,
    private toastr: ToastrService,

  ) { }

  ngOnInit(): void {
    this.getBookRecommend();
    this.getBookBestSeller();
    this.getNewBooks();

  }

  getBookRecommend() {
    let formData = new FormData();
    formData.append('column', 'recommend');
    this.homeService.homeGetTopicBooks(formData).subscribe(
      (res) => {
        this.bookRecommeds = res
      }
    )
  }

  getBookBestSeller() {
    let formData = new FormData();
    formData.append('column', 'best_seller');
    this.homeService.homeGetTopicBooks(formData).subscribe(
      (res) => {
        this.bookBestSeller = res;
      }
    )
  }

  getNewBooks(){
    this.homeService.homeGetTenNewBooks().subscribe(
      (res) => {
        this.bookNews = res;
      }
    )
  }

  addToCart(id:any)
  {
  
    let isLogin = this.AuthFrontendService.checklogin();
    if(isLogin){
      let customerId = sessionStorage.getItem('customer_id')!;
      let formDate = new FormData();
      formDate.append('customerId', customerId);
      formDate.append('bookId', id);
      this.cartService.addToCart(formDate).subscribe(
        (res) => {
          if(res.status === 'success'){
            this.toastr.success('Thêm sản phẩm vào giỏ hàng thành công!');
            this.getCartInfo(customerId);
          }
        }
      );
    }
  }

  getCartInfo(id:any)
  {
    this.cartService.getCartInfo(id).subscribe(
      (res) => {
        // console.log(res);
        this.cartService.changeCartQuantity(res.totalQuantity);
      }
    );
  }


  onTableDataChange(e:any){
    this.page = e;
  }

}
