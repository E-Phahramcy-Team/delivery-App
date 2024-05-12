import 'package:delivery/core/class/statusrequest.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/functions/handingdatacontroller.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/datasource/remote/address_data.dart';
import 'package:delivery/data/datasource/remote/checkout_date.dart';
import 'package:delivery/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String addressid = "0";

  late String couponid;
  late String coupondiscount;
  late String priceorders;

  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addressid = dataaddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.success;
      }
      // End
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("75".tr, "76".tr);
    }
    if (deliveryType == null) {
      return Get.snackbar("75".tr, "77".tr);
    }
    if (dataaddress.isEmpty) {
      return Get.snackbar("75".tr, "129".tr);
    }

    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders,
      "couponid": couponid,
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString()
    };

    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar("70".tr, "77".tr);
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("75".tr, "78".tr);
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'].toString();
    priceorders = Get.arguments['priceorder'].toString();
    coupondiscount = Get.arguments['discountcoupon'].toString();

    getShippingAddress();
    super.onInit();
  }
}
