﻿namespace WeatherApp.Models
{
    public class WeatherData
    {
        public string? Name { get; set; }
        public decimal Temperature { get; set; }
        public decimal Humidity { get; set; }
        public string? Description { get; set; }
        public decimal WindSpeed { get; set; }
        public decimal Rain { get; set; }
    }
}
