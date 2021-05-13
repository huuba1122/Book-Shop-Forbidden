import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { CartService } from 'src/app/services/cart/cart.service';
import { AuthFrontendService } from 'src/app/services/frontend/auth-frontend.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  homeFormLogin: FormGroup;
  message = '';
  constructor(
    private router: Router,
    private formBd : FormBuilder,
    private AuthFrontendService: AuthFrontendService,
    private cartService: CartService
  ) {
    this.homeFormLogin = this.formBd.group({
      email: ['', Validators.compose([
        Validators.required,
        Validators.email
      ])],
      password: ['', Validators.required]
    })
   }

  ngOnInit(): void {
  }

  checkLogin()
  {
    let data = this.homeFormLogin.value;
    // console.log(data);
    this.AuthFrontendService.homeLogin(data).subscribe(
      (res) => {
        // console.log(res);
        if(res.status === 'successfully'){
          sessionStorage.clear();
          sessionStorage.setItem('token_customer', res.token);
          sessionStorage.setItem('customer_name', res.user.name);
          sessionStorage.setItem('customer_id', res.user.id);
          this.getCustomerName(sessionStorage.getItem('customer_name'));
          this.router.navigate(['']);
        }else{
          this.message = res.message;
        }
      }
    );
  }

  getCustomerName(name:any)
  {
        this.cartService.changeCustomerName(name);
  }

}
