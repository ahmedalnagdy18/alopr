import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/home/presentation/screens/on_complete_page.dart';
import 'package:alopr/features/home/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationSuccessfulPage extends StatelessWidget {
  const VerificationSuccessfulPage({super.key, required this.role});
  final String role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("images/sucsess.svg"),
                      SizedBox(height: 16.h),
                      Text(
                        "Verification Successful!",
                        style: AppTexts.title(context).copyWith(
                          fontSize: 24.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        'Your email has been verified. Welcome to ALOPR!',
                        style: AppTexts.regular(context),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.r),
                  child: MainAppButton(
                      bouttonWidth: double.infinity,
                      onPressed: () {
                        if (role == "doctor") {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage(
                              role: role,
                            ),
                          ));
                        } else if (role == "patient") {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OnCompletePage(
                              role: role,
                            ),
                          ));
                        }
                      },
                      text: 'Continue to Home'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
