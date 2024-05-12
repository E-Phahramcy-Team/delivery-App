// ignore_for_file: unused_local_variable

import 'package:delivery/controller/productdetails_controller.dart';
import 'package:delivery/core/class/handlingdataview.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/functions/translatefatabase.dart';
import 'package:delivery/view/widget/productdetails/priceandcount.dart';
import 'package:delivery/view/widget/productdetails/subitemslist.dart';
import 'package:delivery/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());

    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secondColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child:  Text(
                  "128".tr,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => ListView(children: [
                  const TopProductPageDetails(),
                  const SizedBox(
                    height: 100,
                  ),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text("${controller.itemsModel.itemsName}",
                              //     style: Theme.of(context)
                              //         .textTheme
                              //         .headline1!
                              //         .copyWith(
                              //           color: AppColor.fourthColor,
                              //         )),
                              Text(
                                  translateDatabase(
                                      controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName),
                                  style: const TextStyle(
                                      color: AppColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              PriceAndCountItems(
                                  onAdd: () {
                                    controller.add();
                                  },
                                  onRemove: () {
                                    controller.remove();
                                  },
                                  price:
                                      "${controller.itemsModel.itemspricedisount}",
                                  count: "${controller.countitems}"),
                              const SizedBox(height: 10),
                              Text(translateDatabase(controller.itemsModel.itemsDescAr,controller.itemsModel.itemsDesc),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: AppColor.grey2)),
                              const SizedBox(height: 10),
                              Text("size",
                                  style: Theme.of(context).textTheme.headline1!.copyWith(
                                        color: AppColor.fourthColor,
                                      )),
                              const SizedBox(height: 10),
                              const SubitemsList()
                            ]),
                      ))
                ])));
  }
}
