import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';


const appKey = 'daafac90d57f1df9c42924d4a865d156';

class WeatherModel {
  double latitude;
  double longitude;

  Future<dynamic> getCityData(String cityName) async {

    NetworkHelper networkHelper = NetworkHelper(
        url:
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$appKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        url:
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$appKey&units=metric');
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
      return '🌫';
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
