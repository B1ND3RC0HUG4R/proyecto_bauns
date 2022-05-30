import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'environments/environment';

declare var $:any;

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {
  user: any = {};
  departamento: [];
  roles: [];

  constructor( private http: HttpClient) { }

  ngOnInit() { 
    this.showDepartamento();
    this.showRol();
    console.log(this.departamento);
  }

  onSubmit(){
    this.user['activo'] = 1;
    return this.http.post<any>(environment.backEnd+'auth/register', this.user).subscribe(
      data => {
        $.notify({
          icon: "pe-7s-smile",
          message: "Rol creado correctamente"
      },{
          type: 'success',
          timer: 1000,
          placement: {
            from: 'bottom',
            align: 'right'
          }
      });
    },
    error => {
      $.notify({
        icon: "pe-7s-attention",
        message: "Error al crear rol "
      },{
        type: 'danger',
        timer: 1000,
        placement: {
            from: 'bottom',
            align: 'right'
        }
      });
    });
  }

  showDepartamento(){
    return this.http.get<any>(environment.backEnd+'departamento/').subscribe(
      data => {
          this.departamento = data;
    });
  }

  showRol(){
    return this.http.get<any>(environment.backEnd+'rol/').subscribe(
      data => {
          this.roles = data;
    });
  }

}
