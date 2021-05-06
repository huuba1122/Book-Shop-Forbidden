import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';
import { Observable } from 'rxjs';
import { AuthService } from '../auth.service';


@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  constructor(
    private authService: AuthService,
    private http: HttpClient
  ) {}

  adminGetAllCategory() {
    return this.http.get(this.authService.base_url + '/admin/category/list', {
      headers: this.getHeaders()
    });
  }

  adminCreateCategory(data: any): Observable<any> {
    // console.log(data);
    return this.http.post(this.authService.base_url + '/admin/category/store', data, {
      headers: this.getHeaders()
    });
  }

  adminSearchCategory(data: any): Observable<any> {
    return this.http.post(this.authService.base_url + '/admin/category/search', data, {
      headers: this.getHeaders()
    });
  }

  adminGetCategory(id: any): Observable<any> {
    return this.http.get(this.authService.base_url + '/admin/category/' + id, {
      headers: this.getHeaders()
    });
  }

  adminUpdateCategory(data: any, id: number) {
    return this.http.put(this.authService.base_url + '/admin/category/' + id + '/update', data, {
      headers: this.getHeaders()
    });
  }

  adminDeleteCategory(id: number): Observable<any> {
    return this.http.delete(this.authService.base_url + '/admin/category/' + id + '/delete', {
      headers: this.getHeaders()
    });
  }

  getHeaders() {
    return new HttpHeaders({
      'Authorization': "Bearer " + sessionStorage.getItem('token_admin')
    });
  }
}
