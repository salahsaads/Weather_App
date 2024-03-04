

class WeatherModel {
  final String cityname;
  final String date;
  final String? image;
  final double temp;
  final double maxTemp;
  
  final double minTemp;
  final String condition;

  WeatherModel(
      {required this.cityname,
      required this.date,
      this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.condition});
  factory WeatherModel.formjson(json) {
    return WeatherModel(
        image: json["forecast"]["forecastday"][0]['day']['condition']["icon"],
        cityname: json["location"]['name'],
        date: json['current']["last_updated"],
        temp: json["forecast"]["forecastday"][0]["day"]['avgtemp_c'],
        maxTemp: json["forecast"]["forecastday"][0]["day"]['maxtemp_c'],
        minTemp: json["forecast"]["forecastday"][0]["day"]['mintemp_c'],
        condition: json["forecast"]["forecastday"][0]['day']['condition']
            ["text"]);
  }
}
