import 'package:alopr/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget(
      {super.key, required this.controller, this.onCompleted, this.color});
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      onCompleted: onCompleted,
      controller: controller,
      preFilledWidget: const Text(
        '_',
        style: TextStyle(color: AppColors.primaryLight),
      ),
      errorText: 'The code is not valid',
      errorTextStyle: const TextStyle(
        color: Colors.red,
      ),
      defaultPinTheme: PinTheme(
          textStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8).r,
            border: Border.all(
              color: AppColors.primaryLight,
            ),
          )),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      length: 4,
      focusedPinTheme: PinTheme(
          textStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryLight,
          ),
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8).r,
            border: Border.all(
              color: AppColors.paragraphLight,
            ),
          )),
      textInputAction: TextInputAction.next,
    );
  }
}
