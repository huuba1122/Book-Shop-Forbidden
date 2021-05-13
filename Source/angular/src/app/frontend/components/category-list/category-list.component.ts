import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';
import { CartService } from 'src/app/services/cart/cart.service';
import { AuthFrontendService } from 'src/app/services/frontend/auth-frontend.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-category-list',
  templateUrl: './category-list.component.html',
  styleUrls: ['./category-list.component.css']
})
export class CategoryListComponent implements OnInit {
  books: any = [];
  page = 1;
  count = 0;
  pageSize = 6;
  id!: number;

  image_path = environment.image_url;

  constructor(
    private homeService: HomeService,
    private routerActive: ActivatedRoute,
    private router: Router,
    private AuthFrontendService: AuthFrontendService,
    private cartService: CartService,
    private toastr: ToastrService

  ) { }

  ngOnInit(): void {
    this.id = +this.routerActive.snapshot.paramMap.get("id")!;
    this.getBookCategory(this.id);
  }

  getBookCategory(id: any) {
    
    this.homeService.homeGetBookByCategoryId(id).subscribe(
      res => {
        // console.log(res);
        this.books = res;

      }, error => console.log(error))
  }


  onTableDataChange(e: any) {
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


  goBookDetail(id: any){
    this.router.navigate(['book-detail', id])
  
  }

}
