import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

declare const $: any;
declare interface RouteInfo {
    path: string;
    title: string;
    icon: string;
    class: string;
}

export const ROUTES: RouteInfo[] = [
    { path: '/news', title: 'Noticias',  icon:'pe-7s-news-paper', class: '' },
    { path: '/table', title: 'Ver Noticias',  icon:'pe-7s-note2', class: '' },
    { path: '/rol', title: 'Roles',  icon:'pe-7s-user', class: '' },
    { path: '/user', title: 'Usuarios',  icon:'pe-7s-albums', class: '' },
];
export const ROUTESUSERS: RouteInfo[] = [
  { path: '/news', title: 'Noticias',  icon:'pe-7s-news-paper', class: '' },
];

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html'
})
export class SidebarComponent implements OnInit {

  menuItems: any[];

  constructor( private router: Router ) { }

  ngOnInit() {
    if(localStorage.getItem('rol_id') == '1'){
      this.menuItems = ROUTES.filter(menuItem => menuItem);
    }else{
      this.menuItems = ROUTESUSERS.filter(menuItem => menuItem);
    }
  }
  isMobileMenu() {
      if ($(window).width() > 991) {
          return false;
      }
      return true;
  };
  getName(){
    if(localStorage.getItem('name') != null || localStorage.getItem('name') != ""){
      let nombre= localStorage.getItem('name'); 
      return nombre;
    }
    return 'N/A';
  }
  logout(){
    localStorage.clear();
    this.router.navigate(['/login']);
}
}
