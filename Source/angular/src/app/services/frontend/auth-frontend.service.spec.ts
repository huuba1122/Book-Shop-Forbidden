import { TestBed } from '@angular/core/testing';

import { AuthFrontendService } from './auth-frontend.service';

describe('AuthFrontendService', () => {
  let service: AuthFrontendService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AuthFrontendService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
