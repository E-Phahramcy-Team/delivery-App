// ignore_for_file: prefer_const_constructors
import 'package:delivery/controller/cart_controller.dart';
import 'package:delivery/core/class/handlingdataview.dart';
import 'package:delivery/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:delivery/view/widget/cart/customitemscartlist.dart';
import 'package:delivery/view/widget/cart/topcardCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: Text("108".tr),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavgationBarCart(
                shipping: "0",
                controllercoupon: controller.controllercoupon!,
                onApplyCoupon: () {
                  controller.checkcoupon();
                },
                price: "${cartController.priceorders}",
                discount: "${controller.discountcoupon}%",
                totalprice: "${controller.getTotalPrice()}")),
        body: GetBuilder<CartController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    SizedBox(height: 10),
                    TopCardCart(
                      message: "${"119".tr} ${cartController.totalcountitems} ${"120".tr}",
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            cartController.data.length,
                            (index) => CustomItemsCartList(
                                onAdd: () async {
                                  await cartController.add(cartController
                                      .data[index].itemsId!
                                      .toString());
                                  cartController.refreshPage();
                                },
                                onRemove: () async {
                                  await cartController.delete(cartController
                                      .data[index].itemsId!
                                      .toString());
                                  cartController.refreshPage();
                                },
                                imagename:
                                    "${cartController.data[index].itemsImage}",
                                name: "${cartController.data[index].itemsName}",
                                price:
                                    "${cartController.data[index].itemsprice} \YER",
                                count:
                                    "${cartController.data[index].countitems}"),
                          )
                        ],
                      ),
                    )
                  ],
                )))));
  }
}
