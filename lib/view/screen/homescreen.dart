import 'dart:io';

import 'package:delivery/controller/homescreen_controller.dart';
import 'package:delivery/core/functions/alertexitapp.dart';
import 'package:delivery/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          appBar: AppBar(title: Text("orders")),
              drawer: Drawer(),
              bottomNavigationBar: const CustomBottomAppBarHome(),
          body: WillPopScope(
              child: controller.listPage.elementAt(controller.currentpage),
              onWillPop: alertExitApp),
            ));
  }
}
