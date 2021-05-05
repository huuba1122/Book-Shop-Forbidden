import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { BookService } from 'src/app/services/book.service';

@Component({
  selector: 'app-book-list',
  templateUrl: './book-list.component.html',
  styleUrls: ['./book-list.component.css']
})
export class BookListComponent implements OnInit {
  createBookForm!: FormGroup;
  books: any;
  page = 1;
  count = 0;
  pageSize = 3;

  constructor(
    private bookService: BookService,
    private formbd: FormBuilder,
    private router: Router
  ) { 
    this.createBookForm = this.formbd.group({
      name: ['', Validators.required, Validators.minLength(6)],
      category_id: ['', Validators.required],
      author_id: ['', Validators.required],
      year_of_publication: ['', Validators.required],
      isbn: ['', Validators.required],
      publisher_id: ['', Validators.required],
      license: ['', Validators.required],
      image: ['', Validators.required]
  
    })
  }

  ngOnInit(): void {
    this.getAllBook();
  }

  getAllBook(){
    this.bookService.adminGetAllBook().subscribe(
      (res)  => {
        this.books = res;
        this.count = this.books.length;
      }
    )
    
  }

  

}
