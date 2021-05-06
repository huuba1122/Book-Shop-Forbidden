import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class AuthService {
  base_url = environment.base_url;
  constructor(private http: HttpClient) { }

  adminLogin(data: any): Observable<any> {
    return this.http.post(this.base_url + '/admin/login', data);
  }

  adminLogout(): Observable<any> {
    console.log("Bearer " + sessionStorage.getItem('token_admin'));

    return this.http.post(this.base_url + '/admin/logout', '', this.getHeader());
  }

  getHeader() {
    let httpOptions = {
      headers: new HttpHeaders({
        'Access-Control-Allow-Origin': '*',
        'Content-Type' : 'multipart/form-data',
        'Accept': "application/json",
        'Authorization': "Bearer " + sessionStorage.getItem('token_admin')
      })
    }
    return httpOptions;
  }
}
