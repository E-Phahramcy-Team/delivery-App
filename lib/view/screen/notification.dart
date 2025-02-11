// ignore_for_file: unused_local_variable

import 'package:delivery/controller/notification_controller.dart';
import 'package:delivery/core/class/handlingdataview.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Container(
      child: GetBuilder<NotificationController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView(children: [
                     Center(
                        child: Text(
                      "127".tr,
                      style: const TextStyle(
                          fontSize: 18,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(height: 10),
                    ...List.generate(
                        controller.data.length,
                        (index) => Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Stack(
                                children: [
                                  ListTile(
                                    title: Text(controller.data[index]
                                        ['notification_title']),
                                    subtitle: Text(controller.data[index]
                                        ['notification_body']),
                                  ),
                                  // Positioned(
                                  //     right: 5,
                                  //     child: Text(
                                  //       Jiffy.parse(controller.data[index]['notification_datetime'],pattern: "yyyy-MM-dd").fromNow(),
                                  //       style: const TextStyle(
                                  //           color: AppColor.primaryColor1,
                                  //           fontWeight: FontWeight.bold),
                                  //     ))
                                  Positioned(
                                    right: controller.isArabic ? null : 5,
                                    left: controller.isArabic ? 5 : null,
                                    child: Text(
                                      Jiffy.parse(
                                        controller.data[index]['notification_datetime'],
                                        pattern: "yyyy-MM-dd",
                                      ).fromNow(),
                                      style: const TextStyle(
                                        color: AppColor.primaryColor1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textDirection: controller.isArabic ? TextDirection.rtl : TextDirection.ltr,
                                    ),
                                  )

                                ],
                              ),
                            ))
                  ])))),
    );
  }
}
