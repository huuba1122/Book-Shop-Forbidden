
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BookDetailsComponent } from './components/book-details/book-details.component';
import { BookListComponent } from './components/book-list/book-list.component';
import { LoginComponent } from './components/login/login.component';
import { MenuComponent } from './components/menu/menu.component';
import { HomeComponent } from './components/home/home.component';
import { AuthorDetailComponent } from './components/author-detail/author-detail.component';

const routes: Routes = [
  {
    path: '',
    component: MenuComponent,
    children: [
      {
        path: '',
        component: HomeComponent
      },
      {
        path: 'bookdetails',
        component: BookDetailsComponent
      },
      {
        path: 'login',
        component: LoginComponent
      },
      {
        path: 'book-list',
        component: BookListComponent
      },
      {
        path: 'author-detail/:id',
        component: AuthorDetailComponent
      }



    ]
  },


];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class FrontendRoutingModule { }
