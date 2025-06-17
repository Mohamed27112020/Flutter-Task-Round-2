import 'package:fire_app/Core/Widget/primay_button_widget.dart';
import 'package:fire_app/Core/styling/app_colors.dart';
import 'package:fire_app/Features/AuthScreen/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                  });
                },
                children: [
                  buildPage(
                    image: 'assets/images/newal2.png',
                    title: 'all-in-one delivery',
                    description:
                        'Order groceries, medicines, and meals delivered straight to your door',
                  ),
                  buildPage(
                    image: 'assets/images/newal2.png',
                    title: 'User-to-User Delivery',
                    description:
                        'Send or receive items from other users quickly and easily',
                  ),
                  buildPage(
                    image: 'assets/images/newal2.png',
                    title: 'Sales & Discounts',
                    description: 'Discover exclusive sales and deals every day',
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.blue,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
            SizedBox(height: 20),
            isLastPage
                ? PrimayButtonWidget(
                  buttonColor: AppColors.primaryColor,
                  bordersRadius: 20,
                  width: 295,
                  height: 50,
                  onPress: () {
                    print("Onboarding Completed");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  buttonText: "Get Started",
                )
                : PrimayButtonWidget(
                  buttonColor: Color(0xFF8900FE),
                  width: 295,
                  height: 50,
                  bordersRadius: 20,
                  onPress: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  buttonText: "Get Started",
                ),
            SizedBox(height: 20),
            PrimayButtonWidget(
              buttonColor: Colors.transparent,
              textColor: Colors.grey,
              width: 295,
              height: 50,
              bordersRadius: 20,
              onPress: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              buttonText: "Next",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Stack(
      alignment: Alignment.center,
      //  mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(image, fit: BoxFit.cover, width: 400, height: 400),
        ),
        SizedBox(height: 20),
        Positioned(
          bottom: 180,
          child: Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Positioned(
          bottom: 120,
          child: Container(
            width: 300,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
