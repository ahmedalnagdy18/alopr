import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/common/app_textfield.dart';
import 'package:alopr/core/extentions/app_extentions.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/authentication/presentation/screens/login_page.dart';
import 'package:alopr/features/authentication/presentation/screens/otp_page.dart';
import 'package:alopr/features/authentication/presentation/widgets/field_controller_widget.dart';
import 'package:alopr/features/authentication/presentation/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final GlobalKey<FormState> _key = GlobalKey();
  bool firstSeen = true;
  bool isButtonEnabled = false;

  final _fullName = FieldControl();
  final _email = FieldControl();
  final _phone = FieldControl();
  final _password = FieldControl();
  final _confirmPassword = FieldControl();

  @override
  void initState() {
    _fullName.controller.addListener(_updateButtonState);
    _email.controller.addListener(_updateButtonState);
    _phone.controller.addListener(_updateButtonState);
    _password.controller.addListener(_updateButtonState);
    _confirmPassword.controller.addListener(_updateButtonState);
    super.initState();
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = _fullName.controller.text.isNotEmpty &&
          _email.controller.text.isNotEmpty &&
          _phone.controller.text.isNotEmpty &&
          _password.controller.text.isNotEmpty &&
          _confirmPassword.controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
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
                    title: 'Get Started with ALOPR',
                    subTitle: 'Create your account',
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
                            'Full Name',
                            style: AppTexts.regular,
                          ),
                          SizedBox(height: 4.h),
                          AppTextField(
                            focusNode: _fullName.focus,
                            controller: _fullName.controller,
                            inputFormatters: [
                              PreventStartingSpaceInputFormatter(),
                            ],
                            autovalidateMode: !firstSeen
                                ? AutovalidateMode.onUserInteraction
                                : null,
                            validator: Validators.fullName,
                            hintText: "Enter your full name",
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Email',
                            style: AppTexts.regular,
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
                            validator: Validators.email,
                            hintText: " Please enter a valid email address",
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Phone Number',
                            style: AppTexts.regular,
                          ),
                          SizedBox(height: 4.h),
                          AppTextField(
                            focusNode: _phone.focus,
                            controller: _phone.controller,
                            maxLength: 11,
                            counterText: '',
                            keyboardType: TextInputType.number,
                            autovalidateMode: !firstSeen
                                ? AutovalidateMode.onUserInteraction
                                : null,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: Validators.phone,
                            hintText: "Enter your phone number",
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Password',
                            style: AppTexts.regular,
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
                            validator: Validators.password,
                            obscureText: isObscure1,
                            suffixIcon: InkwellWidget(
                              onTap: () {
                                setState(() {
                                  isObscure1 = !isObscure1;
                                });
                              },
                              child: Icon(
                                isObscure1
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 18.r,
                              ),
                            ),
                            hintText: "Enter your password",
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Confirm Password',
                            style: AppTexts.regular,
                          ),
                          SizedBox(height: 4.h),
                          AppTextField(
                            focusNode: _confirmPassword.focus,
                            controller: _confirmPassword.controller,
                            autovalidateMode: !firstSeen
                                ? AutovalidateMode.onUserInteraction
                                : null,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r'\s')),
                            ],
                            validator: (val) => Validators.confirmPassword(
                                val, _password.controller.text),
                            obscureText: isObscure2,
                            suffixIcon: InkwellWidget(
                              onTap: () {
                                setState(() {
                                  isObscure2 = !isObscure2;
                                });
                              },
                              child: Icon(
                                isObscure2
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 18.r,
                              ),
                            ),
                            hintText: "Re-enter your password",
                          ),
                          SizedBox(height: 12.h),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainAppButton(
                backgroundColor: !isButtonEnabled ? Colors.grey : null,
                bouttonWidth: double.infinity,
                onPressed: isButtonEnabled
                    ? () {
                        setState(() {
                          firstSeen = false;
                        });
                        if (_key.currentState!.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OtpPage(),
                          ));
                        }
                      }
                    : null,
                text: 'Create Account',
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I already have an account,',
                    style: AppTexts.regular.copyWith(color: Colors.grey),
                  ),
                  SizedBox(width: 4),
                  InkwellWidget(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                    },
                    child: Text(
                      'Login',
                      style: AppTexts.regular
                          .copyWith(color: AppColors.buttonLight),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
