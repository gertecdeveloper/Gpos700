import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { Codigobarras1Page } from './codigobarras1.page';

const routes: Routes = [
  {
    path: '',
    component: Codigobarras1Page
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class Codigobarras1PageRoutingModule {}
