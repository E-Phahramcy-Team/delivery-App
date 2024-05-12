import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewpendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }
  // deleteData(String orderid) async {
  //   var response = await crud.postData(AppLink.detailsOrders, {"id": orderid});
  //   return response.fold((l) => l, (r) => r);
  // }

  approveOrders(String deliverid,String usersid,String ordersid) async {
    var response = await crud.postData(AppLink.approveOrders, {"deliveryid": deliverid , "usersid":usersid ,"ordersid":ordersid});
    return response.fold((l) => l, (r) => r);
  }

}
