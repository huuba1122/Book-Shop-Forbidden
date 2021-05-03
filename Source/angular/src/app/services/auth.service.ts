import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';
import { Observable } from 'rxjs';

// header request
let headers_ob = new HttpHeaders({
  'Access-Control-Allow-Origin':'*',
  'Content-Type': 'application/json',
  'Authorization': "Bearer " + sessionStorage.getItem('token_admin')
});

// const httpOptions = {
//   headers: headers_ob
// }


@Injectable({
  providedIn: 'root'
})
export class AuthService {

  httpOptions = {
    headers: headers_ob
  }
  base_url = environment.base_url;
  constructor(private http:HttpClient) { }

  adminLogin(data: any): Observable<any> {
    return this.http.post(this.base_url + '/admin/login', data);
  }

  adminLogout(): Observable<any> {
    console.log("Bearer " + sessionStorage.getItem('token_admin'));
  
    return this.http.post(this.base_url + '/admin/logout', '',this.httpOptions);
  }
}
