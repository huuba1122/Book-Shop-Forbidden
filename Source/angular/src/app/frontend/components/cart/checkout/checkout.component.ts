import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CartService } from 'src/app/services/cart/cart.service';
import { ToastrService } from 'ngx-toastr';
import { AuthFrontendService } from 'src/app/services/frontend/auth-frontend.service';
import { IUser } from '../../IUser';


@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent implements OnInit {

  customer: IUser = {};
  cartInfo: any;
  cartList: any;
  des = '';
  constructor(
    private router: Router,
    private cartService: CartService,
    private toastr: ToastrService,
    private routerActive: ActivatedRoute,
    private authFrontendService: AuthFrontendService

  ) { }

  ngOnInit(): void {
    let customerId = +this.routerActive.snapshot.paramMap.get('id')!;
    this.getCustomerInfo();
    this.showCart(customerId);
    this.getCartInfo(customerId);

  }

  getCustomerInfo() {
    this.authFrontendService.getUser().subscribe(
      (res) => {
        this.customer = res;
        // console.log(this.customer);
      }
    );
  }

  showCart(id: any) {
    this.cartService.showCart(id).subscribe(
      (res) => {
        this.cartList = res;
        // console.log(this.cartList);
      }
    );
  }

  getCartInfo(id: any) {
    this.cartService.getCartInfo(id).subscribe(
      (res) => {
        this.cartInfo = res;
        // console.log(this.cartInfo);
      }
    );
  }

  checkout() {
    console.log(this.des);
    let formData = new FormData();
    formData.append('des', this.des);
    this.cartService.checkout(formData).subscribe(
      (res) => {
        console.log(res);
        if(res.status === 'success'){
          this.emptyCart();
          this.toastr.success('Hãy kiểm tra email của bạn để cập nhật thông tin!', 'Đặt hàng thành công');
          this.router.navigate(['']);
        }
      }
    );

  }

  cartDescription(e: any) {
    this.des = e.target.value;
  }

  emptyCart()
  {
    this.cartService.emptyCart(sessionStorage.getItem('customer_id')).subscribe();
  }

  gotoHome()
  {
    this.router.navigate(['']);
  }

}
