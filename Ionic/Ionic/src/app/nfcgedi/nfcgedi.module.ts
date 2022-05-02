import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { NFCGediPageRoutingModule } from './nfcgedi-routing.module';

import { NFCGediPage } from './nfcgedi.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    NFCGediPageRoutingModule
  ],
  declarations: [NFCGediPage]
})
export class NFCGediPageModule {}
