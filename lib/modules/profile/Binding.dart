// presentation/bindings/user_binding.dart

import 'package:fire_app/modules/profile/profilecontroller.dart';
import 'package:get/get.dart';

class UserBinding implements Bindings {
  @override
   @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }
}
class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }
}