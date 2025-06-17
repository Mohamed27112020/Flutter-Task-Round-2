import 'package:fire_app/Core/Widget/custom_text_field.dart';
import 'package:fire_app/Core/Widget/primay_button_widget.dart';
import 'package:fire_app/Core/styling/app_colors.dart';
import 'package:fire_app/Core/styling/app_styles.dart' show AppStyles;
import 'package:fire_app/Features/AuthScreen/Bloc/AuthStates.dart';
import 'package:fire_app/Features/AuthScreen/Bloc/Auth_bloc.dart';
import 'package:fire_app/Features/AuthScreen/Bloc/auth_event.dart';
import 'package:fire_app/Features/AuthScreen/Sign_up_Screen.dart';
import 'package:fire_app/Features/MainScreen/Mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController UserNamecontroller = TextEditingController();

  TextEditingController Passwordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    UserNamecontroller.dispose();
    Passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.status == AuthStatus.authenticated) {
              // Navigate to home screen after successful login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/nawel.png',
                    fit: BoxFit.cover,
                    width: 400,
                    height: 400,
                  ),
                  SizedBox(height: 10.h),

                  Container(
                    width: 300.w,
                    height: 60.h,
                    child: CustomTextField(
                      prefixIcon: Icon(Icons.mail, color: Colors.grey),
                      controller: UserNamecontroller,
                      hintText: "email",
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  CustomTextField(
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    hintText: "Password",
                    controller: Passwordcontroller,
                    isPassword: true,
                  ),
                  SizedBox(height: 20.h),
                  if (state.status == AuthStatus.loading)
                    Center(child: const CircularProgressIndicator())
                  else
                    PrimayButtonWidget(
                      buttonText: "Sign In",
                      onPress: () async {
                        context.read<AuthBloc>().add(
                          LoginEvent(
                            email: UserNamecontroller.text.trim(),
                            password: Passwordcontroller.text.trim(),
                          ),
                        );
                      },
                      buttonColor: AppColors.primaryColor,
                      textColor: Colors.white,
                      width: double.infinity,
                      height: 60.h,
                    ),
                  if (state.status == AuthStatus.error)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        state.errorMessage ?? 'An error occurred',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),

                  Container(
                    height: 60.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "create an account",
                            style: AppStyles.black16w500Style.copyWith(
                              color: Colors.blue,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
