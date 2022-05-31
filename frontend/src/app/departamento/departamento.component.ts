import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'environments/environment';

declare var $:any;

@Component({
  selector: 'app-departamento',
  templateUrl: './departamento.component.html',
  styleUrls: ['./departamento.component.css']
})
export class DepartamentoComponent implements OnInit {
  departamento: any = {};

  constructor( private http: HttpClient ) { }

  ngOnInit(): void {
  }

  onSubmit(){
    this.departamento['activo'] = 1;
    return this.http.post<any>(environment.backEnd+'departamento/', this.departamento).subscribe(
      data => {
        $.notify({
          icon: "pe-7s-smile",
          message: "Departamento creado correctamente"
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
        message: "Error al crear Departamento "
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
