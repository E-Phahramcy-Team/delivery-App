import 'package:delivery/view/screen/home.dart';
import 'package:delivery/view/screen/notification.dart';
import 'package:delivery/view/screen/offers.dart';
import 'package:delivery/view/screen/orders/accepted.dart';
import 'package:delivery/view/screen/orders/pending.dart';
import 'package:delivery/view/screen/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const Settings()

  ];

  List bottomappbar = [
    {"title": "Pending", "icon": Icons.home},
    {"title": "Settings", "icon": Icons.add_shopping_cart_outlined},
    {"title": "Accepted", "icon": Icons.settings}


  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
