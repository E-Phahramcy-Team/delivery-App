import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData(String deliverid) async {
    var response = await crud.postData(AppLink.viewacceptedOrders, {"id": deliverid});
    return response.fold((l) => l, (r) => r);
  }

  doneDlivery(String ordersid , String usersid ) async {
    var response = await crud.postData(AppLink.doneOrders, {"ordersid": ordersid, "usersid":usersid});
    return response.fold((l) => l, (r) => r);
  }


}
