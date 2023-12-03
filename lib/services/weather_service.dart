import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'key=fa11fb74f44f48349b9180556230212';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJason(response.data);
      return weatherModel;
    } on DioException catch (e) {
      // TODO
      final String errorMes = e.response?.data['error']['message'] ??
          'oops there was an error try later';
      throw Exception(errorMes);
    } catch (e) {
      throw Exception(e);
    }
  }
}
