import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/setting/screens/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UploadPage extends StatefulWidget {
  const UploadPage(
      {super.key,
      required this.title,
      required this.subTitle,
      this.buttonName,
      required this.isQueez});
  final String title;
  final String subTitle;
  final String? buttonName;
  final bool isQueez;
  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.bottomRight,
      children: [
        Scaffold(
          backgroundColor: widget.isQueez == false
              ? AppColors.backgroundLight
              : const Color.fromARGB(255, 250, 201, 201),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            style: AppTexts.title.copyWith(
                              fontSize: 24.sp,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.r),
                          child: InkwellWidget(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SettingPage(),
                              ));
                            },
                            child: Icon(
                              Icons.settings_outlined,
                              color: AppColors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      widget.subTitle,
                      style: AppTexts.regular,
                      textAlign: TextAlign.start,
                    ),
                    if (widget.isQueez == false) ...[
                      SizedBox(height: 36.h),
                      MainAppButton(
                        onPressed: () {},
                        text: widget.buttonName,
                        icon: Icon(Icons.file_upload_outlined),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SvgPicture.asset("images/ai_icon.svg"),
          ),
        ),
      ],
    );
  }
}
