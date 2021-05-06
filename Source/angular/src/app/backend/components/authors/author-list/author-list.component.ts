import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthorService } from 'src/app/services/admin/author.service';
import { ToastrService } from 'ngx-toastr';
import { environment } from 'src/environments/environment.prod';


@Component({
  selector: 'app-author-list',
  templateUrl: './author-list.component.html',
  styleUrls: ['./author-list.component.css']
})
export class AuthorListComponent implements OnInit {

  authors: any;
  page = 1;
  count = 0;
  pageSize = 5;
  image_path = environment.image_url;
  constructor(
    private router: Router,
    private authorService: AuthorService,
  ) { }

  ngOnInit(): void {
    this.getAllAuthor();
  }

  getAllAuthor()
  {
    this.authorService.adminGetAllAuthor().subscribe(
      res => {
        this.authors = res;
        this.count = this.authors.length;
      }
    );
  }

  onTableDataChange(e:any){
    this.page = e;
    console.log(e);
  }

}
