import 'package:delivery/controller/address/adddetails_controller.dart';
import 'package:delivery/core/class/handlingdataview.dart';
import 'package:delivery/core/shared/custombutton.dart';
import 'package:delivery/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    AddAddressDetailsController controller =
        Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title:  Text('89'.tr),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  CustomTextFormAuth(
                      hinttext: "90".tr,
                      labeltext: "90".tr,
                      iconData: Icons.location_city,
                      mycontroller: controller.city,
                      valid: (val) {
                        return null;
                      },
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "91".tr,
                      labeltext: "91".tr,
                      iconData: Icons.streetview,
                      mycontroller: controller.street,
                      valid: (val) {
                        return null;
                      },
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "92".tr,
                      labeltext: "92".tr,
                      iconData: Icons.near_me,
                      mycontroller: controller.name,
                      valid: (val) {
                        return null;
                      },
                      isNumber: false),
                  
                  CustomButton(
                    text: "93".tr,
                    onPressed: () {
                      controller.addAddress();
                    },
                  )
                ])),
          )),
    );
  }
}
