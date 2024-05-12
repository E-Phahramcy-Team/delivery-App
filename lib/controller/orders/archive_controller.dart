import 'package:delivery/core/class/statusrequest.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/functions/handingdatacontroller.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/datasource/remote/orders/accepted_data.dart';
import 'package:delivery/data/datasource/remote/orders/archive_data.dart';
import 'package:delivery/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersArchiveController extends GetxController {
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "58".tr;
    } else {
      return "59".tr;
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "60".tr;
    } else {
      return "61".tr;
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "62".tr;
    } else if (val == "1") {
      return "63".tr;
    } else if (val == "2") {
      return "64".tr;
    } else if (val == "3") {
      return "65".tr;
    } else {
      return "66".tr;
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }


  submitRating(String ordersid , double rating , String comment) async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData
        .rating(ordersid , comment ,  rating.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        // Get.offNamed(AppRoute.ordersarchive);
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
