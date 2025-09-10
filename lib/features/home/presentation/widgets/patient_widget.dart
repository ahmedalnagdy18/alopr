import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/home/presentation/screens/upload_page.dart';
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
          title: "Upload Test",
          subTitle: "Upload your latest medical test results for review",
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UploadPage(
                isQueez: false,
                buttonName: 'Upload File',
                title: "Upload Your Test",
                subTitle:
                    "Please upload your latest medical test results in PDF or image format",
              ),
            ));
          },
        ),
        SizedBox(height: 16.h),
        _coustomBox(
          context: context,
          title: "Upload MRI",
          subTitle: "Share your brain MRI for analysis",
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UploadPage(
                isQueez: false,
                buttonName: 'Upload Scan',
                title: "Upload Your MRI",
                subTitle: "Please upload your brain MRI image for analysis",
              ),
            ));
          },
        ),
        SizedBox(height: 16.h),
        _coustomBox(
          context: context,
          title: "ALOPR Cognitive Test",
          subTitle:
              "Try our in-app cognitive test to check your memory and focus",
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UploadPage(
                isQueez: true,
                title: "Upload Your Test",
                subTitle:
                    "Take our quick memory and focus test to evaluate your cognitive skills",
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
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 6.r, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTexts.heading(context),
          ),
          SizedBox(height: 6.h),
          Text(
            subTitle,
            style: AppTexts.paragraph(context),
          ),
        ],
      ),
    ),
  );
}
