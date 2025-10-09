import 'dart:async';

import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/extentions/app_extentions.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/authentication/presentation/screens/verification_successful_page.dart';
import 'package:alopr/features/authentication/presentation/widgets/otp_widget.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required this.role});
  final String role;
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final otpController = TextEditingController();

  late Timer _timer;
  int _start = 120;
  bool _isTimerEnded = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          _isTimerEnded = true;
          _timer.cancel();
        }
      });
    });
  }

  void resetTimer() {
    setState(() {
      _start = 120;
      _isTimerEnded = false;
    });
    startTimer();
  }

  String getTimerText() {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          S.of(context).verifyYourEmail,
          style: AppTexts.regular(context).copyWith(
            fontSize: 20.sp,
          ),
        ),
        centerTitle: false,
        iconTheme: IconThemeData(
          size: 24.r,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 36.h),
              Text(
                S.of(context).otpMessage,
                style: AppTexts.regular(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              OtpWidget(
                color: AppColors.primaryLight,
                controller: otpController,
                onCompleted: (val) {},
              ),
              SizedBox(height: 16.h),
              MainAppButton(
                bouttonWidth: double.infinity,
                onPressed: (otpController.text.length == 4)
                    ? () {
                        if (otpController.text == "1234") {
                          Navigator.of(context).pushAndRemoveUntil(
                            CupertinoPageRoute(
                              builder: (context) => VerificationSuccessfulPage(
                                role: widget.role,
                              ),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        } else {
                          showErrorToastMessage(
                              message: 'Verification code is wrong');
                        }
                      }
                    : null,
                text: S.of(context).verify,
              ),
              SizedBox(height: 16.h),
              _rowText(
                context: context,
                isTime: false,
                text: S.of(context).didReceiveCode,
                text2: S.of(context).clickResend,
                onTap: _isTimerEnded
                    ? () {
                        //todo: resend
                        //    sendCodeAgian();
                        resetTimer();
                      }
                    : null,
              ),
              SizedBox(height: 16.h),
              _rowText(
                context: context,
                isTime: true,
                text: S.of(context).resendIn,
                text2: getTimerText(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _rowText({
  required BuildContext context,
  required String text,
  required String text2,
  required bool isTime,
  final Function()? onTap,
}) {
  final textColor = Theme.of(context).brightness == Brightness.dark
      ? AppColors.headingDark
      : AppColors.headingLight;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: AppTexts.regular(context).copyWith(
            color: isTime == false ? Colors.grey.shade600 : textColor),
      ),
      SizedBox(width: 4),
      isTime == false
          ? InkwellWidget(
              onTap: onTap,
              child: Text(
                text2,
                style: AppTexts.regular(context).copyWith(
                    decoration: Directionality.of(context) == TextDirection.rtl
                        ? null
                        : TextDecoration.underline),
              ),
            )
          : Text(
              text2,
              style: AppTexts.regular(context)
                  .copyWith(color: AppColors.buttonLight),
            ),
    ],
  );
}
