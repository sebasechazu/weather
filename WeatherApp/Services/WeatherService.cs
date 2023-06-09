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

    public async Task<WeatherData> GetWeatherData(string cityName)
    {
        string apiKey = "b43f54cd7339e23df3cf11339274bed5";
        string apiUrl = $"https://api.openweathermap.org/data/2.5/weather?q={cityName}&appid={apiKey}&units=metric";

        var weatherResponse = await _httpClient.GetFromJsonAsync<WeatherResponse>(apiUrl);

        if (weatherResponse != null)
        {
            return new WeatherData
            {
                Name = weatherResponse.Name,
                Temperature = weatherResponse.Main.Temp,
                Humidity = weatherResponse.Main.Humidity,
                Description = weatherResponse.Weather[0].Description
            };
        }

        return null;
    }
}

public class WeatherResponse
{
    public string Name { get; set; }
    public MainData Main { get; set; }
    public WeatherDescription[] Weather { get; set; }
}

public class MainData
{
    public float Temp { get; set; }
    public float Humidity { get; set; }
}

public class WeatherDescription
{
    public string Description { get; set; }
}
