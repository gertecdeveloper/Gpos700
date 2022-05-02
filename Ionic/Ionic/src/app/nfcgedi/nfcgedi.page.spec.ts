import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { NFCGediPage } from './nfcgedi.page';

describe('NFCGediPage', () => {
  let component: NFCGediPage;
  let fixture: ComponentFixture<NFCGediPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NFCGediPage ],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(NFCGediPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
