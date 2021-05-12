import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import { NgxPaginationModule } from 'ngx-pagination';



import { FrontendRoutingModule } from './frontend-routing.module';
import { LoginComponent } from './components/login/login.component';
import { BookListComponent } from './components/book-list/book-list.component';
import { MenuComponent } from './components/menu/menu.component';
import { AuthorDetailComponent } from './components/author-detail/author-detail.component';
import { CartListComponent } from './components/cart/cart-list/cart-list.component';
import { CheckoutComponent } from './components/cart/checkout/checkout.component';


@NgModule({
  declarations: [
    
    LoginComponent,
    BookListComponent,
    MenuComponent,
    AuthorDetailComponent,
    CartListComponent,
    CheckoutComponent
    
  ],
  imports: [
    CommonModule,
    FrontendRoutingModule,
    ReactiveFormsModule,
    FormsModule,
    NgxPaginationModule
    

  ]
})
export class FrontendModule { }
