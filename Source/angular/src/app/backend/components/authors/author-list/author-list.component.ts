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
    private toast: ToastrService
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

  deleteAuthor(id:number, name:string)
  {
    console.log(id, name);
    if(confirm('Bạn chắc chắn có muốn xóa tác giả : ' + name)){
      this.authorService.adminDeleteAuthor(id).subscribe(
        (res) => {
          this.getAllAuthor();
          this.toast.success('Thông báo', 'Xóa tác giả thành công!')
        }, error => console.log(error)
      )
    }
  }
  

  searchAuthor(e: any)
  {
    let data = {
      "name": e.target.value
    }
    if(data.name){
      this.authorService.adminSearchAuthor(data).subscribe(
        (res) => {
          this.authors = res;
          this.count = this.authors.length;
        }
      )
    }else{
      this.getAllAuthor();
    }
    
  }


  onTableDataChange(e:any){
    this.page = e;
    console.log(e);
  }

}
