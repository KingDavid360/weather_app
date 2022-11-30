import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LocationProvider extends ChangeNotifier {
  String lat;
  String long;

  LocationProvider({required this.lat, required this.long});
}
