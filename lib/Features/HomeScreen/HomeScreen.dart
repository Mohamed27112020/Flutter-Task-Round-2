import 'package:fire_app/Features/HomeScreen/Widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    'assets/images/pe1.jpg',
    'assets/images/pe2.jpg',
    'assets/images/pe3.jpg',
    'assets/images/pe4.jpg',
    'assets/images/pe5.jpg',
    'assets/images/pe6.jpg',
  ];

  int _currentPage = 0;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Delivering to',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Row(
              children: [
                const Text(
                  'AI Satwa, SIA Street',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_down, size: 18),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildServicesSection(),
            buildPromoCodeBanner(),
            buildShortcutsSection(),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(images[index], fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
          //  buildLimitedTimeOffer(),
            buildPopularRestaurants(),
          ],
        ),
      ),
    );
  }
}
