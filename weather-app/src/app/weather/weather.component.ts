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
        return 'bi-sun';
      case 'nubes':
        return 'bi-cloud';
      case 'lluvia':
        return 'bi-cloud-rain';
      case 'tormenta':
        return 'bi-cloud-lightning-rain';
      case 'nieve':
        return 'bi-snow';
      default:
        return 'bi-cloud-sun';
    }
  }
}