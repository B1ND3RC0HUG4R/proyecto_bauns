import { Routes } from '@angular/router';

import { HomeComponent } from '../../home/home.component';
import { NewComponent } from '../../new/new.component';
import { TablesComponent } from '../../tables/tables.component';
import { RolComponent } from '../../rol/rol.component';
import { UserComponent } from 'app/user/user.component';

export const AdminLayoutRoutes: Routes = [
    { path: 'dashboard',        component: HomeComponent },
    { path: 'news',             component: NewComponent },
    { path: 'table',            component: TablesComponent },
    { path: 'rol',              component: RolComponent },
    { path: 'user',             component: UserComponent }
];
