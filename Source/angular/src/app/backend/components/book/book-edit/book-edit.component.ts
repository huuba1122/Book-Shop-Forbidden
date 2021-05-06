import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BookService } from 'src/app/services/book.service';
import { Books } from '../Book';

@Component({
  selector: 'app-book-edit',
  templateUrl: './book-edit.component.html',
  styleUrls: ['./book-edit.component.css']
})
export class BookEditComponent implements OnInit {

  updateBookForm!: FormGroup;
  book: Books ={};
  categories: any= [];
  authors: any= [];
  publishers: any= [];
  count: any;
  id: any;
  // category: any;
  constructor(
    private routeActive: ActivatedRoute,
    private bookService: BookService,
    private fb: FormBuilder,
    private router: Router,
    private toastr: ToastrService
   
  ) {
    
  }

  ngOnInit(): void {
    this.getBook();
    this.loadData();
    this.loadAuthor();
    this.loadPublisher();

    this.updateBookForm = this.fb.group({
      name: ['', Validators.required],
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
      stock: ['', Validators.required],
      page_number: ['', Validators.required],
      language: ['', Validators.required],
      image: ['', Validators.required]

    })
    
    // this.books = this.bookService.adminGetCategory();
  }
  

  updateBook(){
    let data = this.updateBookForm.value;
    this.bookService.adminUpdateBook(data.id, data).subscribe(
      (res) => {
        console.log(res);
        this.router.navigate(['admin/book-list']);
        // this.toastr.success('Cap nhap thành công!', 'Thông báo');
        this.updateBookForm.reset();
      }, error => {
        console.log(error);
        this.toastr.error("You have failed update !")

      }
    )
  }

  getBook(){    
    this.id = +this.routeActive.snapshot.paramMap.get("id")!;
    this.bookService.adminGetBook(this.id).subscribe(
      res => {
        this.book = res;
        console.log(res);
        this.updateBookForm.patchValue({
          name: this.book.name,
          price: this.book.price,
          isbn: this.book.isbn,
          category_id: this.book.category_id,
          author_id: this.book.author_id,
          publisher_id: this.book.publisher_id,
          reprint_of_book: this.book.reprint_of_book,
          year_of_publication: this.book.year_of_publication,
          description: this.book.description,
          content: this.book.content,
          license: this.book.license,
          image: this.book.image,
          view: this.book.view,
          recommend: this.book.recommend,
          best_seller: this.book.best_seller,
          stock: this.book.stock,
          page_number: this.book.page_number,
          language: this.book.language
        })
      }
    )


  }

  submit(){
    console.log(this.updateBookForm.value);
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
