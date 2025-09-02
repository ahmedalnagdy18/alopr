import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/common/textfield.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/authentication/presentation/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int selectRole = 0;
  bool isObscure1 = true;
  bool isObscure2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleWidget(
                    title: 'Get Started with ALOPR',
                    subTitle: 'Create your account',
                  ),
                  SizedBox(height: 27.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkwellWidget(
                        onTap: () {
                          setState(() {
                            selectRole = 0;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'Follower',
                              style: AppTexts.regular.copyWith(
                                  fontWeight: selectRole == 0
                                      ? FontWeight.w600
                                      : FontWeight.w400),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              height: 2.h,
                              width: 80.w,
                              color: selectRole == 0
                                  ? AppColors.primaryLight
                                  : Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 4.w),
                      InkwellWidget(
                        onTap: () {
                          setState(() {
                            selectRole = 1;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'Patient',
                              style: AppTexts.regular.copyWith(
                                  fontWeight: selectRole == 1
                                      ? FontWeight.w600
                                      : FontWeight.w400),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                                height: 2.h,
                                width: 80.w,
                                color: selectRole == 1
                                    ? AppColors.primaryLight
                                    : Colors.grey.shade400),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Full Name',
                          style: AppTexts.regular,
                        ),
                        SizedBox(height: 4.h),
                        TextFieldWidget(
                          hintText: "Enter your full name",
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Email',
                          style: AppTexts.regular,
                        ),
                        SizedBox(height: 4.h),
                        TextFieldWidget(
                          hintText: " Please enter a valid email address",
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Phone Number',
                          style: AppTexts.regular,
                        ),
                        SizedBox(height: 4.h),
                        TextFieldWidget(
                          hintText: "Enter your phone number",
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Password',
                          style: AppTexts.regular,
                        ),
                        SizedBox(height: 4.h),
                        TextFieldWidget(
                          obscureText: isObscure1,
                          suffixIcon: InkwellWidget(
                            onTap: () {
                              setState(() {
                                isObscure1 = !isObscure1;
                              });
                            },
                            child: Icon(isObscure1
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintText: "Enter your password",
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Confirm Password',
                          style: AppTexts.regular,
                        ),
                        SizedBox(height: 4.h),
                        TextFieldWidget(
                          obscureText: isObscure2,
                          suffixIcon: InkwellWidget(
                            onTap: () {
                              setState(() {
                                isObscure2 = !isObscure2;
                              });
                            },
                            child: Icon(isObscure2
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintText: "Re-enter your password",
                        ),
                        SizedBox(height: 12.h),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  MainAppButton(
                    bouttonWidth: double.infinity,
                    onPressed: () {},
                    text: 'Create Account',
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'I already have an account,',
                        style: AppTexts.regular.copyWith(color: Colors.grey),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Login',
                        style: AppTexts.regular
                            .copyWith(color: AppColors.buttonLight),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
