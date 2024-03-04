import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/weather_service/service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() :super(WeatherInitialState());

  GetWeather({required String c}) async {
    try {
      WeatherModel weathermodel =
          await WeatherService(dio: Dio()).get_weather(CityName: c);

      emit(WeatherLoadedState(weatherModel: weathermodel));
    } catch (e) {
      emit(WeatherFailureState()); //معنها يبعت
    }

  }
}
