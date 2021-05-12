import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CartService } from 'src/app/services/cart/cart.service';
import { ToastrService } from 'ngx-toastr';
import { AuthFrontendService } from 'src/app/services/frontend/auth-frontend.service';
import { IUser } from '../../IUser';

@Component({
  selector: 'app-history',
  templateUrl: './history.component.html',
  styleUrls: ['./history.component.css']
})
export class HistoryComponent implements OnInit {

  customer: IUser = {};
  orderList:any;
  constructor(
    private authFrontendService: AuthFrontendService,
    private router: Router,
    private cartService: CartService,
    private toastr: ToastrService,
  ) { }

  ngOnInit(): void {
    this.getCustomerInfo();
    this.getOderList();
  }


  getCustomerInfo() {
    this.authFrontendService.getUser().subscribe(
      (res) => {
        this.customer = res;
      }
    );
  }

  getOderList()
  {
    this.cartService.getOrderList().subscribe(
      (res) => {
        this.orderList = res;
        console.log(this.orderList);
      }
    );
  }

  cancelOrder(id: any)
  {
    if(confirm('Bạn thật sự muốn hủy đơn hàng!')){
      console.log(id);
      this.cartService.cancelOrder(id).subscribe(
        (res) => {
          // console.log(res);
          if(res.status == 'success'){
            this.getOderList();
          }
        }
      );
    }
  }

  goOrderDetail(id: any)
  {
    // this.router.navigate(['']);
  }
}
