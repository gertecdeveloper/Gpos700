import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  { path: '', redirectTo: 'home', pathMatch: 'full' },
  { path: 'home', loadChildren: () => import('./home/home.module').then( m => m.HomePageModule)},
  {
    path: 'codigobarras1',
    loadChildren: () => import('./codigobarras1/codigobarras1.module').then( m => m.Codigobarras1PageModule)
  },
  {
    path: 'imprimir',
    loadChildren: () => import('./imprimir/imprimir.module').then( m => m.ImprimirPageModule)
  },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
