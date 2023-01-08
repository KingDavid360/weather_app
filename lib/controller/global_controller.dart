import 'dart:convert';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/fetch_weather.dart';

import 'package:weather_app/model/weather_model.dart';

class GlobalController extends GetxController {
  //create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxBool dayWeekIndicator = false.obs;

  //creating instances for the variables to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  RxBool setDayOption(bool value) {
    dayWeekIndicator.value = value;
    return dayWeekIndicator;
  }

  WeatherModel weatherdata = WeatherModel();

  @override
  void onInit() {
    super.onInit();
    if (_isLoading.isTrue) {
      getLocation();
    }
  }

  getLocation() async {
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

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      print(value.longitude);
      print(value.latitude);
      //update our latitude and longitude
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;

      // 6.666568502588258, 3.3147528824354686
      return FetchWeatherApi()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherdata = value;
        _isLoading.value = false;
      });
    });
  }
}
