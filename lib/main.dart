import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weatrher_cubit.dart';
import 'package:weather_app/veiws/home.dart';
import 'package:weather_app/veiws/noweatherview.dart';
import 'package:weather_app/veiws/searchView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GetWeatherCubit(); // علشان نوفر cubite
      },
      child: Builder(
        builder: (context) => MaterialApp(
          //theme: ThemeData.dark(),
          routes: {
            '/': (context) => Home(),
            'search': (context) => Search(),
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String weatherStateName) {
  //  var weatherStateName;
  if (weatherStateName == 'Sunny' ||
      weatherStateName == 'Clear' ||
      weatherStateName == 'partly cloudy') {
    return Colors.orange;
  } else if (weatherStateName == 'Blizzard' ||
      weatherStateName == 'Patchy snow possible' ||
      weatherStateName == 'Patchy sleet possible' ||
      weatherStateName == 'Patchy freezing drizzle possible' ||
      weatherStateName == 'Blowing snow') {
    return Colors.blue;
  } else if (weatherStateName == 'Freezing fog' ||
      weatherStateName == 'Fog' ||
      weatherStateName == 'Heavy Cloud' ||
      weatherStateName == 'Mist' ||
      weatherStateName == 'Fog') {
    return Colors.blueGrey;
  } else if (weatherStateName == 'Patchy rain possible' ||
      weatherStateName == 'Heavy Rain' ||
      weatherStateName == 'Showers	') {
    return Colors.blue;
  } else if (weatherStateName == 'Thundery outbreaks possible' ||
      weatherStateName == 'Moderate or heavy snow with thunder' ||
      weatherStateName == 'Patchy light snow with thunder' ||
      weatherStateName == 'Moderate or heavy rain with thunder' ||
      weatherStateName == 'Patchy light rain with thunder') {
    return Colors.deepPurple;
  } else {
    return Colors.orange;
  }
}
