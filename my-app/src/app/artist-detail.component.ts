import { Component, Input  } from '@angular/core';
import { Location }                 from '@angular/common';

import { Artist } from './artist';
import { ArtistService } from './artist.service';



@Component({
    selector: 'artist-detail',
    template: `
    <div *ngIf="artist">
        <h2>{{artist.name}} details!</h2>
        <div><label>objectId: </label>{{artist.objectId}}</div>
        <div>
            <label>name: </label>
            <input [(ngModel)]="artist.name" placeholder="name"/>
        </div>
    </div>

    <button (click)="save()">Save</button>
    
  `
})
export class ArtistDetailComponent {

    @Input() artist: Artist;

    constructor(private artistService: ArtistService) { }

    save(): void {
        this.artistService.update(this.artist)
          .then(() => this.goBack());
    }

    goBack(): void {
        //this.location.back();
    }
    
}

