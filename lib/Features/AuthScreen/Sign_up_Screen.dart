import 'package:fire_app/Core/Widget/custom_text_field.dart';
import 'package:fire_app/Core/Widget/primay_button_widget.dart';
import 'package:fire_app/Core/styling/app_colors.dart';
import 'package:fire_app/Core/styling/app_styles.dart';
import 'package:fire_app/Features/AuthScreen/Bloc/AuthStates.dart';
import 'package:fire_app/Features/AuthScreen/Bloc/Auth_bloc.dart';
import 'package:fire_app/Features/AuthScreen/Bloc/auth_event.dart';
import 'package:fire_app/Features/MainScreen/Mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController UserNamecontroller = TextEditingController();

  TextEditingController Passwordcontroller = TextEditingController();

  TextEditingController FullNamecontroller = TextEditingController();

  @override
  void dispose() {
    UserNamecontroller.dispose();
    Passwordcontroller.dispose();
    FullNamecontroller.dispose();
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
                      prefixIcon: Icon(Icons.person, color: Colors.grey),
                      controller: FullNamecontroller,
                      hintText: "name",
                      width: double.infinity,
                    ),
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
                  SizedBox(height: 10.h),
                  CustomTextField(
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    hintText: "Password",
                    controller: Passwordcontroller,
                    isPassword: true,
                  ),
                  SizedBox(height: 10.h),
                  if (state.status == AuthStatus.loading)
                    Center(child: const CircularProgressIndicator())
                  else
                    PrimayButtonWidget(
                      buttonText: "Sign Up",
                      onPress: () async {
                        context.read<AuthBloc>().add(
                          RegisterEvent(
                            email: UserNamecontroller.text.trim(),
                            password: Passwordcontroller.text.trim(),
                            displayName: FullNamecontroller.text.trim(),
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
                            Navigator.pushNamed(context, "/Login");
                          },
                          child: Text(
                            "Login Now",
                            style: AppStyles.black16w500Style.copyWith(
                              color: Colors.blue,
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
