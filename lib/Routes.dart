import 'package:fire_app/modules/EditProfile/EditProfile.dart';
import 'package:fire_app/modules/MyOrders/Binding.dart';
import 'package:fire_app/modules/MyOrders/myorders.dart';
import 'package:fire_app/modules/profile/Binding.dart';
import 'package:fire_app/modules/profile/profileView.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = '/';

  static final routes = [
    GetPage(name: '/', page: () => ProfileScreen(), binding: UserBinding()),
    GetPage(
      name: '/details',
      page: () => ProfileDetailsScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(name: '/myorders', page: () => MyOrdersScreen(),binding: ProductsBinding(),),
  ];
}
