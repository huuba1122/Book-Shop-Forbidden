import { Component, OnInit } from '@angular/core';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  
  bookNews: any = [];
  books: any = [];
  image_path = environment.image_url;
  bookRecommeds! : any[];
  bookBestSeller!: any[];

  page = 1;
  count = 0;
  pageSize = 3;
  p: number = 1;
  p1: number =1;

  


  constructor(
    private homeService: HomeService

  ) { }

  ngOnInit(): void {
    this.getBookRecommend();
    this.getBookBestSeller();
    this.getNewBooks();

  }

  getBookRecommend() {
    let formData = new FormData();
    formData.append('column', 'recommend');
    this.homeService.homeGetTopicBooks(formData).subscribe(
      (res) => {
        this.bookRecommeds = res
      }
    )
  }

  getBookBestSeller() {
    let formData = new FormData();
    formData.append('column', 'best_seller');
    this.homeService.homeGetTopicBooks(formData).subscribe(
      (res) => {
        this.bookBestSeller = res;
      }
    )
  }

  getNewBooks(){
    this.homeService.homeGetTenNewBooks().subscribe(
      (res) => {
        this.bookNews = res;
      }
    )
  }

  searchBooks(e:any){
    let data = e.target.value;
    if(data){
      let formData = new FormData();
      formData.append('data', data);
      this.homeService.homeSearchBook(formData).subscribe(
        (res) => {
          console.log(res);
          this.books = res;
          this.count = this.books.length;
        }
      )
    }else{
      this.getNewBooks();
    }
  }


  onTableDataChange(e:any){
    this.page = e;
  }






}
