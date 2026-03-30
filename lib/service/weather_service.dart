import 'package:dio/dio.dart';
import 'package:weather_again/model/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseURL = "http://api.weatherapi.com/v1";
  final String apiKey = 'bb9d878866554eb2a3d104109261003';
  Future<WeatherModel> getWeather({required String city}) async {
    try {
      Response response = await dio.get(
        "$baseURL/forecast.json?key=$apiKey&q=$city&days=1",
      );
      WeatherModel data = WeatherModel.fromJson(response.data);
      return data;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? "error";
      throw Exception(errorMessage);
    }
  }
}
