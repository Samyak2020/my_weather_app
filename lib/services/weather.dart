import 'package:myweatherapp/services/location.dart';
import 'package:myweatherapp/services/networking.dart';
import 'package:myweatherapp/utilities/constants.dart';

class WeatherModel {
  LocationTask locationTask = LocationTask();

  Future<dynamic> getLocationWeather() async {
    await locationTask.getCurrentLocation();
    //this.latitude = locationTask.latitude;
    //this.longitude = locationTask.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURL?lat=${locationTask.latitude}&lon=${locationTask.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getHourlyData() async {
    await locationTask.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        oneCallUrl:
            '$oneCallURL?lat=${locationTask.latitude}&lon=${locationTask.longitude}&exclude=minutely&appid=$apiKey&units=metric');

    var hourlyData = await networkHelper.getOneCallData();
    return hourlyData;
  }

  Future<dynamic> getSearchedCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherDataForSearchedCity = await networkHelper.getData();
    return weatherDataForSearchedCity;
  }
}
