class WeatherModel {
  final String name;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weathercondition;

  WeatherModel(
      {required this.name,
      required this.date,
      this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weathercondition});

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      name: json["location"]["name"],
      date: DateTime.parse(json["current"]["last_updated"]),
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weathercondition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
      image:  json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
          
    );
  }
}
