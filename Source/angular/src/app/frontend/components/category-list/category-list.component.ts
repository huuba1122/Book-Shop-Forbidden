import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-category-list',
  templateUrl: './category-list.component.html',
  styleUrls: ['./category-list.component.css']
})
export class CategoryListComponent implements OnInit {
  books: any = [];
  page = 1;
  count = 0;
  pageSize = 6;
  id!: number;

  image_path = environment.image_url;

  constructor(private homeService: HomeService,
             private routerActive: ActivatedRoute
         
    ) { }

  ngOnInit(): void {
    this.getBookCategory()
  }

  getBookCategory() {
    this.id = +this.routerActive.snapshot.paramMap.get("id")!;
    this.homeService.homeGetBookByCategoryId(this.id).subscribe(
      res => {
        console.log(res);
        this.books = res;

      }, error => console.log(error))
  }


  onTableDataChange(e:any){
    this.page = e;
  }
}
