import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/app_textfield.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/extentions/app_extentions.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/core/shared_prefrances/shared_prefrances.dart';
import 'package:alopr/features/home/domain/entity/inputs/complete_profile_input.dart';
import 'package:alopr/features/home/presentation/cubits/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:alopr/features/home/presentation/screens/home_page.dart';
import 'package:alopr/features/home/presentation/widgets/complete_page_validator.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:alopr/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnCompletePage extends StatelessWidget {
  const OnCompletePage({super.key, required this.role});
  final String role;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompleteProfileCubit(completeProfileUsecase: sl()),
      child: _OnCompletePage(
        role: role,
      ),
    );
  }
}

class _OnCompletePage extends StatefulWidget {
  const _OnCompletePage({required this.role});
  final String role;
  @override
  State<_OnCompletePage> createState() => _OnCompletePageState();
}

class _OnCompletePageState extends State<_OnCompletePage> {
  String? gender;
  String? haveDiseases;
  String? havepregnant;
  bool firstSeen = true;
  bool isButtonEnabled = false;

  final GlobalKey<FormState> _key = GlobalKey();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _conditionController = TextEditingController();
  final _specifyController = TextEditingController();

  @override
  void initState() {
    gender = S.current.male;
    haveDiseases = S.current.no;
    havepregnant = S.current.no;

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
          (haveDiseases == S.of(context).yes
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
    return BlocConsumer<CompleteProfileCubit, CompleteProfileState>(
      listener: (context, state) {
        if (state is SuccessCompleteProfile) {
          Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(
              builder: (context) => HomePage(
                role: widget.role,
              ),
            ),
            (Route<dynamic> route) => false,
          );
        }
      },
      builder: (context, state) {
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
                        S.of(context).completeYourProfile,
                        style:
                            AppTexts.title(context).copyWith(fontSize: 24.sp),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        S.of(context).completeProfileSubTitle,
                        style: AppTexts.regular(context),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        S.of(context).caregiverName,
                        style: AppTexts.paragraph(context),
                      ),
                      SizedBox(height: 8.h),
                      AppTextField(
                        controller: _nameController,
                        validator: (val) =>
                            CompletePageValidator.name(context, val),
                        autovalidateMode: !firstSeen
                            ? AutovalidateMode.onUserInteraction
                            : null,
                        hintFontSize: 10.sp,
                        hintText: S.of(context).caregiverField,
                        inputFormatters: [
                          PreventStartingSpaceInputFormatter(),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        S.of(context).caregiverPhoneNumber,
                        style: AppTexts.paragraph(context),
                      ),
                      SizedBox(height: 8.h),
                      AppTextField(
                        controller: _phoneController,
                        validator: (val) =>
                            CompletePageValidator.phone(context, val),
                        autovalidateMode: !firstSeen
                            ? AutovalidateMode.onUserInteraction
                            : null,
                        hintFontSize: 10.sp,
                        hintText: S.of(context).phoneNumber,
                        keyboardType: TextInputType.number,
                        maxLength: 11,
                        counterText: '',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        S.of(context).condition,
                        style: AppTexts.paragraph(context),
                      ),
                      SizedBox(height: 8.h),
                      AppTextField(
                        controller: _conditionController,
                        validator: (val) =>
                            CompletePageValidator.condition(context, val),
                        autovalidateMode: !firstSeen
                            ? AutovalidateMode.onUserInteraction
                            : null,
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
                        onChanged: (val) {
                          setState(() {
                            gender = val!;
                          });
                        },
                        groupValue: gender,
                        value: S.of(context).male,
                      ),
                      SizedBox(height: 8.h),
                      _ridoWidget(
                        context: context,
                        onChanged: (val) {
                          setState(() {
                            gender = val!;
                          });
                        },
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
                        onChanged: (val) {
                          setState(() {
                            haveDiseases = val!;
                            _updateButtonState();
                          });
                        },
                        groupValue: haveDiseases,
                        value: S.of(context).yes,
                      ),
                      SizedBox(height: 8.h),
                      _ridoWidget(
                        context: context,
                        onChanged: (val) {
                          setState(() {
                            haveDiseases = val!;
                            _specifyController.clear();
                            _updateButtonState();
                          });
                        },
                        groupValue: haveDiseases,
                        value: S.of(context).no,
                      ),
                      if (haveDiseases == S.of(context).yes) ...[
                        SizedBox(height: 8.h),
                        AppTextField(
                          controller: _specifyController,
                          validator: (val) =>
                              CompletePageValidator.specify(context, val),
                          autovalidateMode: !firstSeen
                              ? AutovalidateMode.onUserInteraction
                              : null,
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
                        onChanged: (val) {
                          setState(() {
                            havepregnant = val!;
                          });
                        },
                        groupValue: havepregnant,
                        value: S.of(context).yes,
                      ),
                      SizedBox(height: 8.h),
                      _ridoWidget(
                        context: context,
                        onChanged: (val) {
                          setState(() {
                            havepregnant = val!;
                          });
                        },
                        groupValue: havepregnant,
                        value: S.of(context).no,
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
              padding: EdgeInsets.only(left: 16.r, right: 16.r, bottom: 24.r),
              onPressed: isButtonEnabled
                  ? () {
                      setState(() {
                        firstSeen = false;
                      });
                      if (_key.currentState!.validate()) {
                        _finshButton(context);
                      }
                    }
                  : null,
              text: state is LoadingCompleteProfile
                  ? S.of(context).loading
                  : S.of(context).finish,
            ),
          ),
        );
      },
    );
  }

  void _finshButton(BuildContext context) async {
    final prefs = SharedPrefrance.instanc;
    final registerId = await prefs.getRegisterId();

    if (registerId == null || registerId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User ID not found. Please login again.')),
      );
      return;
    }

    BlocProvider.of<CompleteProfileCubit>(context).completeProfileFuc(
      input: CompleteProfileInput(
        id: "",
        caregiver: _nameController.text,
        caregiverNumber: _phoneController.text,
        condition: _conditionController.text,
        gender: gender == S.current.male ? "Male" : "Female",
        hasDiseases: haveDiseases == S.current.no ? false : true,
        pregnantStatus: havepregnant == S.current.no ? false : true,
        specify: _specifyController.text,
        registerId: registerId,
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
