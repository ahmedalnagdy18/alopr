import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizTestWidget extends StatefulWidget {
  const QuizTestWidget({super.key});

  @override
  State<QuizTestWidget> createState() => _QuizTestWidgetState();
}

class _QuizTestWidgetState extends State<QuizTestWidget> {
  String? quetion1;
  String? quetion2;
  String? quetion3;
  String? quetion4;
  String? quetion5;
  String? quetion6;
  String? quetion7;
  String? quetion8;
  String? quetion9;
  String? quetion10;
  String? quetion11;
  String? quetion12;
  String? quetion13;
  String? quetion14;
  String? quetion15;
  String? quetion16;

  bool isButtonEnable = false;

  bool get isButtonEnabled => [
        quetion1,
        quetion2,
        quetion3,
        quetion4,
        quetion5,
        quetion6,
        quetion7,
        quetion8,
        quetion9,
        quetion10,
        quetion11,
        quetion12,
        quetion13,
        quetion14,
        quetion15,
        quetion16,
      ].every((q) => q != null);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          S.of(context).overallAssessment,
          style: AppTexts.title(context).copyWith(
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              partWidget(context, S.of(context).assessmentTitle1),
              //question 1
              questionWidget(
                context: context,
                groupValue: quetion1,
                onChanged: (value) {
                  setState(() {
                    quetion1 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question1,
              ),
              //question 2
              questionWidget(
                context: context,
                groupValue: quetion2,
                onChanged: (value) {
                  setState(() {
                    quetion2 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question2,
              ),

              //question 3
              questionWidget(
                context: context,
                groupValue: quetion3,
                onChanged: (value) {
                  setState(() {
                    quetion3 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question3,
              ),

              //question 4
              questionWidget(
                context: context,
                groupValue: quetion4,
                onChanged: (value) {
                  setState(() {
                    quetion4 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question4,
              ),
              SizedBox(height: 16.h),
              partWidget(context, S.of(context).assessmentTitle2),

              //question 5
              questionWidget(
                context: context,
                groupValue: quetion5,
                onChanged: (value) {
                  setState(() {
                    quetion5 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question5,
              ),

              //question 6
              questionWidget(
                context: context,
                groupValue: quetion6,
                onChanged: (value) {
                  setState(() {
                    quetion6 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question6,
              ),

              //question 7
              questionWidget(
                context: context,
                groupValue: quetion7,
                onChanged: (value) {
                  setState(() {
                    quetion7 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question7,
              ),

              //question 8
              questionWidget(
                context: context,
                groupValue: quetion8,
                onChanged: (value) {
                  setState(() {
                    quetion8 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question8,
              ),
              SizedBox(height: 16.h),
              partWidget(context, S.of(context).assessmentTitle3),
              //question 9
              questionWidget(
                context: context,
                groupValue: quetion9,
                onChanged: (value) {
                  setState(() {
                    quetion9 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question9,
              ),

              //question 10
              questionWidget(
                context: context,
                groupValue: quetion10,
                onChanged: (value) {
                  setState(() {
                    quetion10 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question10,
              ),

              //question 11
              questionWidget(
                context: context,
                groupValue: quetion11,
                onChanged: (value) {
                  setState(() {
                    quetion11 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question11,
              ),

              //question 12
              questionWidget(
                context: context,
                groupValue: quetion12,
                onChanged: (value) {
                  setState(() {
                    quetion12 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question12,
              ),
              SizedBox(height: 16.h),
              partWidget(context, S.of(context).assessmentTitle4),

              //question 13
              questionWidget(
                context: context,
                groupValue: quetion13,
                onChanged: (value) {
                  setState(() {
                    quetion13 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question13,
              ),
              //question 14
              questionWidget(
                context: context,
                groupValue: quetion14,
                onChanged: (value) {
                  setState(() {
                    quetion14 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question14,
              ),
              //question 15
              questionWidget(
                context: context,
                groupValue: quetion15,
                onChanged: (value) {
                  setState(() {
                    quetion15 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question15,
              ),
              //question 11
              questionWidget(
                context: context,
                groupValue: quetion16,
                onChanged: (value) {
                  setState(() {
                    quetion16 = value;
                    isButtonEnabled;
                  });
                },
                quetion: S.of(context).question16,
              ),
              SizedBox(height: 32.h),
              MainAppButton(
                backgroundColor: !isButtonEnabled ? Colors.grey : null,
                bouttonWidth: double.infinity,
                onPressed: isButtonEnabled ? () {} : null,
                text: S.current.finish,
              ),
              // todo: add the quetions here
            ],
          ),
        ),
      ],
    );
  }
}

Widget _ridoWidget(
    {required BuildContext context,
    required void Function(dynamic) onChanged,
    required groupValue,
    required String value}) {
  final textColor = Theme.of(context).brightness == Brightness.dark
      ? AppColors.headingDark
      : AppColors.headingLight;
  return Row(
    children: [
      Transform.scale(
        scale: 0.8,
        child: SizedBox(
          width: 16.w,
          height: 16.h,
          child: RadioGroup<String>(
              groupValue: groupValue,
              onChanged: onChanged,
              child: Radio(
                activeColor: AppColors.headingLight,
                backgroundColor: WidgetStatePropertyAll(AppColors.white),
                value: value,
              )),
        ),
      ),
      SizedBox(width: 4.w),
      GestureDetector(
        onTap: () => onChanged(value),
        child: Text(
          value,
          style: AppTexts.regular(context).copyWith(
              color: groupValue == value
                  ? textColor
                  : textColor.withValues(alpha: 0.6)),
        ),
      ),
    ],
  );
}

Widget questionWidget({
  required BuildContext context,
  required String quetion,
  required dynamic groupValue,
  required Function(dynamic) onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 16.h),
      Text(
        quetion,
        style: AppTexts.regular(context),
      ),
      SizedBox(height: 8.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ridoWidget(
            context: context,
            onChanged: onChanged,
            groupValue: groupValue,
            value: S.of(context).yes,
          ),
          _ridoWidget(
            context: context,
            onChanged: onChanged,
            groupValue: groupValue,
            value: S.of(context).no,
          ),
          SizedBox(),
        ],
      ),
    ],
  );
}

Widget partWidget(BuildContext context, String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 12.w),
    child: Text(
      "•  $title",
      style: AppTexts.title(context).copyWith(
        fontSize: 14.sp,
      ),
    ),
  );
}
