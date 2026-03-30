import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_again/cubits/getWeatherState.dart';
import 'package:weather_again/model/weather_model.dart';
import 'package:weather_again/service/weather_service.dart';

class Getweathercubit extends Cubit<WeatherState> {
  Getweathercubit() : super(NoWeatherState());
  WeatherModel? weather;
  Future<void> getWeather({required String cityName}) async {
    try {
      weather = await WeatherService().getWeather(city: cityName);
      emit(WeatherLoadedState(weatherModel: weather!));
    } catch (e) {
      WeatherFailureState(errMessage: e.toString());
    }
  }
}
