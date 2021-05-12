import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NgxPaginationModule } from 'ngx-pagination';
// import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
// import { ToastrModule } from 'ngx-toastr';


import { BackendRoutingModule } from './backend-routing.module';
import { MenuComponent } from './components/menu/menu.component';
import { BookAddComponent } from './components/book/book-add/book-add.component';
import { BookEditComponent } from './components/book/book-edit/book-edit.component';
import { BookDetailComponent } from './components/book/book-detail/book-detail.component';
import { BookListComponent } from './components/book/book-list/book-list.component';
import { CategoryListComponent } from './components/categories/category-list/category-list.component';
import { AuthorListComponent } from './components/authors/author-list/author-list.component';
import { AuthorAddComponent } from './components/authors/author-add/author-add.component';
import { AuthorEditComponent } from './components/authors/author-edit/author-edit.component';
import { AuthorDetailComponent } from './components/authors/author-detail/author-detail.component';
import { AdminLoginComponent } from './components/admin-login/admin-login.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { CKEditorModule } from 'ng2-ckeditor';


@NgModule({
  declarations: [
    MenuComponent,
    BookListComponent,
    BookAddComponent,
    BookEditComponent,
    BookDetailComponent,
    CategoryListComponent,
    AuthorListComponent,
    AuthorAddComponent,
    AuthorEditComponent,
    AuthorDetailComponent,
    AdminLoginComponent,
    DashboardComponent
  ],
  imports: [
    CommonModule,
    BackendRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    NgxPaginationModule,
    CKEditorModule
    // BrowserAnimationsModule,
    // ToastrModule.forRoot()
  ]
})
export class BackendModule { }
