import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BookService } from 'src/app/services/book.service';
import { environment } from 'src/environments/environment.prod';
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
  imgSrc = '';
  imgFile:any;
  image_path = environment.image_url;
  isShowOleImage = true;
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
      recommend: [''],
      best_seller: [''],
      stock: ['', Validators.required],
      page_number: ['', Validators.required],
      language: [''],
      image: ['']

    })
    
    this.id = +this.routeActive.snapshot.paramMap.get("id")!;
  }
  

  updateBook(){
    let data = this.updateBookForm.value;
    // console.log(JSON.stringify(data));
    let formData = new FormData();
    formData.append('data', JSON.stringify(data));
    if(this.imgFile){
      formData.append('file', this.imgFile, this.imgFile.name);
    }
    this.bookService.adminUpdateBook(formData, this.id).subscribe(

      (res) => {
          // console.log(res.status);
          if(res.status ==='success'){
            this.router.navigate(['admin/book-list']);
            this.toastr.success('Chỉnh Sửa sách thành công!', 'Thông báo');
          }
      },error => {
        this.toastr.error('Chỉnh Sửa sách thất bại. Vui lòng liên hệ admin!', 'Thông báo');
      }
    )
  }

  getBook(){    
    this.id = +this.routeActive.snapshot.paramMap.get("id")!;
    console.log(this.id);
    this.bookService.adminGetBook(this.id).subscribe(
      res => {
        this.book = res[0];
        console.log(this.book);
        this.updateBookForm.patchValue(
          {
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
          recommend: this.book.recommend,
          best_seller: this.book.best_seller,
          stock: this.book.stock,
          page_number: this.book.page_number,
          language: this.book.language
        }
        )
      }
    )


  }


  onImageChange(e: any) {
    const reader = new FileReader();
    if (e.target.files.length && e.target.files) {
      this.imgFile = e.target.files[0];
      // console.log(this.imgFile);

      reader.readAsDataURL(e.target.files[0]);
      reader.onload = (e: any) => {
        this.imgSrc = e.target.result;
        this.isShowOleImage = false;
      }
    }
  }

  isBestSeller(e: any) {
    if (e.target.checked) {
      this.updateBookForm.patchValue({
        best_seller: 1
      })
    } else {
      this.updateBookForm.patchValue({
        best_seller: 0
      })
    }
  }

  isRecommend(e: any) {
    if (e.target.checked) {
      this.updateBookForm.patchValue({
        recommend: 1
      })
    } else {
      this.updateBookForm.patchValue({
        recommend: 0
      })
    }
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
