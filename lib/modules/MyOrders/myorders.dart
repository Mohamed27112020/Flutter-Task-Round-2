import 'package:fire_app/Core/styling/app_colors.dart';
import 'package:fire_app/Core/styling/app_styles.dart';
import 'package:fire_app/data/ordermodel.dart';
import 'package:fire_app/modules/MyOrders/ordersController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({super.key});

  final ProductsController controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    controller.fetchAllProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.products.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.error.isNotEmpty) {
          return Center(child: Text(controller.error.value));
        }

        if (controller.products.isEmpty) {
          return Center(child: Text('No products found'));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return OrderItem(product: product);
            },
          ),
        );
      }),
    );
  }
}

class OrderItem extends StatelessWidget {
  final Product product;

  const OrderItem({required this.product, super.key});
  final isCanceled = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Order status and date
        Row(
          children: [
            Text(
              'Order: Delivered',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isCanceled ? Colors.red : Colors.green,
              ),
            ),
            const Spacer(),
            Text(
              'May 15',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Container(
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                width: 100,
                height: 100,
                product.imageUrl,
                // "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                fit: BoxFit.fill,
              ),
              SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,

                    child: Row(
                      children: [
                        Text(
                          product.name,
                          style: AppStyles.primary24HeadStyle.copyWith(
                            fontSize: 18,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(width: 45),
                        //    Spacer(),
                        Icon(
                          Icons.delete_outline,
                          size: 20,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.add,
                          size: 20,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Product description
                  Container(
                    width: 250,
                    child: Text(
                      product.desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Price and quantity
                  Row(
                    children: [
                      Text(
                        product.price.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 32),
                      Text(
                        '1x vds.',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 32),
                      Text(
                        'Total: ${product.price * 1}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        // Product title
      ],
    );
  }
}
/*  OrderItem(
            status: 'Delivered',
            date: 'May 15',
            title: 'Serenity Nightstand',
            description:
                'In a boxer game, Integer turns quam. Isamed is an enemy, Uribe...',
            price: '\$7.50',
            quantity: '1x vds.',
            total: '\$7.50',
             image: '',
          ),
          SizedBox(height: 16),
          Divider(thickness: 1),

          OrderItem(
            status: 'Canceled',
            date: 'May 22',
            title: 'Blue Table Lamp',
            description:
                'In a boxer game, Integer turns quam, boxed is an enemy, Uribe...',
            price: '\$23',
            quantity: '2x vds.',
             image: '',
            total: '\$50',
            isCanceled: true,
          ),
          SizedBox(height: 16),
          Divider(thickness: 1),

          OrderItem(
            status: 'Delivered',
            date: 'June 04',
            title: 'Bedroom Dresser',
            description:
                'In a boxer game, Integer turns quam. Isamed is an enemy, Uribe...',
            price: '\$285',
             image: '',
            quantity: '1x vds.',
            total: '\$285',
          ),
          SizedBox(height: 16),
          Divider(thickness: 1),

          OrderItem(
            status: 'Delivered',
            date: 'June 12',
            title: 'Green Bed',
             image: '',
            description:
                'In a boxer game, Integer turns quam, boxed is an enemy, Uribe...',
            price: '\$285',
            quantity: '2x vds.',
            total: '\$285',
          ),
          SizedBox(height: 16),
          Divider(thickness: 1),

          OrderItem(
            status: 'Delivered',
            date: 'June 12',
            title: 'Green Bed',
            image: '',
            description:
                'In a boxer game, Integer turns quam, boxed is an enemy, Uribe...',
            price: '\$285',
            quantity: '2x vds.',
            total: '\$285',
          ),*/