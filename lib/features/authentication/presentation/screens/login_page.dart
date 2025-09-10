import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/app_textfield.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/authentication/presentation/screens/register_page.dart';
import 'package:alopr/features/authentication/presentation/widgets/field_controller_widget.dart';
import 'package:alopr/features/authentication/presentation/widgets/title_widget.dart';
import 'package:alopr/features/home/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;
  int selectRole = 0;
  final GlobalKey<FormState> _key = GlobalKey();
  bool firstSeen = true;
  bool isButtonEnabled = false;

  final _email = FieldControl();
  final _password = FieldControl();

  @override
  void initState() {
    _email.controller.addListener(_updateButtonState);
    _password.controller.addListener(_updateButtonState);
    super.initState();
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = _email.controller.text.isNotEmpty &&
          _password.controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleWidget(
                    title: 'Welcome Back!',
                    subTitle: 'Log in to ALOPR',
                    selectRole: selectRole,
                    followerOnTap: () {
                      setState(() {
                        selectRole = 0;
                      });
                    },
                    patientOnTap: () {
                      setState(() {
                        selectRole = 1;
                      });
                    },
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity,
                    child: Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: AppTexts.regular(context),
                          ),
                          SizedBox(height: 4.h),
                          AppTextField(
                            focusNode: _email.focus,
                            controller: _email.controller,
                            autovalidateMode: !firstSeen
                                ? AutovalidateMode.onUserInteraction
                                : null,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            validator: AuthValidators.email,
                            hintText: " Please enter a valid email address",
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Password',
                            style: AppTexts.regular(context),
                          ),
                          SizedBox(height: 4.h),
                          AppTextField(
                            focusNode: _password.focus,
                            controller: _password.controller,
                            autovalidateMode: !firstSeen
                                ? AutovalidateMode.onUserInteraction
                                : null,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            obscureText: isObscure,
                            suffixIcon: InkwellWidget(
                              onTap: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              child: Icon(
                                isObscure
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 18.r,
                              ),
                            ),
                            hintText: "Enter your password",
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Forgot Password?',
                            style: AppTexts.regular(context).copyWith(
                              color: Colors.grey.shade600,
                              fontSize: 10.sp,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          MainAppButton(
                            backgroundColor:
                                !isButtonEnabled ? Colors.grey : null,
                            bouttonWidth: double.infinity,
                            onPressed: isButtonEnabled
                                ? () {
                                    setState(() {
                                      firstSeen = false;
                                    });
                                    if (_key.currentState!.validate()) {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => HomePage(
                                          role: "patient",
                                        ),
                                      ));
                                    }
                                  }
                                : null,
                            text: 'Login',
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 4.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don’t have an account?',
                style: AppTexts.regular(context).copyWith(color: Colors.grey),
              ),
              SizedBox(width: 4),
              InkwellWidget(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ));
                },
                child: Text(
                  'Register',
                  style: AppTexts.regular(context)
                      .copyWith(color: AppColors.buttonLight),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
