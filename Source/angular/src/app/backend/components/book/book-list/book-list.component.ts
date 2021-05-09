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
        this.books = res;
        this.count = this.books.length;
      }
    )
  }

  searchBooks(e:any){
    let data = e.target.value;
    if(data){
      let formData = new FormData();
      formData.append('data', data);
      this.bookService.adminSearchBook(formData).subscribe(
        (res) => {
          console.log(res);
          this.books = res;
          this.count = this.books.length;
        }
      )
    }else{
      this.getAllBook();
    }
  }


  onTableDataChange(e:any){
    this.page = e;
  }

  deleteBook(id:number, name:string)
  {
    if(confirm('Xác nhận xóa đầu sách có tên: ' + name)){
      this.bookService.adminDeleteBook(id).subscribe(
        (res) => {
          if(res.status === 'success'){
            this.getAllBook();
            this.toastr.success('Xóa sách thành công', 'Thông báo')
          }
        }, error => {
          this.toastr.success('Xóa sách thất bại! Vui lòng liên hệ admin.', 'Thông báo')
          console.log(error)
        }
      )
    }
  }

}
