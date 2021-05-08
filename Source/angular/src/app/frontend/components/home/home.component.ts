import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthorService } from 'src/app/services/admin/author.service';
import { CategoryService } from 'src/app/services/admin/category.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  authors: any = [];
  categories: any =[];
  count = 0;
  image_path = environment.image_url;


  constructor(private authorService: AuthorService,
    private categoryService: CategoryService,
    private router: Router


  ) { }

  ngOnInit(): void {
    this.getAllAuthor();
    this.getCategoryAll();
  }

  getAllAuthor() {
    this.authorService.adminGetAllAuthor().subscribe(
      (res) => {
        this.authors = res;
        console.log(res)
        // this.count = this.authors.length;
      }
    )
  }

  getCategoryAll() {
    this.categoryService.adminGetAllCategory().subscribe(
      (res) => {
        this.categories = res;
        console.log(res)
      }
    )
  }

}
