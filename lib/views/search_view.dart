
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City", style: TextStyle(fontSize: 22)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
           
            onSubmitted: (value) async {
              final getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                hintText: "Enter city name",
                hintStyle: TextStyle(fontWeight: FontWeight.w300),
                labelText: "Search",
                // suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}
