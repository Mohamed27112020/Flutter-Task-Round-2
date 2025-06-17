
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildServicesSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Services:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildServiceItem(Icons.fastfood, 'Food'),
              buildServiceItem(Icons.health_and_safety, 'Health & wellness'),
              buildServiceItem(Icons.shopping_basket, 'Groceries'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildServiceItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.orange),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget buildPromoCodeBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      color: Colors.white,
      child: Row(
        children: [
          const Icon(Icons.local_offer_outlined, color: Colors.orange),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get a code!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Add your code and save on your order',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 16),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget buildShortcutsSection() {
    final shortcuts = [
      buildShortcutItem('Past orders', Icons.history),
      buildShortcutItem('Super Savor', Icons.star_border),
      buildShortcutItem('Must-tries', Icons.thumb_up_outlined),
      buildShortcutItem('Give Back', Icons.favorite_border),
      buildShortcutItem('Best Salons', Icons.cut),
    ];
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shortcuts:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            height: 100.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: shortcuts.length,
              itemBuilder: (context, index) => shortcuts[index],
            ),
          ),
          /* GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            childAspectRatio: 1,
            children: [
              _buildShortcutItem('Past orders', Icons.history),
              _buildShortcutItem('Super Savor', Icons.star_border),
              _buildShortcutItem('Must-tries', Icons.thumb_up_outlined),
              _buildShortcutItem('Give Back', Icons.favorite_border),
              _buildShortcutItem('Best Salons', Icons.cut),
            ],
          ),*/
        ],
      ),
    );
  }

  Widget buildShortcutItem(String label, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.orange),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildLimitedTimeOffer() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Make with M&M\'s',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'For a limited time only',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/mms.png', // Replace with your actual image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPopularRestaurants() {
    final restaurants = [
      {'name': 'BEIRUT', 'deliveryTime': '2 mins'},
      {'name': 'Alto Beirut', 'deliveryTime': '5 mins'},
      {'name': 'Latkin', 'deliveryTime': '4 mins'},
      {'name': 'Fabial AI', 'deliveryTime': '6 mins'},
      {'name': 'Barbar', 'deliveryTime': '7 mins'},
      {'name': 'Fabial AI Max...', 'deliveryTime': '4 mins'},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular restaurants nearby',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: restaurants.length,
            separatorBuilder: (context, index) => const Divider(height: 24),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.restaurant, color: Colors.orange),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurants[index]['name']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${restaurants[index]['deliveryTime']} delivery',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 16),
                    onPressed: () {},
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

