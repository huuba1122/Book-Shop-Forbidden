import { Component, OnInit } from '@angular/core';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-book-recommend',
  templateUrl: './book-recommend.component.html',
  styleUrls: ['./book-recommend.component.css']
})
export class BookRecommendComponent implements OnInit {
  bookRecommeds!: any[];
  image_path = environment.image_url;
  page = 1;
  count = 0;
  pageSize = 9;
  constructor( private homeService: HomeService) { }

  ngOnInit(): void {
    this.getBookRecommend();
  }

  getBookRecommend() {
    let formData = new FormData();
    formData.append('column', 'recommend');
    this.homeService.homeGetTopicBooks(formData).subscribe(
      (res) => {
        this.bookRecommeds = res
        // console.log(res);
      }
    )
  }

  onTableDataChange(e: any) {
    this.page = e;
  }

}
