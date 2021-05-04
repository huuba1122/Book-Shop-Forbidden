import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';
import { Observable } from 'rxjs';
import { AuthService } from '../auth.service';


@Injectable({
  providedIn: 'root'
})
export class AuthorService {

  httpOption:any;
  url:any;
  constructor(
    private http: HttpClient,
    private authService: AuthService
  ) {
    this.httpOption = this.authService.httpOptions;
    this.url = this.authService.base_url;
   }

   adminGetAllAuthor():Observable<any>
   {
      return this.http.get(this.url + '/admin/author/list', this.httpOption);
   }
}
