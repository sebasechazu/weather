import { Component } from '@angular/core';
import { WeatherData } from './Models/weather.model';
import { WeatherService } from './service/weather.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  cityName: string = "";
  weatherData: WeatherData | undefined;

  constructor(private weatherService: WeatherService) { }

  getWeather() {
    this.weatherService.getWeather(this.cityName).subscribe(
      (data) => {
        this.weatherData = data;
      }, (error) => {
        console.log(error);
      }
    )
  }
}
