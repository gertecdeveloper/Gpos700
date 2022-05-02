import { Component } from '@angular/core';
import { Camera, CameraOptions } from '@ionic-native/camera/ngx';
import { Router } from '@angular/router';
declare var cordova;

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  temperatura: any;
  gpos700: any;
  window: any;
  orientation_locked: true;

  constructor(
      private camera: Camera,
      private router: Router
  ) 
  {
      this.gpos700 = cordova.plugins.gpos7centos;
  }

  codigobarras1() {
    this.router.navigate(['codigobarras1']);
  }

  codbarrasv2() {
    this.gpos700.leitorCodigoV2();
  }
  
  impressao() {
    this.router.navigate(['imprimir']);
  }

  nfcGedi() {
    this.gpos700.leitorNfcGedi();
  }

  nfcId() {
    this.gpos700.leitorNfcId();
  }
}
