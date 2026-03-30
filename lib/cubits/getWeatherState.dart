import 'package:weather_again/model/weather_model.dart';

class WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  final String errMessage;
  WeatherFailureState({required this.errMessage});
}

class NoWeatherState extends WeatherState {}
