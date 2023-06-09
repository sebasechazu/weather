import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';
@Injectable({
  providedIn: 'root',
})
export class WeatherService {

  constructor(private http: HttpClient) { }

  getWeather(cityName: string): Observable<any> {

    const apiKey = 'b43f54cd7339e23df3cf11339274bed5';
    const apiUrl = `https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${apiKey}&units=metric`;

    return this.http.get(apiUrl).pipe(
      map((response: any) => {
        return {
          cityName: response.name,
          temperature: response.main.temp,
          humidity: response.main.humidity,
          description: response.weather[0].description,
        };
      }),
    );
  }
}
