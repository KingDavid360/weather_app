import 'package:flutter/cupertino.dart';

class LocationProvider extends ChangeNotifier {
  String lat;
  String long;

  LocationProvider({required this.lat, required this.long});
}
