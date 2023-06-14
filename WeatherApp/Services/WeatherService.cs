using System.Net.Http.Json;
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
        string apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=" + cityName + "&appid=" + apiKey + "&units=metric&lang=es";

        var response = await _httpClient.GetFromJsonAsync<WeatherApiResponse>(apiUrl);

        Console.WriteLine(response);

        if (response != null)
        {
            return new WeatherData
            {
                Name = response.Name,
                Temperature = response.Main.temp,
                TempMax = response.Main.temp_max,
                Humidity = response.Main.Humidity,
                Description = response.Weather[0].Description,
                WindSpeed = response.Wind.Speed,

            };

        }
        return null;
    }
}
// clase auxiliar
public class WeatherApiResponse
{
    public required string Name { get; set; }
    public required WeatherMain Main { get; set; }
    public required WeatherWind Wind { get; set; }
    public required WeatherDescription[] Weather { get; set; }
}

public class WeatherMain
{
    public decimal temp { get; set; }
    public decimal Humidity { get; set; }
    public decimal temp_max { get; set; }
}

public class WeatherDescription
{
    public required string Description { get; set; }
}
public class WeatherWind
{
    public decimal Speed { get; set; }
}
