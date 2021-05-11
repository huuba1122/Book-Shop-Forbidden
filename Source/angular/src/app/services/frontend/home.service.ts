import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class HomeService {

  base_url = environment.base_url;
  headers = new HttpHeaders();
  constructor(private http: HttpClient) { }

  homeGetAllBooks(): Observable<any> {
    return this.http.get(this.base_url + '/home/book-all', {
      headers: this.headers
    });
  }

  homeGetTopicBooks(data: any): Observable<any> {
    return this.http.post(this.base_url + '/home/book-topic', data, {
      headers: this.headers
    });
  }

  homeGetTenNewBooks(): Observable<any> {
    return this.http.get(this.base_url + '/home/book-news', {
      headers: this.headers
    });
  }

  homeSearchBook(data:any):Observable<any>
  {
    return this.http.post(this.base_url + '/home/search',data, {
     headers: this.headers
   });
  }

  homeGetBookByAuthorId(id:any):Observable<any>
   {
      return this.http.get(this.base_url + '/home/'+ id + '/author-id', {
        headers: this.headers
      });
   }

   homeShowBookDetail(id:any):Observable<any>
   {
      return this.http.get(this.base_url + '/home/'+id + '/show-detail', {
        headers: this.headers
      });
   }

   homeGetAllCategory()
   {
    return this.http.get(this.base_url + '/home/category-all', {
      headers: this.headers
    });

   }




}
