import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';
import { Observable } from 'rxjs';
import { AuthService } from '../auth.service';


@Injectable({
  providedIn: 'root'
})
export class AuthorService {

  url: any;
  constructor(
    private http: HttpClient,
    private authService: AuthService
  ) {
    this.url = this.authService.base_url;
  }

  adminGetAllAuthor(): Observable<any> {
    return this.http.get(this.url + '/admin/author/list', {
      headers: this.getHeaders()
    });
  }

  adminGetAuthor(id: number): Observable<any> {
    return this.http.get(this.url + '/admin/author/' + id, {
      headers: this.getHeaders()
    });
  }

  adminUpdateAuthor(data: any, id: number): Observable<any> {
    return this.http.post(this.url + '/admin/author/' + id + '/update', data, {
      headers: this.getHeaders()
    });
  }
  adminCreateAuthor(data: any): Observable<any> {
    // console.log(this.getHeaders());
    return this.http.post<any>(this.url + '/admin/author/store', data, {
      headers: this.getHeaders()
    });
  }

  getHeaders() {
    return new HttpHeaders({
      'Authorization': "Bearer " + sessionStorage.getItem('token_admin')
    });
  }
}
