import 'package:device_preview/device_preview.dart';
import 'package:fire_app/Core/styling/app_colors.dart';
import 'package:fire_app/Routes.dart';
import 'package:fire_app/modules/profile/Binding.dart';
import 'package:fire_app/modules/profile/profileView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyD_CRLfkllS9csMS4MJVWIkajaibm0z8mU',
      appId: '1:216446081880:android:2e2130bb2b6872d347a32d',
      messagingSenderId: '216446081880',
      projectId: 'e-commerce-34315',
      storageBucket: 'e-commerce-34315.firebasestorage.app',
    ),
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (BuildContext context) {
        return MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Task profile ',
          
          initialRoute: AppPages.INITIAL,
           getPages: AppPages.routes,
          home: ProfileScreen(),
          theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
