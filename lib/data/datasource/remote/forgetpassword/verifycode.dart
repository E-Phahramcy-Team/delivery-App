import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifycodeforgetpassword,
        {"email": email, "verfiycode": verifycode});
    return response.fold((l) => l, (r) => r);
  }
}
