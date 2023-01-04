import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherModel weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 50),
      child: Container(
        height: 270,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.0),
            border: Border.all(
              width: 15,
              color: Colors.black.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(150)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                '${weatherDataCurrent.current!.weather![0].description}',
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 1.5),
              ),
            ),
            Flexible(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: '${weatherDataCurrent.current!.temp!.toInt()}°',
                  style: const TextStyle(
                      fontSize: 95,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ])),
            ),
          ],
        ),
      ),
    );
  }
}
