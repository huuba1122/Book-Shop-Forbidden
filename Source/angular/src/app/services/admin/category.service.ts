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

   adminGetAllCategory(){
    return this.http.get(this.authService.base_url + '/admin/category/list',this.authService.getHeader());
   }

   adminCreateCategory(data:any): Observable<any>{
      return this.http.post(this.authService.base_url + '/admin/category/store', data, this.authService.getHeader());
   }

   adminSearchCategory(data:any):Observable<any>{
     return this.http.post(this.authService.base_url + '/admin/category/search', data, this.authService.getHeader());
   }

   adminGetCategory(id:any):Observable<any>
   {
      return this.http.get(this.authService.base_url + '/admin/category/'+id, this.authService.getHeader());
   }

   adminUpdateCategory(data:any, id:number)
   {
     return this.http.put(this.authService.base_url + '/admin/category/'+ id +'/update',data,this.authService.getHeader());
   }

   adminDeleteCategory(id: number): Observable<any>
   {
      return this.http.delete(this.authService.base_url + '/admin/category/' + id + '/delete', this.authService.getHeader());
   }
}
