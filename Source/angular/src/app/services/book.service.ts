import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class BookService {
  httpOption: any;
  constructor(private authService: AuthService,
              private http: HttpClient
              ) {}

  adminGetAllBook(){
    return this.http.get(this.authService.base_url + '/admin/book/list', {
      headers: this.getHeaders()
    });
  }

  adminGetTenNewBook(){
    return this.http.get(this.authService.base_url + '/admin/book/list-ten', {
      headers: this.getHeaders()
    });
  }

  adminCreateBook(data: any): Observable<any>{
    return this.http.post(this.authService.base_url+ '/admin/book/store', data, {
      headers: this.getHeaders()
    });
  }

  adminGetBook(id:any):Observable<any>
   {
      return this.http.get(this.authService.base_url + '/admin/book/'+id, {
        headers: this.getHeaders()
      });
   }

   adminShowBookDetail(id:any):Observable<any>
   {
      return this.http.get(this.authService.base_url + '/admin/book/'+id + '/show-detail', {
        headers: this.getHeaders()
      });
   }

   adminCountBooks():Observable<any>
   {
      return this.http.get(this.authService.base_url + '/admin/book/count', {
        headers: this.getHeaders()
      });
   }

   adminGetBookByAuthorId(id:any):Observable<any>
   {
      return this.http.get(this.authService.base_url + '/admin/book/'+ id + '/author-id', {
        headers: this.getHeaders()
      });
   }

   adminGetBookByCategoryId(id:any):Observable<any>
   {
      return this.http.get(this.authService.base_url + '/admin/book/'+id+ '/category-id', {
        headers: this.getHeaders()
      });
   }


   adminUpdateBook(data:any, id:number):Observable<any>
   {
     return this.http.post(this.authService.base_url + '/admin/book/'+ id +'/update',data, {
      headers: this.getHeaders()
    });
   }

   adminSearchBook(data:any):Observable<any>
   {
     return this.http.post(this.authService.base_url + '/admin/book/search',data, {
      headers: this.getHeaders()
    });
   }

   adminDeleteBook(id: number): Observable<any>
   {
      return this.http.delete(this.authService.base_url + '/admin/book/' + id + '/delete',{
        headers: this.getHeaders()
      });
   }

   adminGetCategory(){
    return this.http.get(this.authService.base_url + '/admin/category/list',{
      headers: this.getHeaders()
    });
   }

   adminGetAuthor(){
    return this.http.get(this.authService.base_url + '/admin/author/list',{
      headers: this.getHeaders()
    });
   }


   adminGePublisher(){
    return this.http.get(this.authService.base_url + '/admin/publisher/list',{
      headers: this.getHeaders()
    });
   }

   getHeaders() {
    return new HttpHeaders({
      'Authorization': "Bearer " + sessionStorage.getItem('token_admin')
    });
  }
   
}
