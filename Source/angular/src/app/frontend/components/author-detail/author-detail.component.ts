import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Author } from 'src/app/backend/components/authors/author';
import { AuthorService } from 'src/app/services/admin/author.service';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';
import { CartService } from 'src/app/services/cart/cart.service';
import { AuthFrontendService } from 'src/app/services/frontend/auth-frontend.service';
import { ToastrService } from 'ngx-toastr';


@Component({
  selector: 'app-author-detail',
  templateUrl: './author-detail.component.html',
  styleUrls: ['./author-detail.component.css']
})
export class AuthorDetailComponent implements OnInit {

  id!: number;
  author: any;
  image_path = environment.image_url;
  books: any;
  p: number = 1;

  constructor(
    private routeActive: ActivatedRoute,
    private router: Router,
    private homeService: HomeService,
    private AuthFrontendService: AuthFrontendService,
    private cartService: CartService,
    private toastr : ToastrService
  ) { }
  ngOnInit(): void {
    this.getAuthorDetail();
    this.getBookByAuthorId(this.id);
  }

  getAuthorDetail() {
    this.id = +this.routeActive.snapshot.paramMap.get("id")!;
    this.homeService.homeGetAuthorId(this.id).subscribe(
      res => {
        console.log(res);
        this.author = res;

      }, error => console.log(error))
    console.log(this.id);

  }




  getBookByAuthorId(id: number) {
    this.homeService.homeGetBookByAuthorId(id).subscribe(
      res => {
        this.books = res;
        console.log(this.books);
      }, error => console.log(error)
    )
  }


  goBookDetail(id: number){
    this.router.navigate(['book-detail/' + id]);
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



}
