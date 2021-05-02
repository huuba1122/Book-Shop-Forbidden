import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';

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
    private router: Router
  ) {
    this.loginForm =this.formbd.group({
      email: [''],
      password: ['']
    })
   }

  ngOnInit(): void {
  }

  checkLoginAdmin(){
    console.log(this.loginForm.value);
  }

}
