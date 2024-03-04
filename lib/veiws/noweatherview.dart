import 'package:flutter/material.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'there is no weather 😔 start \n         searching now 🔍',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    ));
  }
}
