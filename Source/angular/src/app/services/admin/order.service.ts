import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { AuthService } from '../auth.service';

@Injectable({
  providedIn: 'root'
})
export class OrderService {
  url: any;
  constructor(
    private http: HttpClient,
    private authService: AuthService
  ) {
    this.url = this.authService.base_url;
  }

  adminGetAllOrder(): Observable<any> {
    return this.http.get(this.url + '/admin/order/list', {
      headers: this.getHeaders()
    });
  }


  getHeaders() {
    return new HttpHeaders({
      'Authorization': "Bearer " + sessionStorage.getItem('token_admin')
    });
  }

  adminCountOrders():Observable<any>
  {
     return this.http.get(this.authService.base_url + '/admin/order/count', {
       headers: this.getHeaders()
     });
  }

}
