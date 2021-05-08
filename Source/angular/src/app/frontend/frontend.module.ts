import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';


import { FrontendRoutingModule } from './frontend-routing.module';
import { LoginComponent } from './components/login/login.component';
import { BookListComponent } from './components/book-list/book-list.component';
import { MenuComponent } from './components/menu/menu.component';
import { AuthorDetailComponent } from './author-detail/author-detail.component';


@NgModule({
  declarations: [
    
    LoginComponent,
    BookListComponent,
    MenuComponent,
    AuthorDetailComponent
    
  ],
  imports: [
    CommonModule,
    FrontendRoutingModule,
    ReactiveFormsModule,
    FormsModule
    

  ]
})
export class FrontendModule { }
