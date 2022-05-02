import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { Codigobarras1Page } from './codigobarras1.page';

describe('Codigobarras1Page', () => {
  let component: Codigobarras1Page;
  let fixture: ComponentFixture<Codigobarras1Page>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Codigobarras1Page ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(Codigobarras1Page);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
