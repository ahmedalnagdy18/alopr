import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/home/presentation/widgets/quiz_test_widget.dart';
import 'package:alopr/features/setting/screens/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizPageAppbarWidget extends StatefulWidget {
  const QuizPageAppbarWidget(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  State<QuizPageAppbarWidget> createState() => _QuizPageAppbarWidgetState();
}

class _QuizPageAppbarWidgetState extends State<QuizPageAppbarWidget> {
  bool showAppBar = false;
  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.headingDark
        : AppColors.headingLight;
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        setState(() {
          showAppBar = scrollInfo.metrics.pixels >
              80; // show appbar after scroll down 80px
        });
        return false;
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: SafeArea(
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
                    const QuizTestWidget(),
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: showAppBar ? 0 : -100,
            left: 0,
            right: 0,
            child: AppBar(
              elevation: 0.5,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                widget.title,
                style: AppTexts.title(context).copyWith(
                  fontSize: 18.sp,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              actions: [
                InkwellWidget(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const SettingPage(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Icon(
                      Icons.settings_outlined,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
