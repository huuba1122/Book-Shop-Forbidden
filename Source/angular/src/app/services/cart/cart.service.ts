import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';
import { BehaviorSubject, Observable } from 'rxjs';



@Injectable({
  providedIn: 'root'
})
export class CartService {
  base_url = environment.base_url;
  private totalQuantity = new BehaviorSubject(null);
  private userName = new BehaviorSubject(sessionStorage.getItem('customer_name'));
  data$ = this.totalQuantity.asObservable();
  customerName$ = this.userName.asObservable();

  constructor(
    private router:Router,
    private http: HttpClient
  ) { }

  changeCartQuantity(quantity: any) {
    this.totalQuantity.next(quantity)
  }

  changeCustomerName(name: any) {
    this.userName.next(name)
  }

  addToCart(data: any): Observable<any> {
    return this.http.post(this.base_url + '/customer/cart-add', data, {
      headers: this.getHeaders()
    });
  }

  checkout(data: any): Observable<any> {
    return this.http.post(this.base_url + '/customer/checkout', data, {
      headers: this.getHeaders()
    });
  }

  updateQuantity(data: any): Observable<any> {
    return this.http.post(this.base_url + '/customer/cart-update', data, {
      headers: this.getHeaders()
    });
  }

  removeItem(data: any): Observable<any> {
    return this.http.post(this.base_url + '/customer/cart-remove-item', data, {
      headers: this.getHeaders()
    });
  }

  getCartInfo(id: any): Observable<any>
  {
    return this.http.get(this.base_url + '/customer/' + id + '/cart-info', {
      headers: this.getHeaders()
    });
  }

  showCart(id: any): Observable<any>
  {
    return this.http.get(this.base_url + '/customer/' + id + '/cart-list', {
      headers: this.getHeaders()
    });
  }

  emptyCart(id: any): Observable<any>
  {
    return this.http.get(this.base_url + '/customer/' + id + '/cart-delete', {
      headers: this.getHeaders()
    });
  }

  // order
  getOrderList(){
    return this.http.get(this.base_url + '/customer/order-list', {
      headers: this.getHeaders()
    });
  }

  cancelOrder(id: any) : Observable<any>
  {
    return this.http.post(this.base_url + '/customer/order-cancel/' + id,'', {
      headers: this.getHeaders()
    });
  }

  getHeaders() {
    return new HttpHeaders({
      'Authorization': "Bearer " + sessionStorage.getItem('token_customer')
    });
  }

}
