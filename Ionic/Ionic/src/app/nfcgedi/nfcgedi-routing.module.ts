import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { NFCGediPage } from './nfcgedi.page';

const routes: Routes = [
  {
    path: '',
    component: NFCGediPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class NFCGediPageRoutingModule {}
