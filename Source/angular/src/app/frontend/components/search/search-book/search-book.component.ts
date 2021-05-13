import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-search-book',
  templateUrl: './search-book.component.html',
  styleUrls: ['./search-book.component.css']
})
export class SearchBookComponent implements OnInit {
  data: any = [];
  books: any = [];
  page = 1;
  count = 0;
  pageSize = 6;
  image_path = environment.image_url;
  constructor( private homeSerivce: HomeService,
               private routerActive: ActivatedRoute,
               private router: Router,
    ) { }

  ngOnInit(): void {
    this.searchBooks()
  }

  searchBooks(){
    this.data = this.routerActive.snapshot.paramMap.get("search")!;
    let formData = new FormData();
    formData.append('search', this.data);
    this.homeSerivce.homeSearchBook(formData).subscribe(
      res => {
        this.data = res;
        console.log(res)
      }, error => console.log(error)
    )
  }

  onTableDataChange(e:any){
    this.page = e;
  }

 
  goBookDetail(id: number){
    this.router.navigate(['book-detail/' + id]);
  }



}
