import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData(String deliverid) async {
    var response = await crud.postData(AppLink.viewarchiveOrders, {"id": deliverid});
    return response.fold((l) => l, (r) => r);
  }
  rating(String ordersid ,String comment , String rating) async {
    var response = await crud.postData(AppLink.rating, {"id": ordersid , "comment" :comment , "rating":rating});
    return response.fold((l) => l, (r) => r);
  }
}
