import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BookService } from 'src/app/services/book.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-book-list',
  templateUrl: './book-list.component.html',
  styleUrls: ['./book-list.component.css']
})
export class BookListComponent implements OnInit {
  
  books: any;
  page = 1;
  count = 0;
  pageSize = 5;
  image_url = environment.image_url;
  constructor(
    private bookService: BookService,
    private formbd: FormBuilder,
    private router: Router,
    private toastr: ToastrService
  ) {}

  ngOnInit(): void {
    this.getAllBook();
  }

  getAllBook(){
    this.bookService.adminGetAllBook().subscribe(
      (res)  => {
        // console.log(res);
        this.books = res;
        this.count = this.books.length;
      }
    )
  }


  onTableDataChange(e:any){
    this.page = e;
    // console.log(e);
  }

  deleteBook(id:number, name:string)
  {
    // console.log(id, name);
    if(confirm('Are you sure book name: ' + name)){
      this.bookService.adminDeleteBook(id).subscribe(
        (res) => {
          this.getAllBook();
          this.toastr.success('Message', 'Delete sucsess')
        }, error => console.log(error)
      )
    }
  }

}
