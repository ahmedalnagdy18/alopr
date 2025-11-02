import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/app_textfield.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/authentication/presentation/cubits/set_new_pass_cubit/set_new_password_cubit.dart';
import 'package:alopr/features/authentication/presentation/screens/verification_successful_page.dart';
import 'package:alopr/features/authentication/presentation/widgets/field_controller_widget.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:alopr/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetNewPasswordPage extends StatelessWidget {
  const SetNewPasswordPage({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetNewPasswordCubit(setNewPasswordUsecase: sl()),
      child: _SetNewPasswordPage(
        email: email,
      ),
    );
  }
}

class _SetNewPasswordPage extends StatefulWidget {
  const _SetNewPasswordPage({required this.email});
  final String email;
  @override
  State<_SetNewPasswordPage> createState() => _SetNewPasswordPageState();
}

class _SetNewPasswordPageState extends State<_SetNewPasswordPage> {
  bool isObscure1 = true;
  bool isObscure2 = true;
  bool firstSeen = true;
  final _password = FieldControl();
  final _confirmPassword = FieldControl();
  final GlobalKey<FormState> _key = GlobalKey();
  bool isButtonEnabled = false;

  @override
  void initState() {
    _password.controller.addListener(_updateButtonState);
    _confirmPassword.controller.addListener(_updateButtonState);
    super.initState();
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = _password.controller.text.isNotEmpty &&
          _confirmPassword.controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.headingDark
        : AppColors.headingLight;
    return BlocConsumer<SetNewPasswordCubit, SetNewPasswordState>(
      listener: (context, state) {
        if (state is SucsessNewPassword) {
          Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(
              builder: (context) => VerificationSuccessfulPage(
                isFromForgetpassword: true,
              ),
            ),
            (Route<dynamic> route) => false,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              S.of(context).setNewPassword,
              style: AppTexts.regular(context).copyWith(
                fontSize: 20.sp,
              ),
            ),
            centerTitle: false,
            iconTheme: IconThemeData(
              size: 24.r,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 36.h),
                    Text(
                      S.of(context).newPassword,
                      style: AppTexts.regular(context).copyWith(
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    AppTextField(
                      focusNode: _password.focus,
                      controller: _password.controller,
                      autovalidateMode: !firstSeen
                          ? AutovalidateMode.onUserInteraction
                          : null,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                      validator: (val) => AuthValidators.password(context, val),
                      obscureText: isObscure1,
                      suffixIcon: InkwellWidget(
                        onTap: () {
                          setState(() {
                            isObscure1 = !isObscure1;
                          });
                        },
                        child: Icon(
                          isObscure1
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 18.r,
                        ),
                      ),
                      hintText: S.of(context).newPassword,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      S.of(context).confirmPassword,
                      style: AppTexts.regular(context).copyWith(
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    AppTextField(
                      focusNode: _confirmPassword.focus,
                      controller: _confirmPassword.controller,
                      autovalidateMode: !firstSeen
                          ? AutovalidateMode.onUserInteraction
                          : null,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                      validator: (val) => AuthValidators.confirmPassword(
                          context, val, _password.controller.text),
                      obscureText: isObscure2,
                      suffixIcon: InkwellWidget(
                        onTap: () {
                          setState(() {
                            isObscure2 = !isObscure2;
                          });
                        },
                        child: Icon(
                          isObscure2
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 18.r,
                        ),
                      ),
                      hintText: S.of(context).reenteryourpassword,
                    ),
                    SizedBox(height: 24.h),
                    MainAppButton(
                      backgroundColor: !isButtonEnabled ? Colors.grey : null,
                      bouttonWidth: double.infinity,
                      onPressed: isButtonEnabled
                          ? () {
                              setState(() {
                                firstSeen = false;
                              });
                              if (_key.currentState!.validate()) {
                                _setNewPassButton(context,
                                    email: widget.email,
                                    newPassword: _password.controller.text);
                              }
                            }
                          : null,
                      text: state is LoadingNewPassword
                          ? S.of(context).loading
                          : S.of(context).resetPassword,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _setNewPassButton(BuildContext context,
      {required String email, required String newPassword}) {
    BlocProvider.of<SetNewPasswordCubit>(context)
        .setNewPassword(email: email, newPassword: newPassword);
  }
}
