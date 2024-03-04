import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weatrher_cubit.dart';
import 'package:weather_app/veiws/noweatherview.dart';
import 'package:weather_app/veiws/weather_info.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //shadowColor: Colors.blue,
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'search',
                );
              },
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.black,
              ))
        ],
        title: const Text(
          'Weather🌍',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (Context, State) {
          if (State is WeatherInitialState) {
            return NoWeather();
          } else if (State is WeatherLoadedState) {
            return WeatherInfoBody(
              weathermodel: State.weatherModel,
            );
          } else {
            return Center(
                child: const Text(
              "Opps there was an error",
              style: TextStyle(fontSize: 28),
            ));
          }
        },
      ),
    );
  }
}
