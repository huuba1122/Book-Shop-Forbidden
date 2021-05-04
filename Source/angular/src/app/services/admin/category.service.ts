import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';
import { Observable } from 'rxjs';
import { AuthService } from '../auth.service';


@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  httpOption:any;
  constructor(
    private authService: AuthService,
    private http: HttpClient
    ) {
    this.httpOption = this.authService.httpOptions;
   }

   adminGetAllCategory(){
    return this.http.get(this.authService.base_url + '/admin/category/list',this.httpOption);
   }

   adminCreateCategory(data:any): Observable<any>{
      return this.http.post(this.authService.base_url + '/admin/category/store', data, this.httpOption);
   }

   adminSearchCategory(data:any):Observable<any>{
     return this.http.post(this.authService.base_url + '/admin/category/search', data, this.httpOption);
   }

   adminGetCategory(id:any):Observable<any>
   {
      return this.http.get(this.authService.base_url + '/admin/category/'+id, this.httpOption);
   }

   adminUpdateCategory(data:any, id:number)
   {
     return this.http.put(this.authService.base_url + '/admin/category/'+ id +'/update',data,this.httpOption);
   }

   adminDeleteCategory(id: number): Observable<any>
   {
      return this.http.delete(this.authService.base_url + '/admin/category/' + id + '/delete', this.httpOption);
   }
}
