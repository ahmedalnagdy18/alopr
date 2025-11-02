import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              constraints: BoxConstraints(
                maxHeight: 200.h,
                minWidth: double.infinity,
              ),
              child: SvgPicture.asset("images/no_internet.svg")),
          SizedBox(height: 12.h),
          Text(
            S.of(context).noInternetConnection,
            style: AppTexts.heading(context),
          ),
          SizedBox(height: 8.h),
          Text(
            S.of(context).pleaseCheckYourInternet,
            style: AppTexts.regular(context),
          ),
        ],
      ),
    );
  }
}
