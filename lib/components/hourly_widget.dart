import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../controller/global_controller.dart';

class HourlyWidget extends StatefulWidget {
  HourlyWidget({Key? key}) : super(key: key);

  @override
  State<HourlyWidget> createState() => _HourlyWidgetState();
}

class _HourlyWidgetState extends State<HourlyWidget> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: globalController.weatherdata.hourly?.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(dateConverter(
                      "${globalController.weatherdata.hourly?.elementAt(index).dt}")),
                  Image.asset(
                    weatherImage(
                        "${globalController.weatherdata.hourly!.elementAt(index).weather![0].icon}"),
                    height: 30,
                    width: 30,
                  ),
                  Text(
                      "${globalController.weatherdata.hourly?.elementAt(index).temp}°c")
                ],
              ),
            ),
          );
        });
  }
}

dateConverter(String unixDate) {
  var convert = DateTime.fromMillisecondsSinceEpoch(int.parse(unixDate) * 1000);
  String date = DateFormat("Hm").format(convert);
  return date;
}

weatherImage(String icon) {
  switch (icon) {
    case "01d":
      return "images/01d.png";
    case "01n":
      return "images/01n.png";
    case "02d":
      return "images/02d.png";
    case "02n":
      return "images/02n.png";
    case "03d":
      return "images/03d.png";
    case "03n":
      return "images/03n.png";

    case "04d":
      return "images/04d.png";

    case "04n":
      return "images/04n.png";

    case "09d":
      return "images/09d.png";

    case "09n":
      return "images/09n.png";

    case "10d":
      return "images/10d.png";

    case "10n":
      return "images/10n.png";

    case "11d":
      return "images/11d.png";

    case "11n":
      return "images/11n.png";

    case "13d":
      return "images/13d.png";

    case "13n":
      return Image.asset("images/13n.png");

    case "50d":
      return "images/50d.png";

    case "50n":
      return "images/50n.png";

    case "unknown":
      return "images/unknown.png";
  }
}
