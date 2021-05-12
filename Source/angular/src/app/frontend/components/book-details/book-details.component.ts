import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';
import { CartService } from 'src/app/services/cart/cart.service';
import { AuthFrontendService } from 'src/app/services/frontend/auth-frontend.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-book-details',
  templateUrl: './book-details.component.html',
  styleUrls: ['./book-details.component.css']
})
export class BookDetailsComponent implements OnInit {
  image_path = environment.image_url;
  id!: number;
  book: any;
  books: any;
  constructor(private homeService: HomeService,
    private routeActive: ActivatedRoute,
    private router: Router,
    private AuthFrontendService: AuthFrontendService,
    private cartService: CartService,
    private toastr: ToastrService
  ) { }

  ngOnInit(): void {
    this.getBookDetail();
    this.getBookByAuthorId(this.id);
  }

  getBookDetail() {
    this.id = +this.routeActive.snapshot.paramMap.get("id")!;
    this.homeService.homeShowBookDetail(this.id).subscribe(
      res => {
        // console.log(res);
        this.book = res[0];

      }, error => console.log(error))
  }

  getBookByAuthorId(id: number) {
    this.homeService.homeGetBookByAuthorId(id).subscribe(
      res => {
        this.books = res;
        console.log(res);
      }, error => console.log(error)
    )
  }


  goAuthorDetail(id: number) {
    this.router.navigate(['author-detail/' + id]);
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
