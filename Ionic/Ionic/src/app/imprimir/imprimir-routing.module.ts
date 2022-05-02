import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ImprimirPage } from './imprimir.page';

const routes: Routes = [
  {
    path: '',
    component: ImprimirPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ImprimirPageRoutingModule {}
