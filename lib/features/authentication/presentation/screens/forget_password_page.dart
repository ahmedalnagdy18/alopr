import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/app_textfield.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/authentication/presentation/screens/otp_page.dart';
import 'package:alopr/features/authentication/presentation/widgets/field_controller_widget.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final GlobalKey<FormState> _key = GlobalKey();
  bool firstSeen = true;
  bool isButtonEnabled = false;
  final _email = FieldControl();

  @override
  void initState() {
    _email.controller.addListener(_updateButtonState);
    super.initState();
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = _email.controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.headingDark
        : AppColors.headingLight;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleWidget(context),
                  SizedBox(height: 16.h),
                  Text(
                    S.of(context).enterYourEmailAddress,
                    style: AppTexts.regular(context).copyWith(
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  AppTextField(
                    controller: _email.controller,
                    autovalidateMode: firstSeen
                        ? AutovalidateMode.disabled
                        : AutovalidateMode.onUserInteraction,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    validator: (val) => AuthValidators.email(context, val),
                    hintText: S.of(context).emailAddress,
                  ),
                  SizedBox(height: 24.h),
                  MainAppButton(
                    backgroundColor: !isButtonEnabled ? Colors.grey : null,
                    bouttonWidth: double.infinity,
                    onPressed: isButtonEnabled
                        ? () {
                            setState(() {
                              firstSeen = false;
                            });
                            if (_key.currentState!.validate()) {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) => OtpPage(
                                    fromForgetPassword: true,
                                    email: _email.controller.text,
                                  ),
                                ),
                              );
                            }
                          }
                        : null,
                    text: S.of(context).resetPassword,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _titleWidget(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.w),
    child: Center(
      child: Column(
        children: [
          SizedBox(
            height: 56.h,
            width: 56.w,
            child: Image.asset("images/icon.png"),
          ),
          SizedBox(height: 16.h),
          Text(
            S.of(context).didYouForgetYourPassword,
            style: AppTexts.title(context).copyWith(fontSize: 24.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            S.of(context).forgetYoutPasswordALOPR,
            style: AppTexts.regular(context),
          ),
          SizedBox(height: 27.h),
        ],
      ),
    ),
  );
}
