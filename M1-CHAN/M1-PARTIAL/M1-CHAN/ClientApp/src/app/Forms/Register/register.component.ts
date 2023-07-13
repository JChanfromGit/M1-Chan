import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { CustomerInterface } from '../../interfaces/CustomerInterface';

@Component({
  selector: 'register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  title = 'Registration [CUSTOMER]';

  accountForm: FormGroup;

  constructor(private router: Router, private http: HttpClient) {
    this.accountForm = new FormGroup({
      UserName: new FormControl('', [Validators.required, Validators.minLength(4)]),
      FirstName: new FormControl('', [Validators.required, Validators.minLength(3)]),
      LastName: new FormControl('', [Validators.required, Validators.minLength(3)]),
      Nickname: new FormControl('', [Validators.required, Validators.minLength(3)]),
      EmailAddress: new FormControl('', [Validators.required, Validators.email]),
      Password: new FormControl('', [Validators.required, Validators.pattern(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*#?&^_-]).{8,}/)])
    });
  }

  ngOnInit(): void {

  }

  public validateControl = (controlName: string) => {
    return this.accountForm.get(controlName)!.invalid && this.accountForm.get(controlName)!.touched;
  }

  public registerUser = (registerFormValue: any) => {
    const formValues = { ...registerFormValue };
    const customer: CustomerInterface = {
      Id: 0,
      UserName: formValues.UserName,
      FirstName: formValues.FirstName,
      LastName: formValues.LastName,
      Nickname: formValues.Nickname,
      EmailAddress: formValues.EmailAddress,
      Password: formValues.Password
    };
  };
}
