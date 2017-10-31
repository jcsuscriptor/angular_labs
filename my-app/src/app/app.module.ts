import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule }   from '@angular/forms'; // <-- NgModel lives here
import { HttpModule }    from '@angular/http';


import { AppComponent } from './app.component';
import { ArtistDetailComponent } from './artist-detail.component';
import { ArtistService } from './artist.service';


@NgModule({
  declarations: [
    AppComponent,
    ArtistDetailComponent
  ],
  imports: [
    BrowserModule,
    FormsModule, // <-- import the FormsModule before binding with [(ngModel)]
    HttpModule
  ],
  providers: [ArtistService],
  bootstrap: [AppComponent]
})
export class AppModule { }
