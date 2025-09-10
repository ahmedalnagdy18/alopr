import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmptyDoctorWidget extends StatelessWidget {
  const EmptyDoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        SizedBox(
            height: 276.h, child: SvgPicture.asset("images/doctor_home.svg")),
        SizedBox(height: 24.h),
        Text(
          'You have no patients yet. Once a patient connects with you, they will appear here',
          style: AppTexts.regular(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class DoctorWidget extends StatelessWidget {
  const DoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 36.h),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6.r,
                      offset: Offset(0, 2)),
                ],
              ),
              child: Text(
                "Ahmed Alnagdy",
                style: AppTexts.heading(context),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemCount: 4,
        ),
      ],
    );
  }
}
