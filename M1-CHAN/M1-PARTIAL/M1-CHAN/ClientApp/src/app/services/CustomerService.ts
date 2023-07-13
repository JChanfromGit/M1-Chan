import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { CustomerInterface } from '../interfaces/CustomerInterface';

@Injectable({ providedIn: 'root' })
export class CustomerService {
  constructor(private http: HttpClient) { }

  register(user: CustomerInterface) {
    return this.http.post(`${environment.apiUrl}/user/register`, user);
  }

  login(user: CustomerInterface) {
    return this.http.post(`${environment.apiUrl}/user/login`, user);
  }
}
