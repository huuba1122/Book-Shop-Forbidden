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
  books: any = [];
  page = 1;
  count = 0;
  pageSize = 9;
  image_path = environment.image_url;

  constructor(
    private homeService: HomeService,
    private AuthFrontendService: AuthFrontendService,
    private cartService: CartService,
    private toastr : ToastrService
  ) { }

  ngOnInit(): void {
    this.getAllBook()
  }


  getAllBook() {
    this.homeService.homeGetAllBooks().subscribe(
      (res) => {
        this.books = res;
        // console.log(res)
        this.count = this.books.length;
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
