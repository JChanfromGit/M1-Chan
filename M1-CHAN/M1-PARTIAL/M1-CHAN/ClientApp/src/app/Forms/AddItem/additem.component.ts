import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { ItemInterface } from '../../interfaces/ItemInterface';

@Component({
  selector: 'additem',
  templateUrl: './additem.component.html',
  styleUrls: ['./additem.component.css']
})
export class AddItemComponent implements OnInit {

  title = 'Add Item Page';

  accountForm: FormGroup;

  constructor(private router: Router, private http: HttpClient) {
    this.accountForm = new FormGroup({
      ItemCode: new FormControl('', [Validators.required, Validators.minLength(4)]),
      ItemName: new FormControl('', [Validators.required, Validators.minLength(3)]),
      ItemBrand: new FormControl('', [Validators.required, Validators.minLength(3)]),
      UnitPrice: new FormControl('', [Validators.required, Validators.minLength(3)])
    });
  }

  ngOnInit(): void {

  }

  public validateControl = (controlName: string) => {
    return this.accountForm.get(controlName)!.invalid && this.accountForm.get(controlName)!.touched;
  }

  public additemUser = (additemFormValue: any) => {
    const formValues = { ...additemFormValue };
    const item: ItemInterface = {
      ItemCode: formValues.ItemCode,
      ItemName: formValues.ItemName,
      ItemBrand: formValues.ItemBrand,
      UnitPrice: formValues.UnitPrice
    };
  };
}
