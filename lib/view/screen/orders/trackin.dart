// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:delivery/controller/orders/details_controller.dart';
import 'package:delivery/controller/trackin_controller.dart';
import 'package:delivery/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersTrackin extends StatelessWidget {
  const OrdersTrackin({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    OrdersDetailsController controller = Get.find();

    TrackinController controller2 = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Trackin'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
               
            
                  if (controller.ordersModel.ordersType == 0)
                     Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        height: 300,
                        width: double.infinity,
                        child:
                        GoogleMap(
                          mapType: MapType.normal,
                          markers: controller.markers.toSet(),
                          initialCameraPosition: controller.cameraPosition!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controller.completercontroller
                                .complete(controllermap);
                          },
                        ),
                      ),
                    )
                ])))),
      ),
    );
  }
}
