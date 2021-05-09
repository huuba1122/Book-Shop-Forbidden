import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Author } from 'src/app/backend/components/authors/author';
import { AuthorService } from 'src/app/services/admin/author.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-author-detail',
  templateUrl: './author-detail.component.html',
  styleUrls: ['./author-detail.component.css']
})
export class AuthorDetailComponent implements OnInit {

  id!: number;
  author!: Author;
  image_path = environment.image_url;



  constructor(
    private routeActive: ActivatedRoute,
    private router: Router,
    private authorService: AuthorService
  ) { }

  ngOnInit(): void {

    this.author = new Author();
    this.id = +this.routeActive.snapshot.paramMap.get("id")!;
    this.authorService.adminGetAuthor(this.id).subscribe(
      res => {
        console.log(res);
        this.author = res;
      }, error => console.log(error))
  }

  



}
