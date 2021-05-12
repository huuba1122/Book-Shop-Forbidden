import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CartService } from 'src/app/services/cart/cart.service';
import { environment } from 'src/environments/environment.prod';
import { ToastrService } from 'ngx-toastr';


@Component({
  selector: 'app-cart-list',
  templateUrl: './cart-list.component.html',
  styleUrls: ['./cart-list.component.css']
})
export class CartListComponent implements OnInit {

  cartList: any;
  img_path = environment.image_url;
  customerId: any;
  constructor(
    private routerActive: ActivatedRoute,
    private router: Router,
    private cartService: CartService,
    private toastr: ToastrService,
  ) { }

  ngOnInit(): void {
    this.showCart();
  }

  showCart() {
    let id = +this.routerActive.snapshot.paramMap.get('id')!;
    this.customerId = id;
    this.cartService.showCart(id).subscribe(
      (res) => {
        //  console.log(res);
        this.cartList = res;
      }
    );
  }

  updateQuantity(e: any, id: any) {
    // let customerId = sessionStorage.getItem('customer_id')!;
    let formData = new FormData();
    formData.append('customerId', this.customerId);
    formData.append('bookId', id);
    formData.append('quantity', e.target.value);
    this.cartService.updateQuantity(formData).subscribe(
      (res) => {
        if (res.status === 'success') {
          this.showCart();
          this.toastr.success('Giỏ hàng của bạn đã được cập nhật!');
          this.getCartInfo(this.customerId);
        }
      }
    );
  }

  getCartInfo(id: any) {
    this.cartService.getCartInfo(id).subscribe(
      (res) => {
        // console.log(res);
        this.cartService.changeCartQuantity(res.totalQuantity);
      }
    );
  }

  goToHome() {
    this.router.navigate(['']);
  }

  clearCart() {
    if (confirm('Bạn có chắc chắn muốn làm trống giỏ hàng?')) {
      this.cartService.emptyCart(this.customerId).subscribe(
        (res) => {
          if (res.status === 'success') {
            this.toastr.success('Giỏ hàng đã được làm trống!');
            this.getCartInfo(this.customerId);
            this.goToHome();
          }
        }
      );
    }
  }

  checkout() {
    this.router.navigate(['customer/' + this.customerId + '/checkout']);
  }

  removeItem(bookId: any, bookName: any) {
    let formData = new FormData();
    formData.append('customerId', this.customerId);
    formData.append('bookId', bookId);
    this.cartService.removeItem(formData).subscribe(
      (res) => {
        if (res.status === 'success') {
          this.showCart();
          this.toastr.success(bookName + 'đã xóa khỏi giỏ hàng!');
          this.getCartInfo(this.customerId);
        }
      }
    );
  }

}
