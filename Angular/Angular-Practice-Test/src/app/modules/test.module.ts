import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { WarningComponent } from '../../components/warning/warning.component';
import { SuccessComponent } from '../../components/success/success.component';
import { DangerComponent } from '../../components/danger/danger.component';

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
