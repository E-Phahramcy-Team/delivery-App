import 'package:delivery/controller/home_controller.dart';
import 'package:delivery/core/class/statusrequest.dart';
import 'package:delivery/core/functions/handingdatacontroller.dart';
import 'package:delivery/data/datasource/remote/offers_data.dart';
import 'package:delivery/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());

  List <ItemsModel>data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await offersData.getData();

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata2 = response['data'];
        data.addAll(listdata2.map((e) => ItemsModel.fromJson(e)));

        // data.addAll(response['data']);

      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
