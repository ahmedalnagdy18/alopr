import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/home/presentation/widgets/doctor_widget.dart';
import 'package:alopr/features/home/presentation/widgets/patient_widget.dart';
import 'package:alopr/features/setting/screens/setting_page.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.role});
  final String role;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List patientList = [];

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
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.role == "doctor"
                                ? S.of(context).welcomeToAloprFollowerDashboard
                                : S.of(context).welcomeToALOPR,
                            style: AppTexts.title(context).copyWith(
                              fontSize: 24.sp,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 4.r,
                              left: Directionality.of(context) ==
                                      TextDirection.rtl
                                  ? 0.r
                                  : 40.r),
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
                    if (widget.role == "patient") ...[
                      PatientWidget(),
                    ],
                    if (widget.role == "doctor") ...[
                      (patientList.isEmpty || patientList == [])
                          ? EmptyDoctorWidget()
                          : DoctorWidget(),
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
