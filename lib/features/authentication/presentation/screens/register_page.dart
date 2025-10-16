import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/common/app_textfield.dart';
import 'package:alopr/core/extentions/app_extentions.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/authentication/domain/entity/register_input.dart';
import 'package:alopr/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:alopr/features/authentication/presentation/screens/login_page.dart';
import 'package:alopr/features/authentication/presentation/screens/otp_page.dart';
import 'package:alopr/features/authentication/presentation/widgets/field_controller_widget.dart';
import 'package:alopr/features/authentication/presentation/widgets/title_widget.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:alopr/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(registerUsecase: sl()),
      child: _RegisterPage(),
    );
  }
}

class _RegisterPage extends StatefulWidget {
  const _RegisterPage();

  @override
  State<_RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<_RegisterPage> {
  int selectRole = 0;
  bool isObscure1 = true;
  bool isObscure2 = true;
  final GlobalKey<FormState> _key = GlobalKey();
  bool firstSeen = true;
  bool isButtonEnabled = false;
  String? role;

  final _fullName = FieldControl();
  final _email = FieldControl();
  final _phone = FieldControl();
  final _password = FieldControl();
  final _confirmPassword = FieldControl();

  @override
  void initState() {
    _fullName.controller.addListener(_updateButtonState);
    _email.controller.addListener(_updateButtonState);
    _phone.controller.addListener(_updateButtonState);
    _password.controller.addListener(_updateButtonState);
    _confirmPassword.controller.addListener(_updateButtonState);
    super.initState();
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = _fullName.controller.text.isNotEmpty &&
          _email.controller.text.isNotEmpty &&
          _phone.controller.text.isNotEmpty &&
          _password.controller.text.isNotEmpty &&
          _confirmPassword.controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.headingDark
        : AppColors.headingLight;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TitleWidget(
                        title: S.of(context).getStartedwithALOPR,
                        subTitle: S.of(context).createyouraccount,
                        selectRole: selectRole,
                        followerOnTap: () {
                          setState(() {
                            selectRole = 0;
                          });
                        },
                        patientOnTap: () {
                          setState(() {
                            selectRole = 1;
                          });
                        },
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        child: Form(
                          key: _key,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).fullName,
                                style: AppTexts.regular(context).copyWith(
                                  color: textColor,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              AppTextField(
                                focusNode: _fullName.focus,
                                controller: _fullName.controller,
                                inputFormatters: [
                                  PreventStartingSpaceInputFormatter(),
                                ],
                                autovalidateMode: !firstSeen
                                    ? AutovalidateMode.onUserInteraction
                                    : null,
                                validator: (val) =>
                                    AuthValidators.fullName(context, val),
                                hintText: S.of(context).enteryourfullname,
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                S.of(context).email,
                                style: AppTexts.regular(context).copyWith(
                                  color: textColor,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              AppTextField(
                                focusNode: _email.focus,
                                controller: _email.controller,
                                autovalidateMode: !firstSeen
                                    ? AutovalidateMode.onUserInteraction
                                    : null,
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                ],
                                validator: (val) =>
                                    AuthValidators.email(context, val),
                                hintText: S.of(context).pleaseEnterValidEmail,
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                S.of(context).phoneNumber,
                                style: AppTexts.regular(context).copyWith(
                                  color: textColor,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              AppTextField(
                                focusNode: _phone.focus,
                                controller: _phone.controller,
                                maxLength: 11,
                                counterText: '',
                                keyboardType: TextInputType.number,
                                autovalidateMode: !firstSeen
                                    ? AutovalidateMode.onUserInteraction
                                    : null,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                validator: (val) =>
                                    AuthValidators.phone(context, val),
                                hintText: S.of(context).enterYourPhoneNumber,
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                S.of(context).password,
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
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                ],
                                validator: (val) =>
                                    AuthValidators.password(context, val),
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
                                hintText: S.of(context).enterYourPassword,
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
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                ],
                                validator: (val) =>
                                    AuthValidators.confirmPassword(context, val,
                                        _password.controller.text),
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
                              SizedBox(height: 12.h),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MainAppButton(
                    backgroundColor: !isButtonEnabled ? Colors.grey : null,
                    bouttonWidth: double.infinity,
                    onPressed: isButtonEnabled
                        ? () {
                            setState(() {
                              firstSeen = false;
                            });
                            if (_key.currentState!.validate()) {
                              //   _registerButton(context);
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<RegisterCubit>(),
                                    child: OtpPage(
                                      role: selectRole == 0
                                          ? role = "doctor"
                                          : "patient",
                                      registerInput: RegisterInput(
                                        id: "",
                                        fullName: _fullName.controller.text,
                                        email: _email.controller.text,
                                        phone: _phone.controller.text,
                                        password: _password.controller.text,
                                        role: selectRole == 0
                                            ? role = "doctor"
                                            : "patient",
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          }
                        : null,
                    text: S.of(context).createAccount,
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).iAlreadyHaveAccount,
                        style: AppTexts.regular(context)
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(width: 4),
                      InkwellWidget(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          S.of(context).login,
                          style: AppTexts.regular(context)
                              .copyWith(color: AppColors.buttonLight),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          resizeToAvoidBottomInset: true,
        );
      },
    );
  }
}
