import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather_app/components/city_header.dart';
import 'package:weather_app/components/daily_widget.dart';
import 'package:weather_app/components/day_week_indicator.dart';
import 'package:weather_app/components/hourly_widget.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/controller/global_controller.dart';

import '../../components/weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(backgroundImage(
                        "${globalController.weatherdata.current!.weather![0].description}")),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ListView(
                        children: [
                          Center(
                            child: CityHeader(),
                          ),
                          // for our current temp
                          CurrentWeatherWidget(
                            weatherDataCurrent: globalController.weatherdata,
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: Size.height * 0.4,
                        width: Size.width,
                        decoration: BoxDecoration(
                          gradient: backgroundColor(
                              "${globalController.weatherdata.current!.weather![0].description}"),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            // CityHeader(), // just for testing the stack
                            DayWeekIndicator(),
                            globalController.dayWeekIndicator.value == true
                                ? HourlyWidget()
                                : DailyWidget()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

backgroundImage(String imageName) {
  switch (imageName) {
    case "broken clouds":
      return "images/broken_clouds.jpeg";
    case "mist":
      return "images/mist.jpeg";
    case "overcast clouds":
      return "images/cloudy.jpeg";
    case "rainy":
      return "images/rainy.jpeg";
    case "light rain":
      return "images/rainy.jpeg";
    case "thunder":
      return "images/thunder.jpeg";
    default:
      return "images/sunny.jpeg";
  }
}

backgroundColor(String imageName) {
  switch (imageName) {
    case "broken clouds":
      return KBrokenCloudsGradient;
    case "mist":
      return KMistGradient;
    case "overcast clouds":
      return KCloudyGradient;
    case "rainy":
      return KRainy;
    case "light rain":
      return KRainy;
    case "thunder":
      return KCloudyGradient;
    default:
      return KPrimaryGradient;
  }
}
