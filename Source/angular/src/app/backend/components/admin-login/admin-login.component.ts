import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';


@Component({
  selector: 'app-admin-login',
  templateUrl: './admin-login.component.html',
  styleUrls: ['./admin-login.component.css']
})
export class AdminLoginComponent implements OnInit {

  loginForm: FormGroup;
  message = '';
  constructor(
    private formbd: FormBuilder,
    private router: Router,
    private authService: AuthService
  ) {
    this.loginForm =this.formbd.group({
      email: [''],
      password: ['']
    })
   }

  ngOnInit(): void {
  }

  checkLoginAdmin(){
    // console.log(this.loginForm?.value);

    let data = this.loginForm?.value;
    this.authService.adminLogin(data).subscribe(
      (res) => {
        // console.log(res);
        if(res.status === 'successfully'){
          sessionStorage.removeItem('token_admin');
          sessionStorage.setItem('token_admin', res.token);
          sessionStorage.setItem('user_name', res.user.name);
          this.router.navigate(['admin']);
        }else{
          this.message = res.message;
        }
      }
    )
  }

}
