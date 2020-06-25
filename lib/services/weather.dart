import 'package:myweatherapp/services/location.dart';
import 'package:myweatherapp/services/networking.dart';
import 'package:myweatherapp/utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    LocationTask locationTask = LocationTask();

    await locationTask.getCurrentLocation();
    //this.latitude = locationTask.latitude;
    //this.longitude = locationTask.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${locationTask.latitude}&lon=${locationTask.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getSearchedCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherDataForSearchedCity = await networkHelper.getData();
    return weatherDataForSearchedCity;
  }
}
