import { Component, OnInit ,Input} from '@angular/core';
import { WeatherData } from '../Models/weather.model';

@Component({
  selector: 'app-weather',
  templateUrl: './weather.component.html',
  styleUrls: ['./weather.component.css'],
})
export class WeatherComponent  {
    
  @Input() weatherData: WeatherData | undefined;
 
}