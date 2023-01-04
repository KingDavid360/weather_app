import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/api/fetch_weather.dart';
import 'package:weather_app/components/city_header.dart';
import 'package:weather_app/constants.dart';
import 'package:http/http.dart' as http;

import 'package:geolocator/geolocator.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/providers/location_provider.dart';

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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/sunny.jpeg"),
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
                          gradient: KPrimaryGradient,
                        ),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount:
                                globalController.weatherdata.hourly?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                          dateConverter("${globalController.weatherdata.hourly?.elementAt(index).dt}")),
                                      Text(
                                          "${globalController.weatherdata.hourly?.elementAt(index).temp}°c")
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  dateConverter(String unixDate) {
    var convert = DateTime.fromMillisecondsSinceEpoch(int.parse(unixDate) * 1000);
    String date = DateFormat("Hm").format(convert);
    return date;
  }
}
