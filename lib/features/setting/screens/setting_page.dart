// ignore_for_file: deprecated_member_use

import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/setting/cubits/theme_cubit/theme_cubit.dart';
import 'package:alopr/features/setting/cubits/theme_cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.paragraphDark
        : AppColors.paragraphLight;
    final appBarTextColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.headingDark
        : AppColors.headingLight;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        title: Text(
          "Settings",
          style: AppTexts.regular(context)
              .copyWith(fontSize: 20.sp, color: appBarTextColor),
        ),
        actions: [
          IconButton(
            highlightColor: Colors.transparent,
            onPressed: () {},
            icon: Icon(
              Icons.help_outline,
              color: textColor,
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
                style: AppTexts.subHeading(context).copyWith(color: textColor),
              ),
              SizedBox(height: 16.h),
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      SvgPicture.asset("images/dark_mood.svg"),
                      SizedBox(width: 12.w),
                      Text("Dark Mode", style: AppTexts.regular(context)),
                      Spacer(),
                      FlutterSwitch(
                        activeColor: AppColors.primaryLight,
                        inactiveColor: AppColors.paragraphLight,
                        width: 48.r,
                        height: 24.r,
                        toggleSize: 22.r,
                        value: state.isDarkTheme,
                        padding: 2.r,
                        onToggle: (val) {
                          context.read<ThemeCubit>().toggleTheme();
                        },
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 18.h),
              Text(
                'Language',
                style: AppTexts.subHeading(context).copyWith(color: textColor),
              ),
              SizedBox(height: 12.h),
              Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  iconColor: textColor,
                  tilePadding: EdgeInsets.all(0),
                  childrenPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  shape: Border.all(color: Colors.transparent),
                  leading: SvgPicture.asset('images/language.svg'),
                  title: Text("Language", style: AppTexts.regular(context)),
                  children: [
                    _languageWidget(
                      context: context,
                      value: "English",
                      onChanged: (val) {
                        setState(() {
                          _selectedLang = val!;
                        });
                      },
                      selectedLang: _selectedLang,
                    ),
                    _languageWidget(
                      context: context,
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
                style: AppTexts.subHeading(context).copyWith(color: textColor),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  SvgPicture.asset("images/delete_acc.svg"),
                  SizedBox(width: 12.w),
                  Text(
                    "Delete Account",
                    style: AppTexts.regular(context)
                        .copyWith(color: AppColors.error),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  SvgPicture.asset("images/log_out.svg"),
                  SizedBox(width: 12.w),
                  Text("Log Out", style: AppTexts.regular(context)),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 12.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Terms and Conditions',
                  style: AppTexts.subHeading(context)
                      .copyWith(color: textColor.withValues(alpha: 0.8))),
              Text(
                'From Alzheimer’s Prediction',
                style: TextStyle(
                  color: textColor.withValues(alpha: 0.5),
                  fontWeight: FontWeight.w300,
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _languageWidget(
    {required BuildContext context,
    required dynamic selectedLang,
    required Function(dynamic) onChanged,
    required String value}) {
  return ListTile(
    leading: SizedBox(),
    title: Text(value, style: AppTexts.regular(context)),
    trailing: Radio(
      activeColor: AppColors.primaryLight,
      backgroundColor: WidgetStatePropertyAll(AppColors.white),
      value: value,
      groupValue: selectedLang,
      onChanged: onChanged,
    ),
  );
}
