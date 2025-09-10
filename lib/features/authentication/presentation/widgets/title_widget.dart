import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.followerOnTap,
      required this.patientOnTap,
      required this.selectRole});
  final String title;
  final String subTitle;
  final Function() followerOnTap;
  final Function() patientOnTap;
  final int selectRole;
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
          style: AppTexts.title(context).copyWith(fontSize: 24.sp),
        ),
        SizedBox(height: 16.h),
        Text(
          subTitle,
          style: AppTexts.regular(context),
        ),
        SizedBox(height: 27.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkwellWidget(
              onTap: followerOnTap,
              child: Column(
                children: [
                  Text(
                    'Follower',
                    style: AppTexts.regular(context).copyWith(
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
              onTap: patientOnTap,
              child: Column(
                children: [
                  Text(
                    'Patient',
                    style: AppTexts.regular(context).copyWith(
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
      ],
    );
  }
}
