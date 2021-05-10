import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthorService } from 'src/app/services/admin/author.service';
import { CategoryService } from 'src/app/services/admin/category.service';
import { BookService } from 'src/app/services/book.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  quantityOfBook:any;
  quantityOfAuthor:any;
  quantityOfCategory:any;
  books:any;
  authors:any;
  image_path = environment.image_url;
  constructor(
    private router: Router,
    private bookService: BookService,
    private categoryService: CategoryService,
    private authorService: AuthorService
  ) { }

  ngOnInit(): void {
    this.countBooks();
    this.countAuthors();
    this.countCategories();
    this.getTenNewBook();
    this.getTenNewAuthor();
  }

  countBooks()
  {
    this.bookService.adminCountBooks().subscribe(
      (res) => {
        this.quantityOfBook = res;
        // console.log(this.quantityOfBook);
      }
    );
  }

  countAuthors(){
    this.authorService.adminCountAuthors().subscribe(
      (res) => {
        this.quantityOfAuthor = res;
        // console.log(this.quantityOfAuthor);
      }
    );
  }

  countCategories(){
    this.categoryService.adminCountCategories().subscribe(
      (res) => {
        this.quantityOfCategory = res
        // console.log(this.quantityOfCategory);
      }
    );
  }

  getTenNewBook(){
      this.bookService.adminGetTenNewBook().subscribe(
        (res) => {
          this.books = res;
          console.log(this.books);
        }
      );
  }

  getTenNewAuthor(){
    this.authorService.adminGetTenNewAuthor().subscribe(
      (res) => {
        this.authors = res;
        console.log(this.authors);
      }
    );
  }

}
