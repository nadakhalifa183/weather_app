// import 'package:weather_app/models/weather_model.dart';

import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel; // Add this line

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {}
