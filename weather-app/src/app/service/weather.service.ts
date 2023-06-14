import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';
import { environment } from '../config';
@Injectable({
  providedIn: 'root',
})
export class WeatherService {

  constructor(private http: HttpClient) { }

  getWeather(cityName: string): Observable<any> {

    const apiKey = environment.apiKey;
    const apiUrl = `https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${apiKey}&units=metric&lang=es`;

    return this.http.get(apiUrl).pipe(
      map((response: any) => {
        return {
          name: response.name,
          temperature: response.main.temp,
          humidity: response.main.humidity,
          description: response.weather[0].description,
        };
      }),
    );
  }
}
