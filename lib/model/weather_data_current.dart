import 'package:weather_app/model/weather_model.dart';

//instance for getting the api response
class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  Current({
    this.temp,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
  });

  int? temp;
  int? humidity;
  int? clouds;
  double? windSpeed;
  List<Weather>? weather;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temp: json["temp"] == null ? null : json["temp"].round(),
        humidity: json["humidity"] == null ? null : json["humidity"],
        clouds: json["clouds"] == null ? null : json["clouds"],
        windSpeed:
            json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        weather: json["weather"] == null
            ? null
            : List<Weather>.from(
                json["weather"].map((x) => Weather.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp == null ? null : temp,
        "humidity": humidity == null ? null : humidity,
        "clouds": clouds == null ? null : clouds,
        "wind_speed": windSpeed == null ? null : windSpeed,
        "weather": weather == null
            ? null
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
      };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int? id;
  String? main;
  String? description;
  String? icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] == null ? null : json["id"],
        main: json["main"] == null ? null : json["main"],
        description: json["description"] == null ? null : json["description"],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "main": main == null ? null : mainValues.reverse[main],
        "description":
            description == null ? null : descriptionValues.reverse[description],
        "icon": icon == null ? null : iconValues.reverse[icon],
      };
}
