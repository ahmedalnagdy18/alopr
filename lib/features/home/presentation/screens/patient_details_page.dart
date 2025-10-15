import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/app_textfield.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/home/domain/entity/model/user_data_model.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientDetailsPage extends StatefulWidget {
  const PatientDetailsPage({super.key, required this.patient});
  final UserDataModel patient;
  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  String? gender;
  String? haveDiseases;
  String? havepregnant;
  bool firstSeen = true;
  bool isButtonEnabled = false;

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _conditionController = TextEditingController();
  final _specifyController = TextEditingController();

  @override
  void initState() {
    final profile = widget.patient.completedProfile;
    _nameController.text = profile?.caregiver ?? "";
    _phoneController.text = profile?.caregiverNumber ?? "";
    _conditionController.text = profile?.condition ?? "";
    _specifyController.text = profile?.specify ?? "";

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final profile = widget.patient.completedProfile;

    gender =
        profile?.gender == "Male" ? S.of(context).male : S.of(context).female;
    haveDiseases =
        (profile?.hasDiseases == true) ? S.of(context).yes : S.of(context).no;

    havepregnant = (profile?.pregnantStatus == true)
        ? S.of(context).yes
        : S.of(context).no;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          S.of(context).patientDetails,
          style: AppTexts.regular(context).copyWith(
            fontSize: 20.sp,
          ),
        ),
        centerTitle: false,
        iconTheme: IconThemeData(
          size: 24.r,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).patientDetailsSubTitle,
                  style: AppTexts.regular(context),
                ),
                SizedBox(height: 16.h),
                Text(
                  S.of(context).caregiverName,
                  style: AppTexts.paragraph(context),
                ),
                SizedBox(height: 8.h),
                AppTextField(
                  fillColor: AppColors.paragraphDark,
                  controller: _nameController,
                  readOnly: true,
                  hintFontSize: 10.sp,
                  hintText: S.of(context).caregiverField,
                ),
                SizedBox(height: 12.h),
                Text(
                  S.of(context).caregiverPhoneNumber,
                  style: AppTexts.paragraph(context),
                ),
                SizedBox(height: 8.h),
                AppTextField(
                  fillColor: AppColors.paragraphDark,
                  controller: _phoneController,
                  readOnly: true,
                  hintFontSize: 10.sp,
                  hintText: S.of(context).phoneNumber,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12.h),
                Text(
                  S.of(context).condition,
                  style: AppTexts.paragraph(context),
                ),
                SizedBox(height: 8.h),
                AppTextField(
                  fillColor: AppColors.paragraphDark,
                  controller: _conditionController,
                  readOnly: true,
                  hintFontSize: 10.sp,
                  hintText: S.of(context).conditionField,
                ),
                SizedBox(height: 12.h),
                Text(
                  S.of(context).gender,
                  style: AppTexts.paragraph(context),
                ),
                SizedBox(height: 8.h),
                _ridoWidget(
                  context: context,
                  onChanged: (val) {},
                  groupValue: gender,
                  value: S.of(context).male,
                ),
                SizedBox(height: 8.h),
                _ridoWidget(
                  context: context,
                  onChanged: (val) {},
                  groupValue: gender,
                  value: S.of(context).female,
                ),
                SizedBox(height: 12.h),
                Text(
                  S.of(context).doYouHaveChronicDiseases,
                  style: AppTexts.paragraph(context),
                ),
                SizedBox(height: 8.h),
                _ridoWidget(
                  context: context,
                  onChanged: (val) {},
                  groupValue: haveDiseases,
                  value: S.of(context).yes,
                ),
                SizedBox(height: 8.h),
                _ridoWidget(
                  context: context,
                  onChanged: (val) {},
                  groupValue: haveDiseases,
                  value: S.of(context).no,
                ),
                if (haveDiseases == S.of(context).yes) ...[
                  SizedBox(height: 8.h),
                  AppTextField(
                    fillColor: AppColors.paragraphDark,
                    controller: _specifyController,
                    readOnly: true,
                    hintFontSize: 10.sp,
                    hintText: S.of(context).specify,
                  ),
                ],
                SizedBox(height: 12.h),
                Text(
                  S.of(context).areYouPregnant,
                  style: AppTexts.paragraph(context),
                ),
                SizedBox(height: 8.h),
                _ridoWidget(
                  context: context,
                  onChanged: (val) {},
                  groupValue: havepregnant,
                  value: S.of(context).yes,
                ),
                SizedBox(height: 8.h),
                _ridoWidget(
                  context: context,
                  onChanged: (val) {},
                  groupValue: havepregnant,
                  value: S.of(context).no,
                ),
              ],
            ),
          ),
        ),
      ),
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
        scale: 0.6,
        child: SizedBox(
          width: 16.w,
          height: 16.h,
          child: RadioGroup<String>(
              groupValue: groupValue,
              onChanged: onChanged,
              child: Radio(
                // enabled: false,
                activeColor: AppColors.headingLight,
                backgroundColor:
                    WidgetStatePropertyAll(AppColors.paragraphDark),
                value: value,
              )),
        ),
      ),
      SizedBox(width: 4.w),
      Text(
        value,
        style: AppTexts.paragraph(context).copyWith(
            fontSize: 10.sp,
            color: groupValue == value
                ? textColor
                : textColor.withValues(alpha: 0.6)),
      ),
    ],
  );
}
