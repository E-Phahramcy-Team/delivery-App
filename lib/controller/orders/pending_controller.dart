import 'package:delivery/controller/trackin_controller.dart';
import 'package:delivery/core/class/statusrequest.dart';
import 'package:delivery/core/functions/handingdatacontroller.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/datasource/remote/orders/pending_data.dart';
import 'package:delivery/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());

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
    var response = await ordersPendingData.getData();
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
  //
  // detailsOrders(String orderid) async {
  //   data.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await ordersPendingData.getData();
  //   print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       refrehOrder();
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //     // End
  //   }
  //   update();
  // }

  approveOrders(String usersid, String ordersid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.approveOrders(
        myServices.sharedPreferences.getString("id")!, usersid, ordersid);

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        TrackinController trackinController = Get.put(TrackinController());
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
