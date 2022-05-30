import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'environments/environment';
import { DomSanitizer } from '@angular/platform-browser';

declare var $:any;

@Component({
  selector: 'app-new',
  templateUrl: './new.component.html',
  styleUrls: ['./new.component.css']
})
export class NewComponent implements OnInit {
  news: any = {};
  departamento: [];
  previsualizacion: string;
  archivos: any = []
  loading: boolean

  constructor( private http: HttpClient, private sanitizer: DomSanitizer) { }

  ngOnInit() { 
    this.showDepartamento();
  }
  
  showDepartamento(){
    return this.http.get<any>(environment.backEnd+'departamento/').subscribe(
      data => {
          this.departamento = data;
    });
  }

  capturarFile(event): any {
    const archivoCapturado = event.target.files[0]
    this.extraerBase64(archivoCapturado).then((imagen: any) => {
      this.previsualizacion = imagen.base;
    })
    this.archivos.push(archivoCapturado)

  }

  extraerBase64 = async ($event: any) => new Promise((resolve, reject) => {
    try {
      const unsafeImg = window.URL.createObjectURL($event);
      const image = this.sanitizer.bypassSecurityTrustUrl(unsafeImg);
      const reader = new FileReader();
      reader.readAsDataURL($event);
      reader.onload = () => {
        resolve({
          base: reader.result
        });
      };
      reader.onerror = error => {
        resolve({
          base: null
        });
      };

    } catch (e) {
      return null;
    }
  })

  onSubmit(){
    this.loading = true;
    const formulario = new FormData();
    this.archivos.forEach(archivo => {
      formulario.append('src', archivo)
    })
    formulario.append('titulo', this.news.titulo)
    formulario.append('descripcion', this.news.descripcion)
    formulario.append('departamento_id', this.news.departamento_id)
    formulario.append('user_id', localStorage.getItem('id_user'))
    formulario.append('activo', '0')
    this.http.post<any>(environment.backEnd+'new/', formulario)
      .subscribe(
        data => {
          this.loading = false;
          $.notify({
            icon: "pe-7s-smile",
            message: "Noticia creada correctamente"
        },{
            type: 'success',
            timer: 1000,
            placement: {
              from: 'bottom',
              align: 'right'
            }
        });
        console.log(data);
      },
      error => {
        this.loading = false;
        $.notify({
          icon: "pe-7s-attention",
          message: "Error al crear Noticia"
        },{
          type: 'danger',
          timer: 1000,
          placement: {
              from: 'bottom',
              align: 'right'
          }
        });
        console.log(error);
      });
  }
}
