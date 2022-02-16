import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { SuccessComponent } from './success.component';
import { WarningComponent } from './warning.component';
import { DangerComponent } from './danger.component';
import { AppComponent } from '../app.component';

@NgModule({
  declarations: [
    SuccessComponent,
    WarningComponent,
    DangerComponent
  ],
  imports: [
    BrowserModule
  ],
  exports: [
    SuccessComponent,
    WarningComponent,
    DangerComponent
  ]
})

export class TestModule { }
