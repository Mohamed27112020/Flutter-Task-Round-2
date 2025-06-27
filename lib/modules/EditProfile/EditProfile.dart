import 'package:fire_app/Core/Widget/custom_text_field.dart';
import 'package:fire_app/Core/Widget/primay_button_widget.dart';
import 'package:fire_app/Core/styling/app_colors.dart';
import 'package:fire_app/Core/styling/app_styles.dart';
import 'package:fire_app/data/Profilemodel.dart';
import 'package:fire_app/modules/profile/profilecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  String? selectedGender; // To track selected gender
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: AppStyles.primary24HeadStyle.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() {
        final user = userController.userProfile.value!;

        final fullNameController = TextEditingController(text: user.fullName);
        final emailController = TextEditingController(text: user.email);
        final mobileController = TextEditingController(text: user.mobileNumber);
        final dobController = TextEditingController(text: user.dateOfBirth);
        var genderController = TextEditingController(text: user.gender);
        if (user == null) return Center(child: Text('No profile data'));

        return SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        //   user.imageUrl,
                        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  user.fullName!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 4),
              Center(
                child: Text(
                  user.email!,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Full Name :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                width: 331,
                color: AppColors.fourColor,
                height: 56,
                controller: fullNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                isPassword: false,
                hintText: 'Enter Your Full Nmae',
              ),

              const SizedBox(height: 24),
              const Text(
                'Email:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                width: 331,
                color: AppColors.fourColor,

                height: 56,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                isPassword: false,
                hintText: 'Enter Your Email',
              ),

              const SizedBox(height: 24),
              const Text(
                'Mobile Number:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                width: 331,
                color: AppColors.fourColor,

                height: 56,
                controller: mobileController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
                isPassword: false,
                hintText: 'Enter Your Mobile Number',
              ),

              const SizedBox(height: 24),
              const Text(
                'Date of Birth:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                width: 331,
                color: AppColors.fourColor,

                height: 56,
                type: TextInputType.datetime,
                controller: dobController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  return null;
                },
                isPassword: false,
                hintText: 'Enter Your Date of Birth',
              ),
              const SizedBox(height: 24),

              const Text(
                'Gender:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: AppColors.fourColor,
                      width: 150,
                      height: 50,
                      child: Row(
                        children: [
                          Radio(
                            value: 'Male',
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                          Text('Male', style: AppStyles.black18BoldStyle),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16),
                    Container(
                      color: AppColors.fourColor,
                      width: 150,
                      height: 50,
                      child: Row(
                        children: [
                          Radio(
                            value: 'Female',
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                          Text('Female', style: AppStyles.black18BoldStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: PrimayButtonWidget(
                  width: 200.w,
                  bordersRadius: 16.r,
                  buttonColor: AppColors.primaryColor,
                  textColor: Colors.white,
                  buttonText: 'Update Profile',
                  onPress: () {
                    final updatedProfile = UserProfile(
                      fullName: fullNameController.text,
                      email: emailController.text,
                      mobileNumber: mobileController.text,
                      dateOfBirth: dobController.text,
                      gender: selectedGender.toString(),
                      imageUrl: user.imageUrl,
                    );
                    userController.updateUserProfile(updatedProfile);
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
