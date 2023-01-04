// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.hourly,
    this.daily,
  });

  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Current>? hourly;
  List<Daily>? daily;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lon: json["lon"] == null ? null : json["lon"].toDouble(),
        timezone: json["timezone"] == null ? null : json["timezone"],
        timezoneOffset:
            json["timezone_offset"] == null ? null : json["timezone_offset"],
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
        hourly: json["hourly"] == null
            ? null
            : List<Current>.from(
                json["hourly"].map((x) => Current.fromJson(x))),
        daily: json["daily"] == null
            ? null
            : List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lon": lon == null ? null : lon,
        "timezone": timezone == null ? null : timezone,
        "timezone_offset": timezoneOffset == null ? null : timezoneOffset,
        "current": current == null ? null : current!.toJson(),
        "hourly": hourly == null
            ? null
            : List<dynamic>.from(hourly!.map((x) => x.toJson())),
        "daily": daily == null
            ? null
            : List<dynamic>.from(daily!.map((x) => x.toJson())),
      };
}

class Current {
  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.pop,
  });

  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  int? pop;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"] == null ? null : json["dt"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
        temp: json["temp"] == null ? null : json["temp"].toDouble(),
        feelsLike:
            json["feels_like"] == null ? null : json["feels_like"].toDouble(),
        pressure: json["pressure"] == null ? null : json["pressure"],
        humidity: json["humidity"] == null ? null : json["humidity"],
        dewPoint:
            json["dew_point"] == null ? null : json["dew_point"].toDouble(),
        uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
        clouds: json["clouds"] == null ? null : json["clouds"],
        visibility: json["visibility"] == null ? null : json["visibility"],
        windSpeed:
            json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"] == null ? null : json["wind_deg"],
        windGust:
            json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
        weather: json["weather"] == null
            ? null
            : List<Weather>.from(
                json["weather"].map((x) => Weather.fromJson(x))),
        pop: json["pop"] == null ? null : json["pop"],
      );

  Map<String, dynamic> toJson() => {
        "dt": dt == null ? null : dt,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
        "temp": temp == null ? null : temp,
        "feels_like": feelsLike == null ? null : feelsLike,
        "pressure": pressure == null ? null : pressure,
        "humidity": humidity == null ? null : humidity,
        "dew_point": dewPoint == null ? null : dewPoint,
        "uvi": uvi == null ? null : uvi,
        "clouds": clouds == null ? null : clouds,
        "visibility": visibility == null ? null : visibility,
        "wind_speed": windSpeed == null ? null : windSpeed,
        "wind_deg": windDeg == null ? null : windDeg,
        "wind_gust": windGust == null ? null : windGust,
        "weather": weather == null
            ? null
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "pop": pop == null ? null : pop,
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
  Main? main;
  Description? description;
  Icon? icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] == null ? null : json["id"],
        main: json["main"] == null ? null : mainValues.map[json["main"]],
        description: json["description"] == null
            ? null
            : descriptionValues.map[json["description"]],
        icon: json["icon"] == null ? null : iconValues.map[json["icon"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "main": main == null ? null : mainValues.reverse[main],
        "description":
            description == null ? null : descriptionValues.reverse[description],
        "icon": icon == null ? null : iconValues.reverse[icon],
      };
}

enum Description { SCATTERED_CLOUDS, CLEAR_SKY, FEW_CLOUDS }

final descriptionValues = EnumValues({
  "clear sky": Description.CLEAR_SKY,
  "few clouds": Description.FEW_CLOUDS,
  "scattered clouds": Description.SCATTERED_CLOUDS
});

enum Icon { THE_03_D, THE_01_D, THE_02_D, THE_02_N, THE_01_N, THE_03_N }

final iconValues = EnumValues({
  "01d": Icon.THE_01_D,
  "01n": Icon.THE_01_N,
  "02d": Icon.THE_02_D,
  "02n": Icon.THE_02_N,
  "03d": Icon.THE_03_D,
  "03n": Icon.THE_03_N
});

enum Main { CLOUDS, CLEAR }

final mainValues = EnumValues({"Clear": Main.CLEAR, "Clouds": Main.CLOUDS});

class Daily {
  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.uvi,
  });

  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  int? clouds;
  int? pop;
  double? uvi;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"] == null ? null : json["dt"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
        moonrise: json["moonrise"] == null ? null : json["moonrise"],
        moonset: json["moonset"] == null ? null : json["moonset"],
        moonPhase:
            json["moon_phase"] == null ? null : json["moon_phase"].toDouble(),
        temp: json["temp"] == null ? null : Temp.fromJson(json["temp"]),
        feelsLike: json["feels_like"] == null
            ? null
            : FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"] == null ? null : json["pressure"],
        humidity: json["humidity"] == null ? null : json["humidity"],
        dewPoint:
            json["dew_point"] == null ? null : json["dew_point"].toDouble(),
        windSpeed:
            json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"] == null ? null : json["wind_deg"],
        windGust:
            json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
        weather: json["weather"] == null
            ? null
            : List<Weather>.from(
                json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"] == null ? null : json["clouds"],
        pop: json["pop"] == null ? null : json["pop"],
        uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt == null ? null : dt,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
        "moonrise": moonrise == null ? null : moonrise,
        "moonset": moonset == null ? null : moonset,
        "moon_phase": moonPhase == null ? null : moonPhase,
        "temp": temp == null ? null : temp!.toJson(),
        "feels_like": feelsLike == null ? null : feelsLike!.toJson(),
        "pressure": pressure == null ? null : pressure,
        "humidity": humidity == null ? null : humidity,
        "dew_point": dewPoint == null ? null : dewPoint,
        "wind_speed": windSpeed == null ? null : windSpeed,
        "wind_deg": windDeg == null ? null : windDeg,
        "wind_gust": windGust == null ? null : windGust,
        "weather": weather == null
            ? null
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "clouds": clouds == null ? null : clouds,
        "pop": pop == null ? null : pop,
        "uvi": uvi == null ? null : uvi,
      };
}

class FeelsLike {
  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  double? day;
  double? night;
  double? eve;
  double? morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"] == null ? null : json["day"].toDouble(),
        night: json["night"] == null ? null : json["night"].toDouble(),
        eve: json["eve"] == null ? null : json["eve"].toDouble(),
        morn: json["morn"] == null ? null : json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "night": night == null ? null : night,
        "eve": eve == null ? null : eve,
        "morn": morn == null ? null : morn,
      };
}

class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"] == null ? null : json["day"].toDouble(),
        min: json["min"] == null ? null : json["min"].toDouble(),
        max: json["max"] == null ? null : json["max"].toDouble(),
        night: json["night"] == null ? null : json["night"].toDouble(),
        eve: json["eve"] == null ? null : json["eve"].toDouble(),
        morn: json["morn"] == null ? null : json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "min": min == null ? null : min,
        "max": max == null ? null : max,
        "night": night == null ? null : night,
        "eve": eve == null ? null : eve,
        "morn": morn == null ? null : morn,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
