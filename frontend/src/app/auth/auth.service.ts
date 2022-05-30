import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { environment } from 'environments/environment';

@Injectable({
    providedIn: 'root'
})

export class AuthService{

    constructor(
        private http: HttpClient,
    ) { }

    login(email: string, password: string){
        return this.http.post<any>(environment.backEnd+'auth/login', { email: email, password: password }).pipe(
                map(user => {
                    if (user && user.access_token) {
                        localStorage.setItem('logginIn', JSON.stringify(user));
                        localStorage.setItem('rol_id', user.user.original.rol_id);
                        localStorage.setItem('name', user.user.original.name);
                        localStorage.setItem('id_user', user.user.original.id);
                    }
                    return user;
                })
            );
    }

    isLoggedIn(): boolean {
        return !!localStorage.getItem('logginIn');
    }
}