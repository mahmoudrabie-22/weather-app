class WeatherModel {
  final String city;
  final DateTime date;
  final String image;
  final double avrTemp;
  final double maxTemp;
  final double minTemp;
  final String status;

  WeatherModel({
    required this.city,
    required this.date,
    required this.image,
    required this.avrTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.status,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      city: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      avrTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      status: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
