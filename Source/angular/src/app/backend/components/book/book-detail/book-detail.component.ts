import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { BookService } from 'src/app/services/book.service';
import { environment } from 'src/environments/environment.prod';
import { Books } from '../Book';

@Component({
  selector: 'app-book-detail',
  templateUrl: './book-detail.component.html',
  styleUrls: ['./book-detail.component.css']
})
export class BookDetailComponent implements OnInit {

  id!: number;
  book: Books = {};
  image_path = environment.image_url;



  constructor(
    private routeActive: ActivatedRoute,
    private router: Router,
    private bookService: BookService
  ) { }

  ngOnInit(): void {
    this.id = +this.routeActive.snapshot.paramMap.get("id")!;
    this.bookService.adminShowBookDetail(this.id).subscribe(
      res => {
        // console.log(res);
        this.book = res[0];
        
      }, error => console.log(error))
  }


  goList() {
    this.router.navigate(['admin/book-list']);
  }
  
  goAuthorDetail(id: number){
    this.router.navigate(['admin/author-detail/' + id]);

  }


}
