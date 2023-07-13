import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';


@Injectable({ providedIn: 'root' })
export class ItemService {

  constructor(private http: HttpClient) { }

  getById(itemId: number) {
    return this.http.get(`${environment.apiUrl}/item/${itemId}`);
  }

  add() {
    return this.http.get(`${environment.apiUrl}/item/add`);
  }
}
