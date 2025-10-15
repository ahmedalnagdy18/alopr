import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/home/domain/entity/model/user_data_model.dart';
import 'package:alopr/features/home/presentation/screens/patient_details_page.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmptyDoctorWidget extends StatelessWidget {
  const EmptyDoctorWidget({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        SizedBox(
            height: 276.h, child: SvgPicture.asset("images/doctor_home.svg")),
        SizedBox(height: 24.h),
        Text(
          S.of(context).emptyDocWidgetTitle,
          style: AppTexts.regular(context),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12.h),
        IconButton(onPressed: onPressed, icon: Icon(Icons.refresh))
      ],
    );
  }
}

class DoctorWidget extends StatelessWidget {
  const DoctorWidget(
      {super.key, required this.userData, required this.onPressed});
  final List<UserDataModel> userData;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    final isDarkMood = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        SizedBox(height: 36.h),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final patient = userData[index];
            return InkwellWidget(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PatientDetailsPage(
                        patient: patient,
                      ),
                    ));
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.white,
                  boxShadow: isDarkMood
                      ? null
                      : [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 6.r,
                              offset: Offset(0, 2)),
                        ],
                ),
                child: Text(
                  userData[index].fullName ?? "",
                  style: AppTexts.heading(context).copyWith(
                    color: AppColors.headingLight,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemCount: userData.length,
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
