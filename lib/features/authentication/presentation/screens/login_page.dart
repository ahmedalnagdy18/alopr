import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/app_textfield.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/extentions/app_extentions.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/authentication/domain/entity/login_input.dart';
import 'package:alopr/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:alopr/features/authentication/presentation/screens/register_page.dart';
import 'package:alopr/features/authentication/presentation/widgets/field_controller_widget.dart';
import 'package:alopr/features/authentication/presentation/widgets/title_widget.dart';
import 'package:alopr/features/home/presentation/screens/home_page.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:alopr/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(loginUsecase: sl()),
      child: _LoginPage(),
    );
  }
}

class _LoginPage extends StatefulWidget {
  const _LoginPage();

  @override
  State<_LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<_LoginPage> {
  bool isObscure = true;
  int selectRole = 0;
  final GlobalKey<FormState> _key = GlobalKey();
  bool firstSeen = true;
  bool isButtonEnabled = false;

  final _email = FieldControl();
  final _password = FieldControl();

  @override
  void initState() {
    _email.controller.addListener(_updateButtonState);
    _password.controller.addListener(_updateButtonState);
    super.initState();
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = _email.controller.text.isNotEmpty &&
          _password.controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.headingDark
        : AppColors.headingLight;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSucsess) {
          Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(
              builder: (context) => HomePage(
                role: selectRole == 0 ? "doctor" : "patient",
              ),
            ),
            (Route<dynamic> route) => false,
          );
        }
        if (state is LoginError) {
          showErrorToastMessage(message: state.message);
          print(state.message);
        }
      },
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
                        title: S.of(context).welcomeBack,
                        subTitle: S.of(context).logInToALOPR,
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
                                hintText: S.of(context).email,
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
                                obscureText: isObscure,
                                suffixIcon: InkwellWidget(
                                  onTap: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                  child: Icon(
                                    isObscure
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    size: 18.r,
                                  ),
                                ),
                                hintText: S.of(context).enterYourPassword,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                S.of(context).forgotPassword,
                                style: AppTexts.regular(context).copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 10.sp,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.grey.shade600,
                                ),
                              ),
                              SizedBox(height: 24.h),
                              MainAppButton(
                                backgroundColor:
                                    !isButtonEnabled ? Colors.grey : null,
                                bouttonWidth: double.infinity,
                                onPressed: isButtonEnabled
                                    ? () {
                                        setState(() {
                                          firstSeen = false;
                                        });
                                        if (_key.currentState!.validate()) {
                                          _loginButton(context);
                                        }
                                      }
                                    : null,
                                text: state is LoginLoading
                                    ? S.of(context).loading
                                    : S.of(context).login,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).dontHaveAccount,
                    style:
                        AppTexts.regular(context).copyWith(color: Colors.grey),
                  ),
                  SizedBox(width: 4),
                  InkwellWidget(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      S.of(context).register,
                      style: AppTexts.regular(context)
                          .copyWith(color: AppColors.buttonLight),
                    ),
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

  void _loginButton(BuildContext context) {
    BlocProvider.of<LoginCubit>(context).loginFuc(
        input: LoginInput(
      email: _email.controller.text,
      password: _password.controller.text,
      role: selectRole == 0 ? "doctor" : "patient",
    ));
  }
}
