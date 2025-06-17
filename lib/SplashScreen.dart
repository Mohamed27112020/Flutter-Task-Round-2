import 'package:fire_app/Features/OnBoarding/Onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController animatiosnController;

  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animatiosnController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    animation = CurvedAnimation(
      curve: Curves.linear,
      parent: animatiosnController,
    );

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
    /*
      storagehelper.getToken().then((value) {
        if (value != null && value.isNotEmpty) {
          Navigator.pushNamed(context, '/Main');
        } else {
          Navigator.pushNamed(context, '/Login');
        }
      });
    });
    */
  }

  @override
  void dispose() {
    animatiosnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaleTransition(
        scale: animation,
        child: Center(
          child: Image.asset(
            'assets/images/nawel.png',
            width: 200.w,
            height: 200.h,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
