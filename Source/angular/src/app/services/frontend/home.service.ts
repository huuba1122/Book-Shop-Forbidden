import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';


@Injectable({
  providedIn: 'root'
})
export class HomeService {

  base_url = environment.base_url;
  headers = new HttpHeaders();
  constructor(private http: HttpClient) { }

  homeGetAllBooks(){
    return this.http.get(this.base_url + '/home/book-all', {
      headers: this.headers
    });
  }


}
