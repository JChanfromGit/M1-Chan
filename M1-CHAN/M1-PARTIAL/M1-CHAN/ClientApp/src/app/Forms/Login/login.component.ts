import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { CustomerInterface } from '../../interfaces/CustomerInterface';

@Component({
  selector: 'login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  title = 'CUSTOMER LOGIN';

  accountForm: FormGroup;

  constructor(private router: Router, private http: HttpClient) {
    this.accountForm = new FormGroup({
      UserName: new FormControl('', [Validators.required, Validators.minLength(4)]),
      Password: new FormControl('', [Validators.required, Validators.pattern(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*#?&^_-]).{8,}/)])
    });
  }

  ngOnInit(): void {

  }

  public validateControl = (controlName: string) => {
    return this.accountForm.get(controlName)!.invalid && this.accountForm.get(controlName)!.touched;
  }

  public loginUser = (loginFormValue: any) => {
    const formValues = { ...loginFormValue };
    const customer: CustomerInterface = {
      UserName: formValues.UserName,
      Password: formValues.Password
    };
  };
}
