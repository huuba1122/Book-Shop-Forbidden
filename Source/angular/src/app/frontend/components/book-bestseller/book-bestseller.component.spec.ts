import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BookBestsellerComponent } from './book-bestseller.component';

describe('BookBestsellerComponent', () => {
  let component: BookBestsellerComponent;
  let fixture: ComponentFixture<BookBestsellerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BookBestsellerComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BookBestsellerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
