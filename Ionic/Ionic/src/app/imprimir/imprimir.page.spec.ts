import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { ImprimirPage } from './imprimir.page';

describe('ImprimirPage', () => {
  let component: ImprimirPage;
  let fixture: ComponentFixture<ImprimirPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ImprimirPage ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(ImprimirPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
