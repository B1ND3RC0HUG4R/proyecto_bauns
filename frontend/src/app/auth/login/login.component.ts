import {Component, OnInit} from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from '../auth.service';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.css']
})

export class LoginComponent implements OnInit {

    form: any = {};

    redirectUrl: any = '';


    constructor(
        private auth:AuthService,
        private router:Router,
        private route: ActivatedRoute,
    ) {}

    onSubmit(){
        this.auth.login(this.form.email, this.form.password)
        .subscribe(
            data => {
                this.router.navigate([this.redirectUrl]);
            },
            error => {
                error(error);
        });
    }

    ngOnInit(): void {
        this.redirectUrl = this.route.snapshot.queryParams['redirectUrl'] || '/';
    }

    redirect(){
        this.router.navigate(['/page'])
      }
}