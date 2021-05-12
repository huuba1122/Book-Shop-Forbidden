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
  // image_path = environment.image_url;


  constructor(
    private router: Router,
    private homeService: HomeService,
    private cartService: CartService,
    private AuthFrontendService: AuthFrontendService,
  ) { }

  ngOnInit(): void {
    this.getAllAuthor();
    this.getCategoryAll();
    // this.getBookNews();
    this.cartService.data$.subscribe(res => this.cartQuantity = res);
    this.getCartInfo();
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

}
