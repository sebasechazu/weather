import { Component, OnInit, Input } from '@angular/core';
import { WeatherData } from '../Models/weather.model';

@Component({
  selector: 'app-weather',
  templateUrl: './weather.component.html',
  styleUrls: ['./weather.component.css'],
})
export class WeatherComponent {

  @Input() weatherData: WeatherData | undefined;
  getWeatherIconClass(description: string): string {

    switch (description.toLowerCase()) {
      case 'cielo claro':
        return 'wi-day-sunny';
      case 'pocas nubes':
        return 'wi-cloud';
      case 'nubes':
        return 'wi-cloudy';
      case 'lluvia':
        return 'wi-rain';
      default:
        return 'wi-meteor';
    }
  }
}