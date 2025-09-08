import 'dart:async';

import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/authentication/presentation/screens/verification_successful_page.dart';
import 'package:alopr/features/authentication/presentation/widgets/otp_widget.dart';
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
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        title: Text(
          "Verify Your Email",
          style: AppTexts.regular.copyWith(
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
                'We’ve sent a 4-digit code to your email. Please enter it below to verify your account.',
                style: AppTexts.regular,
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VerificationSuccessfulPage(
                            role: widget.role,
                          ),
                        ));
                      }
                    : null,
                text: 'Verify',
              ),
              SizedBox(height: 16.h),
              _rowText(
                isTime: false,
                text: '''Didn't receive the code?''',
                text2: 'Click Resend',
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
                isTime: true,
                text: 'Resend in,',
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
  required String text,
  required String text2,
  required bool isTime,
  final Function()? onTap,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        style: AppTexts.regular.copyWith(
            color: isTime == false
                ? Colors.grey.shade600
                : AppColors.headingLight),
      ),
      SizedBox(width: 4),
      isTime == false
          ? InkwellWidget(
              onTap: onTap,
              child: Text(
                text2,
                style: AppTexts.regular
                    .copyWith(decoration: TextDecoration.underline),
              ),
            )
          : Text(
              text2,
              style: AppTexts.regular.copyWith(color: AppColors.buttonLight),
            ),
    ],
  );
}
