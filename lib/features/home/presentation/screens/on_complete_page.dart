import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/app_textfield.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/extentions/app_extentions.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/home/presentation/screens/home_page.dart';
import 'package:alopr/features/home/presentation/widgets/complete_page_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnCompletePage extends StatefulWidget {
  const OnCompletePage({super.key, required this.role});
  final String role;
  @override
  State<OnCompletePage> createState() => _OnCompletePageState();
}

class _OnCompletePageState extends State<OnCompletePage> {
  String _gender = "Male";
  String _haveDiseases = "No";
  String _havepregnant = "No";
  bool firstSeen = true;
  bool isButtonEnabled = false;

  final GlobalKey<FormState> _key = GlobalKey();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _conditionController = TextEditingController();
  final _specifyController = TextEditingController();

  @override
  void initState() {
    _nameController.addListener(_updateButtonState);
    _phoneController.addListener(_updateButtonState);
    _conditionController.addListener(_updateButtonState);
    _specifyController.addListener(_updateButtonState);
    super.initState();
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = _nameController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty &&
          _conditionController.text.isNotEmpty &&
          (_haveDiseases == "Yes"
              ? _specifyController.text.isNotEmpty
              : _specifyController.text.isEmpty);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _conditionController.dispose();
    _specifyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 19.h),
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Complete Your Profile',
                    style: AppTexts.title(context).copyWith(fontSize: 24.sp),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Please provide the following details to personalise your ALOPR experience.',
                    style: AppTexts.regular(context),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Caregiver Name',
                    style: AppTexts.paragraph(context),
                  ),
                  SizedBox(height: 8.h),
                  AppTextField(
                    controller: _nameController,
                    validator: CompletePageValidator.name,
                    autovalidateMode:
                        !firstSeen ? AutovalidateMode.onUserInteraction : null,
                    hintFontSize: 10.sp,
                    hintText: "Name of the person taking care of the patient",
                    inputFormatters: [
                      PreventStartingSpaceInputFormatter(),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Caregiver Phone Number',
                    style: AppTexts.paragraph(context),
                  ),
                  SizedBox(height: 8.h),
                  AppTextField(
                    controller: _phoneController,
                    validator: CompletePageValidator.phone,
                    autovalidateMode:
                        !firstSeen ? AutovalidateMode.onUserInteraction : null,
                    hintFontSize: 10.sp,
                    hintText: "Phone Number",
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                    counterText: '',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Condition',
                    style: AppTexts.paragraph(context),
                  ),
                  SizedBox(height: 8.h),
                  AppTextField(
                    controller: _conditionController,
                    validator: CompletePageValidator.condation,
                    autovalidateMode:
                        !firstSeen ? AutovalidateMode.onUserInteraction : null,
                    hintFontSize: 10.sp,
                    hintText:
                        "e.g., Mild memory loss, Moderate Alzheimer’s, Advanced Alzheimer’s",
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Gender',
                    style: AppTexts.paragraph(context),
                  ),
                  SizedBox(height: 8.h),
                  _ridoWidget(
                    context: context,
                    onChanged: (val) {
                      setState(() {
                        _gender = val!;
                      });
                    },
                    groupValue: _gender,
                    value: 'Male',
                  ),
                  SizedBox(height: 8.h),
                  _ridoWidget(
                    context: context,
                    onChanged: (val) {
                      setState(() {
                        _gender = val!;
                      });
                    },
                    groupValue: _gender,
                    value: 'Female',
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Do you have chronic diseases ?',
                    style: AppTexts.paragraph(context),
                  ),
                  SizedBox(height: 8.h),
                  _ridoWidget(
                    context: context,
                    onChanged: (val) {
                      setState(() {
                        _haveDiseases = val!;
                        _updateButtonState();
                      });
                    },
                    groupValue: _haveDiseases,
                    value: 'Yes',
                  ),
                  SizedBox(height: 8.h),
                  _ridoWidget(
                    context: context,
                    onChanged: (val) {
                      setState(() {
                        _haveDiseases = val!;
                        _updateButtonState();
                      });
                    },
                    groupValue: _haveDiseases,
                    value: 'No',
                  ),
                  if (_haveDiseases == "Yes") ...[
                    SizedBox(height: 8.h),
                    AppTextField(
                      controller: _specifyController,
                      validator: CompletePageValidator.specify,
                      autovalidateMode: !firstSeen
                          ? AutovalidateMode.onUserInteraction
                          : null,
                      hintFontSize: 10.sp,
                      hintText: "specify",
                    ),
                  ],
                  SizedBox(height: 12.h),
                  Text(
                    'Are you pregnant ?',
                    style: AppTexts.paragraph(context),
                  ),
                  SizedBox(height: 8.h),
                  _ridoWidget(
                    context: context,
                    onChanged: (val) {
                      setState(() {
                        _havepregnant = val!;
                      });
                    },
                    groupValue: _havepregnant,
                    value: 'Yes',
                  ),
                  SizedBox(height: 8.h),
                  _ridoWidget(
                    context: context,
                    onChanged: (val) {
                      setState(() {
                        _havepregnant = val!;
                      });
                    },
                    groupValue: _havepregnant,
                    value: 'No',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: MainAppButton(
          backgroundColor: !isButtonEnabled ? Colors.grey : null,
          padding: EdgeInsets.only(left: 16.r, right: 16.r, bottom: 4.r),
          onPressed: isButtonEnabled
              ? () {
                  setState(() {
                    firstSeen = false;
                  });
                  if (_key.currentState!.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage(
                        role: widget.role,
                      ),
                    ));
                  }
                }
              : null,
          text: 'Finish',
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
          style: AppTexts.paragraph(context).copyWith(
              fontSize: 10.sp,
              color: groupValue == value
                  ? textColor
                  : textColor.withValues(alpha: 0.6)),
        ),
      ),
    ],
  );
}
