import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:weather_app/api/api_key_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class FetchWeatherApi  extends GetxController{
   WeatherModel ?weatherData;

  //processing the data from response to json
  Future<WeatherModel> processData(lat, long) async {
    var response = await http.get(Uri.parse(apiUrl(lat, long)));
    if (response.statusCode == 200) {
      log(response.body);
      var jsonString = jsonDecode(response.body);
      weatherData = WeatherModel.fromJson(jsonString);
    } else {
      throw Exception(response.body);
    }
    return weatherData!;
  }
}

String apiUrl(var lat, var long) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$long&appid=$apiKey&units=metric&exclude=minutely";

  return url;
}
