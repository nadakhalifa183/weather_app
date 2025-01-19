import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBodyWidget extends StatelessWidget {
  const WeatherInfoBodyWidget({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        getPrimaryColor(weatherModel.weathercondition),
        getPrimaryColor(weatherModel.weathercondition)[300]!,
        getPrimaryColor(weatherModel.weathercondition)[50]!,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.name,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
              "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.w400)),
          const SizedBox(
            height: 36,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                "https:${weatherModel.image}",
              ),
              Text(weatherModel.temp.round().toString(),
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold)),
              Column(
                children: [
                  Text("MaxTemp : ${weatherModel.maxTemp.round()}"),
                  Text("MinTemp : ${weatherModel.minTemp.round()}")
                ],
              )
            ],
          ),
          const SizedBox(
            height: 36,
          ),
          Text(weatherModel.weathercondition,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
