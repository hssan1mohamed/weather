class WeatherModel {
  final String cityName;
  final String date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  const WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.weatherCondition,
      required this.minTemp});

  factory WeatherModel.fromJason(jason) {
    return WeatherModel(
      cityName: jason['location']['name'],
      date: jason['current']['last_updated'],
      image: jason['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: jason['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: jason['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weatherCondition: jason['forecast']['forecastday'][0]['day']['condition']['text'],
      minTemp: jason['forecast']['forecastday'][0]['day']['mintemp_c'],
    );
  }
}
