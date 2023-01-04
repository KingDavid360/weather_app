import 'package:weather_app/model/weather_data_current.dart';

//instance for getting the api response
// class WeatherDataCurrent {
//   final Hourly hourly;
//   WeatherDataCurrent({required this.current});
//
//   factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
//       WeatherDataCurrent(current: Current.fromJson(json['current']));
// }

class Hourly {
  Hourly({
    this.dt,
    this.temp,
    this.weather,
  });

  int? dt;
  int? temp;
  List<Weather>? weather;

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        dt: json["dt"] == null ? null : json["dt"],
        temp: json["temp"] == null ? null : json["temp"].round(),
        weather: json["weather"] == null
            ? null
            : List<Weather>.from(
                json["weather"].map((x) => Weather.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt == null ? null : dt,
        "temp": temp == null ? null : temp,
        "weather": weather == null
            ? null
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
      };
}
