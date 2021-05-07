import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {ReactiveFormsModule} from '@angular/forms';


import { FrontendRoutingModule } from './frontend-routing.module';
import { LoginComponent } from './login/login.component';


@NgModule({
  declarations: [
    
  
    LoginComponent
    
           
  ],
  imports: [
    CommonModule,
    FrontendRoutingModule,
    ReactiveFormsModule,
  ]
})
export class FrontendModule { }
