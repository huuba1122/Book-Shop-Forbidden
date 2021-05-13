import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { BehaviorSubject } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class AuthFrontendService {

  base_url = environment.base_url;

  // private userName = new BehaviorSubject(null);
  // customerName$ = this.userName.asObservable();
  constructor(
    private http: HttpClient,
    private router: Router
  ) { }

  homeLogin(data:any):Observable<any>
  {
    return this.http.post(this.base_url + '/login', data);
  }

  homeLogout() : Observable<any>
  {
    return this.http.post(this.base_url + '/customer/logout','', {
      headers: this.getHeaders()
    });
  }

  getUser() : Observable<any>
  {
    return this.http.get(this.base_url + '/customer', {
      headers: this.getHeaders()
    });
  }

  getHeaders() {
    return new HttpHeaders({
      'Authorization': "Bearer " + sessionStorage.getItem('token_customer')
    });
  }

  checklogin()
  {
    let token = sessionStorage.getItem('token_customer');
    if(token != null){
      return true;
    }else{
      this.router.navigate(['login']);
      return false;
    }
  }
}
