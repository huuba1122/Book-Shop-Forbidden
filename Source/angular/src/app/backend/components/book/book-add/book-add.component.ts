import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BookService } from 'src/app/services/book.service';

@Component({
  selector: 'app-book-add',
  templateUrl: './book-add.component.html',
  styleUrls: ['./book-add.component.css']
})
export class BookAddComponent implements OnInit {
  createBookForm!: FormGroup;
  books: any = [];
  categories: any = [];
  authors: any = [];
  publishers: any = [];
  count: any;
  id: any;
  imgFile: any;
  imgSrc = '';
  isbn = '';
  constructor(
    private bookService: BookService,
    private fb: FormBuilder,
    private router: Router,
    private toastr: ToastrService

  ) {
    this.createBookForm = this.fb.group({
      name: ['', Validators.required],
      year_of_publication: ['', Validators.required],
      isbn: ['', Validators.required],
      category_id: ['', Validators.required],
      author_id: ['', Validators.required],
      publisher_id: ['', Validators.required],
      license: ['', Validators.required],
      price: ['', Validators.required],
      description: ['', Validators.required],
      content: ['', Validators.required],
      reprint_of_book: ['', Validators.required],
      recommend: [''],
      best_seller: [''],
      stock: [''],
      page_number: [''],
      language: ['', Validators.required],
      image: ['', Validators.required],

    })
  }

  ngOnInit(): void {
    this.loadData();
    this.loadAuthor();
    this.loadPublisher();
    this.isbn = this.randomInt(0, 1) + '-' + this.randomInt(100, 999) + '-' + this.randomInt(10000, 99999) + '-' + this.randomInt(1, 9)
    // this.books = this.bookService.adminGetCategory();
    this.createBookForm.patchValue({
      isbn: this.isbn,
      recommend:0,
      best_seller:0
    })
  }


  createBook() {
    console.log(this.imgFile);
    let data = this.createBookForm.value;
    // console.log(JSON.stringify(data));
    let formData = new FormData();
    formData.append('data', JSON.stringify(data));
    console.log(data);
    formData.append('file', this.imgFile, this.imgFile.name);

    this.bookService.adminCreateBook(formData).subscribe(
      (res) => {
        console.log(res);
        if (res.status === 'success') {
          this.router.navigate(['admin/book-list']);
          this.toastr.success('Thêm sách mới thành công!', 'Thông báo');
        }
      }, error => {
        this.toastr.error('Thêm sách mới thất bại. Vui lòng liên hệ admin!', 'Thông báo');
      }
    );
  }

  onImageChange(e: any) {
    const reader = new FileReader();
    if (e.target.files.length && e.target.files) {
      this.imgFile = e.target.files[0];
      // console.log(this.imgFile);

      reader.readAsDataURL(e.target.files[0]);
      reader.onload = (e: any) => {
        this.imgSrc = e.target.result
      }
    }
  }

  isBestSeller(e: any) {
    if (e.target.checked) {
      this.createBookForm.patchValue({
        best_seller: e.target.value
      })
    } else {
      this.createBookForm.patchValue({
        best_seller: 0
      })
    }
  }

  isRecommend(e: any) {
    if (e.target.checked) {
      this.createBookForm.patchValue({
        recommend: e.target.value
      })
    } else {
      this.createBookForm.patchValue({
        recommend: 0
      })
    }
  }

  loadData() {
    this.id = localStorage.getItem('id');
    this.bookService.adminGetCategory().subscribe(
      data => {
        // console.log(data);
        this.categories = data;
      }, error => console.log(error)
    );
  }
  
  loadAuthor() {
    this.id = localStorage.getItem('id');
    this.bookService.adminGetAuthor().subscribe(
      data => {
        // console.log(data);
        this.authors = data;
      }, error => console.log(error)
    );
  }

  loadPublisher() {
    this.id = localStorage.getItem('id');
    this.bookService.adminGePublisher().subscribe(
      data => {
        // console.log(data);
        this.publishers = data;
      }, error => console.log(error)
    );
  }

  randomInt(min: number, max: number) {
    return Math.floor(Math.random() * (max - min + 1) + min);
  }

}
