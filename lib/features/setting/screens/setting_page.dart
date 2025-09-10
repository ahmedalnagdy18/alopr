import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool darkMood = false;
  String _selectedLang = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        centerTitle: false,
        title: Text(
          "Settings",
          style: AppTexts.regular.copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.help_outline,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Accessibility',
                style: AppTexts.subHeading
                    .copyWith(color: AppColors.paragraphLight),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  SvgPicture.asset("images/dark_mood.svg"),
                  SizedBox(width: 12.w),
                  Text("Dark Mode", style: AppTexts.regular),
                  Spacer(),
                  FlutterSwitch(
                    activeColor: AppColors.primaryLight,
                    inactiveColor: AppColors.paragraphLight,
                    width: 48.r,
                    height: 24.r,
                    toggleSize: 22.r,
                    value: darkMood,
                    padding: 2.r,
                    onToggle: (val) {
                      setState(() {
                        darkMood = val;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              Text(
                'Language',
                style: AppTexts.subHeading
                    .copyWith(color: AppColors.paragraphLight),
              ),
              SizedBox(height: 12.h),
              Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  iconColor: AppColors.black,
                  tilePadding: EdgeInsets.all(0),
                  childrenPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  shape: Border.all(color: Colors.transparent),
                  leading: SvgPicture.asset('images/language.svg'),
                  title: Text("Language", style: AppTexts.regular),
                  children: [
                    _languageWidget(
                      value: "English",
                      onChanged: (val) {
                        setState(() {
                          _selectedLang = val!;
                        });
                      },
                      selectedLang: _selectedLang,
                    ),
                    _languageWidget(
                      value: "Arabic",
                      onChanged: (val) {
                        setState(() {
                          _selectedLang = val!;
                        });
                      },
                      selectedLang: _selectedLang,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                'Account',
                style: AppTexts.subHeading
                    .copyWith(color: AppColors.paragraphLight),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  SvgPicture.asset("images/delete_acc.svg"),
                  SizedBox(width: 12.w),
                  Text(
                    "Delete Account",
                    style: AppTexts.regular.copyWith(color: AppColors.error),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  SvgPicture.asset("images/log_out.svg"),
                  SizedBox(width: 12.w),
                  Text("Log Out", style: AppTexts.regular),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _languageWidget(
    {required dynamic selectedLang,
    required Function(dynamic) onChanged,
    required String value}) {
  return ListTile(
    leading: SizedBox(),
    title: Text(value, style: AppTexts.regular),
    trailing: Radio(
      activeColor: AppColors.primaryLight,
      backgroundColor: WidgetStatePropertyAll(AppColors.white),
      value: value,
      groupValue: selectedLang,
      onChanged: onChanged,
    ),
  );
}
