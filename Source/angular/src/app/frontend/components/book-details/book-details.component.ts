import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { HomeService } from 'src/app/services/frontend/home.service';
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-book-details',
  templateUrl: './book-details.component.html',
  styleUrls: ['./book-details.component.css']
})
export class BookDetailsComponent implements OnInit {
  image_path = environment.image_url;
  id!: number;
  book: any;
  constructor(private homeService: HomeService,
               private routeActive: ActivatedRoute
              
    ) { }

  ngOnInit(): void {
    this.getBookDetail();
  }

  getBookDetail(){
    this.id = +this.routeActive.snapshot.paramMap.get("id")!;
    this.homeService.homeShowBookDetail(this.id).subscribe(
      res => {
        console.log(res);
        this.book = res[0];
        
      }, error => console.log(error))

  }


  

}
