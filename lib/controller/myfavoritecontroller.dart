import 'package:delivery/controller/home_controller.dart';
import 'package:delivery/core/class/statusrequest.dart';
import 'package:delivery/core/functions/handingdatacontroller.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/datasource/remote/myfavorite_data.dart';
import 'package:delivery/data/model/itemsmodel.dart';
import 'package:delivery/data/model/myfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteController extends SearchMixController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  List<ItemsModel> listdata = [];

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

//  key => id items
//  Value => 1 OR 0

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteFromFavorite(String favroiteid) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    var response = favoriteData.deleteData(favroiteid);
    data.removeWhere((element) => element.favoriteId == favroiteid);
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }


  // void goToPageProductDetails(itemsModel) {
  //   Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  // }

  // void goToPageProductDetails(MyFavoriteModel) {
  //   Get.toNamed("productdetails", arguments: {"itemsmodel": MyFavoriteModel});
  }
  // goToPageProductDetails(itemsModel) {
  //
  // }
// }
