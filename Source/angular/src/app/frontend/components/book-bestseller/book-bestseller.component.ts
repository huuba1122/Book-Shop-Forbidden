import { Component, OnInit } from '@angular/core';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-book-bestseller',
  templateUrl: './book-bestseller.component.html',
  styleUrls: ['./book-bestseller.component.css']
})
export class BookBestsellerComponent implements OnInit {
  image_path = environment.image_url;
  bookBestSeller!: any[];
  page = 1;
  count = 0;
  pageSize = 9;
  constructor(
    private homeService: HomeService
  ) { }

  ngOnInit(): void {
    this.getBookBestSeller();
  }

  getBookBestSeller() {
    let formData = new FormData();
    formData.append('column', 'best_seller');
    this.homeService.homeGetTopicBooks(formData).subscribe(
      (res) => {
        this.bookBestSeller = res;
        console.log(res)
      }
    )
  }

  onTableDataChange(e:any){
    this.page = e;
  }
}
