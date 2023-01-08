import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/global_controller.dart';

import '../constants.dart';
import '../screens/home/home_screen.dart';
import 'hourly_widget.dart';

class DailyWidget extends StatefulWidget {
  const DailyWidget({Key? key}) : super(key: key);

  @override
  State<DailyWidget> createState() => _DailyWidgetState();
}

class _DailyWidgetState extends State<DailyWidget> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 95,
        bottom: 80,
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: globalController.weatherdata.daily?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 50,
                width: 110,
                decoration: BoxDecoration(
                  gradient: backgroundColor(
                      "${globalController.weatherdata.current!.weather![0].description}"),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40), bottom: Radius.circular(40)),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.15),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dayConverter(
                          "${globalController.weatherdata.daily?.elementAt(index).dt}"),
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    Image.asset(
                      weatherImage(
                          "${globalController.weatherdata.daily!.elementAt(index).weather![0].icon}"),
                      height: 40,
                      width: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            "${globalController.weatherdata.daily?.elementAt(index).temp?.day!.toInt()}°c",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "/${globalController.weatherdata.daily?.elementAt(index).temp?.night!.toInt()}°c",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

dayConverter(String unixDate) {
  var convert = DateTime.fromMillisecondsSinceEpoch(int.parse(unixDate) * 1000);
  String date = DateFormat("EEEE").format(convert);
  return date;
}
