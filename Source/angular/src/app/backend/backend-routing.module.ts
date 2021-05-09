import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../guards/auth.guard';
import { AdminLoginComponent } from './components/admin-login/admin-login.component';
import { AuthorAddComponent } from './components/authors/author-add/author-add.component';
import { AuthorDetailComponent } from './components/authors/author-detail/author-detail.component';
import { AuthorEditComponent } from './components/authors/author-edit/author-edit.component';
import { AuthorListComponent } from './components/authors/author-list/author-list.component';
import { BookAddComponent } from './components/book/book-add/book-add.component';
import { BookDetailComponent } from './components/book/book-detail/book-detail.component';
import { BookEditComponent } from './components/book/book-edit/book-edit.component';
import { BookListComponent } from './components/book/book-list/book-list.component';
import { CategoryListComponent } from './components/categories/category-list/category-list.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { MenuComponent } from './components/menu/menu.component';

const routes: Routes = [
  {
    path: '',
    component: MenuComponent,
    children:[
      {path:'', component: DashboardComponent},
      
      // book
      {path:'book-list', component: BookListComponent},
      {path:'book-add', component: BookAddComponent},
      {path: 'book-edit/:id', component: BookEditComponent},
      {path: 'book-detail/:id', component: BookDetailComponent},
      
      // categories
      {path: 'category-list', component: CategoryListComponent},

      // authors
      {path: 'author-list', component: AuthorListComponent},
      {path: 'author-add', component: AuthorAddComponent},
      {path: 'author-edit/:id', component: AuthorEditComponent},
      {path: 'author-detail/:id', component: AuthorDetailComponent}
    ],
    canActivate: [AuthGuard],
  },
  {
    path: 'login',
    component: AdminLoginComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class BackendRoutingModule { }
