
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weatrher_cubit.dart';


class Search extends StatelessWidget {
  const Search({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City 🌍',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.only(left: 22, right: 22),
        child: TextField(
          onSubmitted: (cc) async {
            var Get = BlocProvider.of<GetWeatherCubit>(context);
            Get.GetWeather(c: cc);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            labelText: 'Search',
            suffixIcon: Icon(Icons.search),
            hintText: 'Enter City Name',
            border: OutlineInputBorder(),
          ),
        ),
      )),
    );
  }
}
