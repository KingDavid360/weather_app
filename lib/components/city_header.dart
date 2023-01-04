import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../controller/global_controller.dart';

class CityHeader extends StatefulWidget {
  const CityHeader({Key? key}) : super(key: key);

  @override
  State<CityHeader> createState() => _CityHeaderState();
}

class _CityHeaderState extends State<CityHeader> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLatitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, long) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
    print(placemark);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            city,
            style: const TextStyle(
                fontSize: 35, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        Container(
          child: Text(
            date,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
                height: 1.5),
          ),
        ),
      ],
    );
  }
}
