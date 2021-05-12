import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Author } from 'src/app/backend/components/authors/author';
import { AuthorService } from 'src/app/services/admin/author.service';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-author-detail',
  templateUrl: './author-detail.component.html',
  styleUrls: ['./author-detail.component.css']
})
export class AuthorDetailComponent implements OnInit {

  id!: number;
  author: any;
  image_path = environment.image_url;
  books: any;
  p: number = 1;

  constructor(
    private routeActive: ActivatedRoute,
    private router: Router,
    private homeService: HomeService
  ) { }
  ngOnInit(): void {
    this.getAuthorDetail();
    this.getBookByAuthorId(this.id);
  }

  getAuthorDetail() {
    this.id = +this.routeActive.snapshot.paramMap.get("id")!;
    this.homeService.homeGetAuthorId(this.id).subscribe(
      res => {
        console.log(res);
        this.author = res;

      }, error => console.log(error))
    console.log(this.id);

  }




  getBookByAuthorId(id: number) {
    this.homeService.homeGetBookByAuthorId(id).subscribe(
      res => {
        this.books = res;
        console.log(this.books);
      }, error => console.log(error)
    )
  }


  goBookDetail(id: number){
    this.router.navigate(['book-detail/' + id]);
  }

  



}
