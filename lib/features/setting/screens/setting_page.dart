// ignore_for_file: deprecated_member_use

import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/core/shared_prefrances/shared_prefrances.dart';
import 'package:alopr/features/authentication/presentation/screens/login_page.dart';
import 'package:alopr/features/setting/cubits/language_cubit/local_cubit.dart';
import 'package:alopr/features/setting/cubits/language_cubit/local_state.dart';
import 'package:alopr/features/setting/cubits/theme_cubit/theme_cubit.dart';
import 'package:alopr/features/setting/cubits/theme_cubit/theme_state.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
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
  String? _selectedLang;

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
          S.of(context).settings,
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
                S.of(context).accessibility,
                style: AppTexts.subHeading(context).copyWith(color: textColor),
              ),
              SizedBox(height: 16.h),
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      SvgPicture.asset("images/dark_mood.svg"),
                      SizedBox(width: 12.w),
                      Text(S.of(context).darkMode,
                          style: AppTexts.regular(context)),
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
                S.of(context).language,
                style: AppTexts.subHeading(context).copyWith(color: textColor),
              ),
              SizedBox(height: 12.h),
              Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: BlocConsumer<LocaleCubit, ChangeLocaleState>(
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          S.of(context).langSnakBar,
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.grey.shade800,
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  builder: (context, state) {
                    _selectedLang = state.locale.languageCode == "ar"
                        ? S.of(context).arabic
                        : S.of(context).english;
                    return ExpansionTile(
                      iconColor: textColor,
                      tilePadding: EdgeInsets.all(0),
                      childrenPadding: EdgeInsets.symmetric(horizontal: 10.w),
                      shape: Border.all(color: Colors.transparent),
                      leading: SvgPicture.asset('images/language.svg'),
                      title: Text(S.of(context).language,
                          style: AppTexts.regular(context)),
                      children: [
                        _languageWidget(
                          context: context,
                          value: S.of(context).english,
                          onChanged: (val) {
                            setState(() {
                              _selectedLang = val!;
                            });
                            context.read<LocaleCubit>().changeLanguage("en");
                          },
                          selectedLang: _selectedLang,
                        ),
                        _languageWidget(
                          context: context,
                          value: S.of(context).arabic,
                          onChanged: (val) {
                            setState(() {
                              _selectedLang = val!;
                            });
                            context.read<LocaleCubit>().changeLanguage("ar");
                          },
                          selectedLang: _selectedLang,
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                S.of(context).account,
                style: AppTexts.subHeading(context).copyWith(color: textColor),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  SvgPicture.asset("images/delete_acc.svg"),
                  SizedBox(width: 12.w),
                  Text(
                    S.of(context).deleteAccount,
                    style: AppTexts.regular(context)
                        .copyWith(color: AppColors.error),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              InkwellWidget(
                onTap: () async {
                  await SharedPrefrance.instanc.removeRegisterId();
                  await SharedPrefrance.instanc.removeUserRole();

                  if (context.mounted) {
                    Navigator.of(context).pushAndRemoveUntil(
                      CupertinoPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  }
                },
                child: Row(
                  children: [
                    SvgPicture.asset("images/log_out.svg"),
                    SizedBox(width: 12.w),
                    Text(S.of(context).logOut,
                        style: AppTexts.regular(context)),
                  ],
                ),
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
              Text(S.of(context).termsAndConditions,
                  style: AppTexts.subHeading(context)
                      .copyWith(color: textColor.withValues(alpha: 0.8))),
              Text(
                S.of(context).fromAlzheimersPrediction,
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
