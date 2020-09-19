import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '5ed291d492b0928e532edb0dc9a782d3';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    var networkHelper = NetworkHelper(url: url);
    // get the weather data using the current coordinates (its a async function call), return a json decoded request body.
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    var location = Location();
    await location
        .getCurrentLocation(); // get the current location co-ordinates (its a async function call)
    //    print('Coordinates : Latitude : ${location.getLatitude} Longitude : ${location.getLongitude}');
    //    latitude = location.latitude;
    //    longitude = location.longitude; // unnecessary to have local properties of latitude and longitude
    var networkHelper = NetworkHelper(
      url:
          '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric',
    );
    // get the weather data using the current coordinates (its a async function call), return a json decoded request body.
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '️☀️';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
