import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/setting/screens/setting_page.dart';
import 'package:flutter/cupertino.dart';
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
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.headingDark
        : AppColors.headingLight;
    return Stack(
      alignment: Directionality.of(context) == TextDirection.rtl
          ? Alignment.bottomLeft
          : Alignment.bottomRight,
      children: [
        Scaffold(
          backgroundColor: widget.isQueez == false
              ? Theme.of(context).scaffoldBackgroundColor
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
                            style: AppTexts.title(context).copyWith(
                              fontSize: 24.sp,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.r),
                          child: InkwellWidget(
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) => const SettingPage(),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.settings_outlined,
                              color: textColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      widget.subTitle,
                      style: AppTexts.regular(context).copyWith(
                        color: textColor,
                      ),
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
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: SvgPicture.asset("images/ai_icon.svg"),
          ),
        ),
      ],
    );
  }
}
