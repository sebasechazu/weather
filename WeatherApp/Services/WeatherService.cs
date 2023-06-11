﻿using Newtonsoft.Json;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using WeatherApp.Models;

public class WeatherService
{
    private readonly HttpClient _httpClient;

    public WeatherService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<WeatherData?> GetWeatherData(string cityName)
    {
        string apiKey = "b43f54cd7339e23df3cf11339274bed5";
        string apiUrl = "https://api.openweathermap.org/data/2.5/weather?q="+cityName+"&appid="+apiKey+"&units=metric&lang=es";

        var response = await _httpClient.GetFromJsonAsync<WeatherApiResponse>(apiUrl);

        Console.WriteLine(response);

        if (response != null)
        {
            return new WeatherData
            {
                Name = response.Name,
                Temperature = response.Main.Temperature,
                Humidity = response.Main.Humidity,
                Description = response.Weather[0].Description

            };
        }
        return null;
    }
}
// Clases auxiliares para deserializar la respuesta JSON del API de OpenWeatherMap

public class WeatherApiResponse
{
    public required string Name { get; set; }
    public required WeatherMain Main { get; set; }
    public required WeatherDescription[] Weather { get; set; }
}

public class WeatherMain
{
    public double Temperature { get; set; }
    public int Humidity { get; set; }
}

public class WeatherDescription
{
    public required string Description { get; set; }
}