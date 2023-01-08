import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/global_controller.dart';

class DayWeekIndicator extends StatefulWidget {
  const DayWeekIndicator({Key? key}) : super(key: key);

  @override
  State<DayWeekIndicator> createState() => _DayWeekIndicatorState();
}

class _DayWeekIndicatorState extends State<DayWeekIndicator> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Day',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: globalController.dayWeekIndicator.value == true
                        ? Colors.white
                        : Colors.grey[700],
                  ),
                ),
                Text(
                  'Week',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: globalController.dayWeekIndicator.value == false
                        ? Colors.white
                        : Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      globalController.dayWeekIndicator(true).obs;
                      print(globalController.dayWeekIndicator.value);
                    });
                  },
                  child: Container(
                    height: 10,
                    width: Size.width * 0.5,
                    decoration: BoxDecoration(
                        color: globalController.dayWeekIndicator.value == true
                            ? Colors.white
                            : Colors.grey[700],
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10),
                            right: Radius.circular(0))),
                  ),
                ),
              ),
              Flexible(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      globalController.dayWeekIndicator(false).obs;
                      print(globalController.dayWeekIndicator.value);
                      print(
                          '${globalController.weatherdata.current!.weather![0].description}');
                    });
                  },
                  child: Container(
                    height: 10,
                    width: Size.width * 0.5,
                    decoration: BoxDecoration(
                        color: globalController.dayWeekIndicator.value == false
                            ? Colors.white
                            : Colors.grey[700],
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(0),
                            right: Radius.circular(10))),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
