import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BookDetailsComponent } from './frontend/book-details/book-details.component';
import { HomeComponent } from './frontend/home/home.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    BookDetailsComponent
    
    
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
