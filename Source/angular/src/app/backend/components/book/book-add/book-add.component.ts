import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { CategoryService } from 'src/app/services/admin/category.service';
import { BookService } from 'src/app/services/book.service';

@Component({
  selector: 'app-book-add',
  templateUrl: './book-add.component.html',
  styleUrls: ['./book-add.component.css']
})
export class BookAddComponent implements OnInit {
  createBookForm!: FormGroup;
  books: any = [];
  categories: any= [];
  authors: any= [];
  publishers: any= [];
  count: any;
  id: any;
  // category: any;
  constructor(
    private bookService: BookService,
    private fb: FormBuilder,
    private router: Router,
    private toastr: ToastrService
   
  ) {
    this.createBookForm = this.fb.group({
      name: ['', Validators.required, Validators.minLength(6)],
      year_of_publication: ['', Validators.required],
      isbn: ['', Validators.required],
      category_id: ['', Validators.required],
      author_id: ['', Validators.required],
      publisher_id : ['', Validators.required],
      license: ['', Validators.required],
      price: ['', Validators.required],
      description: ['', Validators.required],
      content: ['', Validators.required],
      reprint_of_book: ['', Validators.required],
      view: ['', Validators.required],
      // recommend: ['', Validators.required],
      // best_seller: ['', Validators.required],
      // stock: ['', Validators.required],
      page_number: ['', Validators.required],
      language: ['', Validators.required],
      image: ['', Validators.required],

    })
  }

  ngOnInit(): void {
    this.loadData();
    this.loadAuthor();
    this.loadPublisher();
    // this.books = this.bookService.adminGetCategory();
  }
  

  createBook(){
    
    let data = this.createBookForm.value;
    this.bookService.adminCreateBook(data).subscribe(
      (res) => {
        console.log(res);
        this.router.navigate(['admin/book-list']);
        this.toastr.success('Thêm thành công!', 'Thông báo');
        this.createBookForm.reset();
      }, error => {
        console.log(error);
      }
    )
  }

  submit(){
    console.log(this.createBookForm.value);
  }

  loadData()
  {
    this.id = localStorage.getItem('id');
    this.bookService.adminGetCategory().subscribe(
      data => {
        // console.log(data);
        this.categories = data;
      }, error => console.log(error)
    );
  }
  loadAuthor(){
    this.id = localStorage.getItem('id');
    this.bookService.adminGetAuthor().subscribe(
      data => {
        // console.log(data);
        this.authors = data;
      }, error => console.log(error)
    );
  }

  loadPublisher(){
    this.id = localStorage.getItem('id');
    this.bookService.adminGePublisher().subscribe(
      data => {
        // console.log(data);
        this.publishers = data;
      }, error => console.log(error)
    );
  }

  
}
