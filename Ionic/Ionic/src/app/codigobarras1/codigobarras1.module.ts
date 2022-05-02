import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { Codigobarras1PageRoutingModule } from './codigobarras1-routing.module';

import { Codigobarras1Page } from './codigobarras1.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    Codigobarras1PageRoutingModule
  ],
  declarations: [Codigobarras1Page]
})
export class Codigobarras1PageModule {}
