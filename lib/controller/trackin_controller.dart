import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class TrackinController extends GetxController {
  StreamSubscription<Position>? positionStream;

  getCurrentLocation() {
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      print("==================== Current Postion'");
      print(position!.latitude);
      print(position!.longitude);
    });
  }

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }
}
