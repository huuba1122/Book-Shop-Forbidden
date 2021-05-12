import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthorService } from 'src/app/services/admin/author.service';
import { CategoryService } from 'src/app/services/admin/category.service';
import { CartService } from 'src/app/services/cart/cart.service';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';
import { AuthFrontendService } from 'src/app/services/frontend/auth-frontend.service';


@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {

  bookNews: any;
  authors: any = [];
  categories: any = [];
  books: any = [];
  count = 0;
  cartQuantity:any;
  username:any;
  // image_path = environment.image_url;


  constructor(
    private router: Router,
    private homeService: HomeService,
    private cartService: CartService,
    private AuthFrontendService: AuthFrontendService,
  ) {
    // this.username = sessionStorage.getItem('customer_name')!;
   }

  ngOnInit(): void {
    this.getAllAuthor();
    this.getCategoryAll();
    // this.getBookNews();
    this.cartService.data$.subscribe(res => this.cartQuantity = res);
    this.cartService.customerName$.subscribe(res => this.username = res);
    
    // this.getUserName();
  }

  getAllAuthor() {
    this.homeService.homeGetAllAuthors().subscribe(
      (res) => {
        this.authors = res;
        // console.log(res);
        // this.count = this.authors.length;
      }
    )
  }

  getCategoryAll() {
    this.homeService.homeGetAllCategory().subscribe(
      (res) => {
        this.categories = res;
        // console.log(res);
      }
    )
  }

  getCartInfo()
  {
    let id = sessionStorage.getItem('customer_id')!;
    this.cartService.getCartInfo(id).subscribe(
      (res) => {
        // console.log(res);
        this.cartQuantity = res.totalQuantity;
      }
    );
  }

  showCart()
  {
    let isLogin = this.AuthFrontendService.checklogin();
    if(isLogin){
      let id = sessionStorage.getItem('customer_id')!;
      this.router.navigate(['customer/' + id + '/cart-list']);
    }
  }

  goAuthorDetail(id: number) {
    this.router.navigate(['author-detail/' + id]);

  }

  goCategoryList(id: number) {
    this.router.navigate(['category-list/' + id]);
  }



  searchBooks(e: any) {
    let data = e.target.value;
    if (data) {
      this.router.navigate(['search-book/' + data]);
    }
  }

  cartHistory()
  {
    this.router.navigate(['cart/history']);
  }

  // getUserName()
  // {
  //   this.username = sessionStorage.getItem('customer_name')!;
  // }

  homeLogout()
  {
    if(confirm('Bạn muốn đăng xuất khỏi hệ thống?')){
      this.AuthFrontendService.homeLogout().subscribe(
        (res) => {
          if(res.status === 'success'){
            sessionStorage.clear();
            this.username = '';
          }
        }
      );
    }
  }

}
