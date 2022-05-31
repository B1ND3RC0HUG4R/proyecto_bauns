import { Component, OnInit } from '@angular/core';
import { New, Dpto } from '../_models/index';
import { HttpClient } from '@angular/common/http';
import { environment } from 'environments/environment';

declare interface TableData {
    headerRow: string[];
    dataRows: New[];
}

@Component({
  selector: 'app-tables',
  templateUrl: './tables.component.html',
  styleUrls: ['./tables.component.css']
})
export class TablesComponent implements OnInit {
    news: New[];
    public tableData1: TableData;

    constructor( private http: HttpClient ) { }

    ngOnInit() {
        this.loadNews();
    }

    updateNew(id: number, valor: number){
        return this.http.put<any>(environment.backEnd+'new/'+ id, {activo: valor}).subscribe(
            () => {
                this.loadNews();
            });
    }

    loadNews(){
        return this.http.get<any>(environment.backEnd+'new/').subscribe(
            data => {
                this.news = data;
                this.tableData1 = {
                    headerRow: [ 'Título', 'Nombre Imagen', 'Descripción', 'Publicar'],
                    dataRows: data
                };
            }
        );
    }

    isActivo(valor){
        if(valor==1){
            return true;
        }else{
            return false;
        }
    }
}
