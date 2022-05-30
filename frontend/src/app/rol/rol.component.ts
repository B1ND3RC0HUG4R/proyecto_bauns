import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'environments/environment';
import { Router } from '@angular/router';

declare var $:any;

@Component({
  selector: 'app-rol',
  templateUrl: './rol.component.html',
  styleUrls: ['./rol.component.css']
})
export class RolComponent implements OnInit {
  rol: any = {};

  constructor( 
    private http: HttpClient, 
    private router: Router,
    ) { }

  ngOnInit() { }

  onSubmit(){
    this.rol['activo'] = 1;
    return this.http.post<any>(environment.backEnd+'rol/', this.rol).subscribe(
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

}
