import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Books } from 'src/app/backend/components/book/Book';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-book-list',
  templateUrl: './book-list.component.html',
  styleUrls: ['./book-list.component.css']
})
export class BookListComponent implements OnInit {
  books: any = [];
  count = 0;
  image_path = environment.image_url;


  constructor(private homeService: HomeService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.getAllBook();
  }

  getAllBook(){
    this.homeService.homeGetAllBooks().subscribe(
      (res)  => {
        this.books = res;
        console.log(res)
        this.count = this.books.length;
      }
    )
  }



}
