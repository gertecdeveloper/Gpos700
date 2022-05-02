import { Component, OnInit } from '@angular/core';
import { Camera, CameraOptions } from '@ionic-native/camera/ngx';
import { Observable } from 'rxjs';
declare var cordova;

@Component({
  selector: 'app-codigobarras1',
  templateUrl: './codigobarras1.page.html',
  styleUrls: ['./codigobarras1.page.scss'],
})
export class Codigobarras1Page implements OnInit {
  gpos700: any;
  resultadosBarCod: any;
  items = [];

  constructor() { 
    this.gpos700 = cordova.plugins.gpos7centos;
  }

  ngOnInit() {
  }

  EAN_8() {
    this.gpos700.leitorCodigo1({barCode: "EAN_8"}, (res) => {
      this.items.push(res);
    }, (er) => 
    {
      this.items.push(er);
    });
  }

  EAN_13() {
    this.gpos700.leitorCodigo1({barCode: "EAN_13"}, (res) => {
      this.items.push(res);
    }, (er) => 
    {
      this.items.push(er);
    });
  }

  EAN_14(){
    this.gpos700.leitorCodigo1({barCode: "EAN_14"}, (res) => {
      this.items.push(res);
    }, (er) => 
    {
      this.items.push(er);
    });
  }

  QR_CODE(){
    this.gpos700.leitorCodigo1({barCode: "QR_CODE"}, (res) => {
      this.items.push(res);
    }, (er) => 
    {
      this.items.push(er);
    });
  }
}
