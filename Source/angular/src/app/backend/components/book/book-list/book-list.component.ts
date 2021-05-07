import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BookService } from 'src/app/services/book.service';

@Component({
  selector: 'app-book-list',
  templateUrl: './book-list.component.html',
  styleUrls: ['./book-list.component.css']
})
export class BookListComponent implements OnInit {
  createBookForm!: FormGroup;
  books: any;
  page = 1;
  count = 0;
  pageSize = 3;

  constructor(
    private bookService: BookService,
    private formbd: FormBuilder,
    private router: Router,
    private toastr: ToastrService
  ) { 
    this.createBookForm = this.formbd.group({
      name: ['', Validators.required, Validators.minLength(6)],
      category_id: ['', Validators.required],
      author_id: ['', Validators.required],
      year_of_publication: ['', Validators.required],
      isbn: ['', Validators.required],
      publisher_id: ['', Validators.required],
      license: ['', Validators.required],
      image: ['', Validators.required]
  
    })
  }

  ngOnInit(): void {
    this.getAllBook();
  }

  getAllBook(){
    this.bookService.adminGetAllBook().subscribe(
      (res)  => {
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
    console.log(id, name);
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
