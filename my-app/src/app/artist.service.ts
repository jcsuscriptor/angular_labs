import { Injectable } from '@angular/core';
import { Headers, Http, RequestOptions } from '@angular/http';

import 'rxjs/add/operator/toPromise';


import { Artist } from './artist';
import { ARTISTS } from './mock-artist';


@Injectable()
export class ArtistService {

    private artistUrl = 'http://localhost:1337/parse/classes/Artist';  // URL to web api
     
    private headers = new Headers({'Content-Type': 'application/json','X-Parse-Application-Id': '123'});

    
    constructor(private http: Http) { }


    getArtist(id: string): Promise<Artist> {
        const url = `${this.artistUrl}/${id}`;
        let options = new RequestOptions({ headers: this.headers });

        return this.http.get(url,options)
          .toPromise()
          .then(response => response.json() as Artist)
          .catch(this.handleError);
    }


    getAtists(): Promise<Artist[]> {
       
        return this.http.get(this.artistUrl,{headers: this.headers})
            .toPromise()
            .then(response => response.json().results as Artist[])
            .catch(this.handleError);

    }

    update(artist: Artist): Promise<Artist> {
        const url = `${this.artistUrl}/${artist.objectId}`;
        
        return this.http
          .put(url, JSON.stringify({name: artist.name}), {headers: this.headers})
          .toPromise()
          .then(() => artist)
          .catch(this.handleError);
    }

    create(name: string): Promise<Artist> {
        return this.http
          .post(this.artistUrl, JSON.stringify({name: name}), {headers: this.headers})
          .toPromise()
          .then(res => this.getArtist(res.json().objectId))
          .catch(this.handleError);
    }



    private handleError(error: any): Promise<any> {
        console.error('An error occurred', error); // for demo purposes only
        return Promise.reject(error.message || error);
    }
   
}