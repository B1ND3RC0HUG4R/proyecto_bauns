import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { LbdModule } from '../../lbd/lbd.module';
import { NguiMapModule} from '@ngui/map';

import { AdminLayoutRoutes } from './admin-layout.routing';

import { HomeComponent } from '../../home/home.component';
import { NewComponent } from '../../new/new.component';
import { RolComponent } from '../../rol/rol.component';
import { TablesComponent } from '../../tables/tables.component';
import { LoginComponent } from '../../auth/login/login.component';
import { UserComponent } from 'app/user/user.component';


@NgModule({
  imports: [
    CommonModule,
    RouterModule.forChild(AdminLayoutRoutes),
    FormsModule,
    LbdModule,
    NguiMapModule.forRoot({apiUrl: 'https://maps.google.com/maps/api/js?key=YOUR_KEY_HERE'})
  ],
  declarations: [
    HomeComponent,
    NewComponent,
    RolComponent,
    TablesComponent,
    UserComponent,
    LoginComponent
  ]
})

export class AdminLayoutModule {}
