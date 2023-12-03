import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: getColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition)),
              home: HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getColor(String? weatherCondition) {
  switch (weatherCondition) {
    case null:
      return Colors.blue;
    case 'sunny':
      return Colors.amber;
    case 'partly cloudy':
      return Colors.grey;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.grey;
    case 'mist':
      return Colors.grey;
    case 'patchy rain':
      return Colors.blueGrey;
    case 'moderate or heavy rain':
      return Colors.blueGrey;
    // Add more cases for other weather conditions and their corresponding colors
    default:
      return Colors.blue;
  }
}
