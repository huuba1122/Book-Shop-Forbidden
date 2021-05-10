import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Books } from 'src/app/backend/components/book/Book';
import { BookService } from 'src/app/services/book.service';
import { environment } from 'src/environments/environment.prod';
import { IUser } from '../IUser';

@Component({
  selector: 'app-book-list',
  templateUrl: './book-list.component.html',
  styleUrls: ['./book-list.component.css']
})
export class BookListComponent implements OnInit {
  books: any = [];
  page = 1;
  count = 0;
  pageSize = 9;
  image_path = environment.image_url;



  constructor(private bookService: BookService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.getAllBook();
  }

  onTableDataChange(e:any){
    this.page = e;
  }

  getAllBook(){
    this.bookService.adminGetAllBook().subscribe(
      (res)  => {
        this.books = res;
        console.log(res)
        this.count = this.books.length;
      }
    )
  }





}
