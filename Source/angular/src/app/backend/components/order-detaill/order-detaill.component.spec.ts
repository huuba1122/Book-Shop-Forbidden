import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OrderDetaillComponent } from './order-detaill.component';

describe('OrderDetaillComponent', () => {
  let component: OrderDetaillComponent;
  let fixture: ComponentFixture<OrderDetaillComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OrderDetaillComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(OrderDetaillComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
