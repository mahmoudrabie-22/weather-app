import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_again/cubits/getWeatherCubit.dart';
import 'package:weather_again/cubits/getWeatherState.dart';
import 'package:weather_again/views/search_view.dart';
import 'package:weather_again/widgets/no_weather_body.dart';
import 'package:weather_again/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            iconSize: 26,
            padding: EdgeInsets.only(right: 15),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<Getweathercubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadedState) {
            return WeatherInfoBody(weather: state.weatherModel);
          } else if (state is WeatherFailureState) {
            return NoWeatherBody(message: state.errMessage);
          }
          return NoWeatherBody();
        },
      ),
    );
  }
}
