
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/data/ordermodel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<Product> products = <Product>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  Future<void> fetchAllProducts() async {
    try {
      isLoading(true);
      error('');
      
      QuerySnapshot querySnapshot = await _firestore
          .collection('Orders')
          .get();

      products.assignAll(
        querySnapshot.docs.map((doc) => Product.fromFirestore(doc)).toList()
      );
      
    } catch (e) {
      error('Failed to fetch products: $e');
      Get.snackbar('Error', error.value);
    } finally {
      isLoading(false);
    }
  }
}