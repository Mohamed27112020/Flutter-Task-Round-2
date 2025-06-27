import 'package:fire_app/modules/MyOrders/ordersController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
  }
}
