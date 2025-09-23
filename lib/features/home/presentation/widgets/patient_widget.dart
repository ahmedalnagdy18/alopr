import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/home/presentation/screens/upload_page.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientWidget extends StatelessWidget {
  const PatientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 70.h),
        _coustomBox(
          context: context,
          title: S.of(context).uploadTest,
          subTitle: S.of(context).upload1Subtitle,
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => UploadPage(
                isQueez: false,
                buttonName: S.of(context).uploadFile,
                title: S.of(context).uploadYourTest,
                subTitle: S.of(context).uploadPageSubtitle1,
              ),
            ));
          },
        ),
        SizedBox(height: 16.h),
        _coustomBox(
          context: context,
          title: S.of(context).uploadMRI,
          subTitle: S.of(context).upload2Subtitle,
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => UploadPage(
                isQueez: false,
                buttonName: S.of(context).uploadScan,
                title: S.of(context).uploadYourMRI,
                subTitle: S.of(context).uploadPageSubtitle2,
              ),
            ));
          },
        ),
        SizedBox(height: 16.h),
        _coustomBox(
          context: context,
          title: S.of(context).aloprCognitiveTest,
          subTitle: S.of(context).upload3Subtitle,
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => UploadPage(
                isQueez: true,
                title: S.of(context).uploadYourTest,
                subTitle: S.of(context).uploadPageSubtitle3,
              ),
            ));
          },
        ),
      ],
    );
  }
}

Widget _coustomBox(
    {required BuildContext context,
    required String title,
    required String subTitle,
    required Function() onTap}) {
  final isDarkMood = Theme.of(context).brightness == Brightness.dark;
  return GestureDetector(
    onTap: onTap,
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
                    color: Colors.grey, blurRadius: 6.r, offset: Offset(0, 2)),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTexts.heading(context).copyWith(
              color: AppColors.headingLight,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            subTitle,
            style: AppTexts.paragraph(context).copyWith(
              color: AppColors.headingLight,
            ),
          ),
        ],
      ),
    ),
  );
}
