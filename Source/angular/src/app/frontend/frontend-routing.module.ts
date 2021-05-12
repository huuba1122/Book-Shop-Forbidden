
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BookDetailsComponent } from './components/book-details/book-details.component';
import { BookListComponent } from './components/book-list/book-list.component';
import { LoginComponent } from './components/login/login.component';
import { MenuComponent } from './components/menu/menu.component';
import { HomeComponent } from './components/home/home.component';
import { AuthorDetailComponent } from './components/author-detail/author-detail.component';
import { CartListComponent } from './components/cart/cart-list/cart-list.component';
import { CheckoutComponent } from './components/cart/checkout/checkout.component';
import { CategoryListComponent } from './components/category-list/category-list.component';
import { BookNewsComponent } from './components/book-news/book-news.component';
import { BookRecommendComponent } from './components/book-recommend/book-recommend.component';
import { BookBestsellerComponent } from './components/book-bestseller/book-bestseller.component';
import { SearchBookComponent } from './components/search/search-book/search-book.component';

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
        path: 'book-detail/:id',
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
      },
      {
        path: 'customer/:id/cart-list',
        component: CartListComponent
      },
      {
        path: 'customer/:id/checkout',
        component: CheckoutComponent
      },
      
      {
        path: 'category-list/:id',
        component: CategoryListComponent
      },
      
      {
        path: 'book-news',
        component: BookNewsComponent
      },

      {
        path: 'book-recommend',
        component: BookRecommendComponent
      },

      {
        path: 'book-best-seller',
        component: BookBestsellerComponent
      },

      {
        path: 'search-book/:search',
        component: SearchBookComponent
      }
    ]
  },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class FrontendRoutingModule { }
