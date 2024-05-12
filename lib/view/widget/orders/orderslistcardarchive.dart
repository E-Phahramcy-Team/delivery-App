import 'package:delivery/controller/orders/archive_controller.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/data/model/ordersmodel.dart';
import 'package:delivery/view/widget/orders/dialograting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;

  const CardOrdersListArchive({Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    "${Jiffy.parse(listdata.ordersDatetime!, pattern: 'yyyy-MM-dd').fromNow()}",
                    style: const TextStyle(
                        color: AppColor.primaryColor1,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.printOrderType(listdata.ordersType!.toString())}"),
              Text("Order Price : ${listdata.ordersPrice} \YER"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \YER "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!.toString())} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!.toString())} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersId} \YER ",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Details"),
                  ),
                  const SizedBox(width: 10),
                  if (listdata.ordersRating ==0 )MaterialButton(
                    onPressed: () {
                      showDialogRating(context , listdata.ordersId!.toString());
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Rating"),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
