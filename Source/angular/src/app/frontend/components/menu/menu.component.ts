import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthorService } from 'src/app/services/admin/author.service';
import { CategoryService } from 'src/app/services/admin/category.service';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {

  bookNews: any;
  authors: any = [];
  categories: any = [];
  books: any = [];
  count = 0;
  image_path = environment.image_url;


  constructor(private authorService: AuthorService,
    private categoryService: CategoryService,
    private router: Router,
    private homeService: HomeService


  ) { }

  ngOnInit(): void {
    this.getAllAuthor();
    this.getCategoryAll();
    this.getBookNews();
  }

  getAllAuthor() {
    this.authorService.adminGetAllAuthor().subscribe(
      (res) => {
        this.authors = res;
        // console.log(res)
        // this.count = this.authors.length;
      }
    )
  }

  getCategoryAll() {
    this.categoryService.adminGetAllCategory().subscribe(
      (res) => {
        this.categories = res;
      }
    )
  }


  getBookNews(){
    this.homeService.homeGetTenNewBooks().subscribe(
      (res) => {
        this.bookNews = res
      }
    )
  }


  searchBooks(e: any) {
    let data = e.target.value;
    if (data) {
      let formData = new FormData();
      formData.append('search', data);
      this.homeService.homeSearchBook(formData).subscribe(
        (res) => {
          // console.log(res);
          this.books = res[0];
          // this.count = this.books.length;
        }
      )
    } else {
      this.getBookNews()
      
    }
  }
}
