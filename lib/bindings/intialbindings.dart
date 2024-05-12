import 'package:delivery/core/class/crud.dart';
import 'package:get/get.dart';

//   تستخدم لإعداد الأشياء الأساسية التي يحتاجها التطبيق عند البدء

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Start
    Get.put(Crud());
  }
}
