import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/authentication/presentation/screens/login_page.dart';
import 'package:alopr/features/home/presentation/screens/on_complete_page.dart';
import 'package:alopr/features/home/presentation/screens/home_page.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationSuccessfulPage extends StatelessWidget {
  const VerificationSuccessfulPage(
      {super.key, this.role, required this.isFromForgetpassword});
  final String? role;
  final bool isFromForgetpassword;
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
                        S.of(context).verificationSuccessful,
                        style: AppTexts.title(context).copyWith(
                          fontSize: 24.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        isFromForgetpassword == true
                            ? S.of(context).passwordChanged
                            : S.of(context).verifiedMessage,
                        style: AppTexts.regular(context),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 14.r),
                  child: MainAppButton(
                    bouttonWidth: double.infinity,
                    onPressed: () {
                      if (isFromForgetpassword == true) {
                        Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      }
                      if (role == "doctor") {
                        Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(
                            builder: (context) => HomePage(
                              role: role ?? "doctor",
                            ),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      } else if (role == "patient") {
                        Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(
                            builder: (context) => OnCompletePage(
                              role: role ?? "patient",
                            ),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      }
                    },
                    text: isFromForgetpassword == true
                        ? S.of(context).ok
                        : S.of(context).continueToHome,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
