import { Component, OnInit } from '@angular/core';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-book-news',
  templateUrl: './book-news.component.html',
  styleUrls: ['./book-news.component.css']
})
export class BookNewsComponent implements OnInit {
  bookNews: any =[];
  page = 1;
  count = 0;
  pageSize = 9;
  image_path = environment.image_url;
  constructor(
  private homeService: HomeService
  ) { }

  ngOnInit(): void {
    this.getNewBooks();
  }

  getNewBooks() {
    this.homeService.homeGetTenNewBooks().subscribe(
      (res) => {
        this.bookNews = res;
        // console.log(res)
      }
    )
  }

  onTableDataChange(e:any){
    this.page = e;
  }

}
