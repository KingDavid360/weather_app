import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
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
  late String lat;
  late String long;

  @override
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  void getData() async {
    http.Response response;
    response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
    }
  }

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
                            weatherDataCurrent:
                                globalController.getData().getCurrentWeather(),
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
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
