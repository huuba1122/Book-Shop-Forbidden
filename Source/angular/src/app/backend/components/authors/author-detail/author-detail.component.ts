import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { AuthorService } from 'src/app/services/admin/author.service';
import { Author } from '../author';
import { environment } from 'src/environments/environment.prod';
import { BookService } from 'src/app/services/book.service';


@Component({
  selector: 'app-author-detail',
  templateUrl: './author-detail.component.html',
  styleUrls: ['./author-detail.component.css']
})
export class AuthorDetailComponent implements OnInit {
  id!: number;
  author!: Author;
  books: any;
  image_path = environment.image_url;



  constructor(
    private routeActive: ActivatedRoute,
    private router: Router,
    private toast: ToastrService,
    private authorService: AuthorService,
    private bookService: BookService
  ) { }

  ngOnInit(): void {

    this.author = new Author();

    this.id = +this.routeActive.snapshot.paramMap.get("id")!;
    this.authorService.adminGetAuthor(this.id).subscribe(
      res => {
        console.log(res);
        this.author = res;
      }, error => console.log(error));

    this.getBookByAuthorId(this.id);
  }


  goList() {
    this.router.navigate(['admin/author-list']);
  }

  getBookByAuthorId(id: number) {
    this.bookService.adminGetBookByAuthorId(id).subscribe(
      res => {
        this.books = res;
        console.log(this.books);
      }
    )

  }




}
