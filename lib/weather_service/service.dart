import 'dart:math';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '2ce71c4b49ab47b5a2a120806242702';
  WeatherService({required this.dio});

  Future<WeatherModel> get_weather({required String CityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$CityName&days=1');

      WeatherModel weatherModel = WeatherModel.formjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String res = e.response?.data['error']['message'] ?? "Oops";
      throw Exception(res);
    }
  }
}
