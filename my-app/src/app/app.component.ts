import { Component,OnInit } from '@angular/core';


import { Artist } from './artist';
import { ArtistService } from './artist.service';




@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [ArtistService]
  
})
export class AppComponent implements OnInit  {

  constructor(private artistService: ArtistService) { }
  
  ngOnInit(): void {
    this.getArtists();    
  }
  
  
  title = 'List Artist';
  
  artists : Artist[];
  selectedArtist: Artist; 
 

  getArtists(): void {
   
    this.artistService.getAtists().then(artists => this.artists = artists);
   
  }

  add(name: string): void {
    name = name.trim();
    if (!name) { return; }
    
    this.artistService.create(name)
      .then(artist => {
        this.artists.push(artist);
        this.selectedArtist = null;
      });
  }

  onSelect(artist: Artist): void {
    this.selectedArtist = artist;
  }

}

