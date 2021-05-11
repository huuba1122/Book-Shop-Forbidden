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
  // image_path = environment.image_url;


  constructor(
    private router: Router,
    private homeService: HomeService
  ) { }

  ngOnInit(): void {
    this.getAllAuthor();
    this.getCategoryAll();
    // this.getBookNews();
  }

  getAllAuthor() {
    this.homeService.homeGetAllAuthors().subscribe(
      (res) => {
        this.authors = res;
        console.log(res);
        // this.count = this.authors.length;
      }
    )
  }

  getCategoryAll() {
    this.homeService.homeGetAllCategory().subscribe(
      (res) => {
        this.categories = res;
        console.log(res);
      }
    )
  }

}
