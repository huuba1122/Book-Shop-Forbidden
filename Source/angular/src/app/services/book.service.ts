import { HttpClient } from '@angular/common/http';
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
    return this.http.get(this.authService.base_url + '/admin/book/list', this.authService.getHeader());
  }

  adminCreateBook(data: any): Observable<any>{
    return this.http.post(this.authService.base_url+ '/admin/book/store', data, this.authService.getHeader());
  }

  adminGetBook(id:any):Observable<any>
   {
      return this.http.get(this.authService.base_url + '/admin/book/'+id, this.authService.getHeader());
   }


   adminUpdateBook(data:any, id:number)
   {
     return this.http.put(this.authService.base_url + '/admin/book/'+ id +'/update',data,this.authService.getHeader());
   }

   adminDeleteBook(id: number): Observable<any>
   {
      return this.http.delete(this.authService.base_url + '/admin/book/' + id + '/delete', this.authService.getHeader());
   }

}
