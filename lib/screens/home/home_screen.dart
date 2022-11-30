import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants.dart';
import 'package:http/http.dart' as http;

import 'package:geolocator/geolocator.dart';
import 'package:weather_app/providers/location_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String lat;
  late String long;

  @override
  void initState() {
    super.initState();
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    getLocation().then((value) {
      locationProvider.lat = '${value.latitude}';
      locationProvider.long = '${value.longitude}';

      log(locationProvider.lat);
      log(locationProvider.long);
    });
  }

  Future<Position> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission are permanently denied, we cannot request location');
    }

    return await Geolocator.getCurrentPosition();
  }

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
    final locationProvider = Provider.of<LocationProvider>(context);
    var Size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                  Text(
                    locationProvider.lat,
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  Text(
                    locationProvider.long,
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
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
    );
  }
}
