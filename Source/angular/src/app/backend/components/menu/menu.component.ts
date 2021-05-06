import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {

  isDropSidebar = false;
  isDropBookList = false;
  user_name = '';
  constructor(
    private router: Router,
    private authService : AuthService
  ) {
    this.user_name = sessionStorage.getItem('user_name')!;
   }

  ngOnInit(): void {
  }

  dropUserList(){
    this.isDropSidebar = !this.isDropSidebar
  }

  dropBookList(){
    this.isDropBookList = !this.isDropBookList
  }

  adminLogout(){
    if( confirm('Are you sure want to logout?') ){
      // console.log(sessionStorage.getItem('token_admin'));
      this.authService.adminLogout().subscribe(
        (res) => {
          // console.log(res);
          if(res.status === 'success'){
            sessionStorage.clear();
            this.router.navigate(['/admin/login']);
          }
        }
      )
    }
  }
}
