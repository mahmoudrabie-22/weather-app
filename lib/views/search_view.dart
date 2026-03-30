import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_again/cubits/getWeatherCubit.dart';
import 'package:weather_again/cubits/getWeatherState.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
            onSubmitted: (value) => {
              BlocProvider.of<Getweathercubit>(
                context,
              ).getWeather(cityName: value),
              Navigator.pop(context),
            },
            decoration: InputDecoration(
              labelText: "Search",
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              border: OutlineInputBorder(),
              hintText: "Enter a city ",
            ),
          ),
        ),
      ),
    );
  }
}
