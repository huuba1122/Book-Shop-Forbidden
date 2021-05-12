import { Component, OnInit } from '@angular/core';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  books: any = [];
  page = 1;
  count = 0;
  pageSize = 9;
  image_path = environment.image_url;

  constructor(
    private homeService: HomeService
  ) { }

  ngOnInit(): void {
    this.getAllBook()
  }


  getAllBook() {
    this.homeService.homeGetAllBooks().subscribe(
      (res) => {
        this.books = res;
        // console.log(res)
        this.count = this.books.length;
      }
    )
  }

  onTableDataChange(e: any) {
    this.page = e;
  }

}
