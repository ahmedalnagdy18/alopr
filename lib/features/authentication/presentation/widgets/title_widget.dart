import 'package:alopr/core/fonts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 56.h,
          width: 56.w,
          child: Image.asset("images/icon.png"),
        ),
        SizedBox(height: 16.h),
        Text(
          title,
          style: AppTexts.title.copyWith(fontSize: 24.sp),
        ),
        SizedBox(height: 16.h),
        Text(
          subTitle,
          style: AppTexts.regular,
        ),
      ],
    );
  }
}
