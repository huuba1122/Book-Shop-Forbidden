import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {

  isDropSidebar = false;
  isDropBookList = false;
  constructor() { }

  ngOnInit(): void {
  }

  dropUserList(){
    this.isDropSidebar = !this.isDropSidebar
  }

  dropBookList(){
    this.isDropBookList = !this.isDropBookList
  }
}
