import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/core/shared_prefrances/shared_prefrances.dart';
import 'package:alopr/features/home/presentation/screens/home_page.dart';
import 'package:alopr/features/onboarding/screens/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  bool showContent = false;
  bool showOnBoarding = false;
  String? registerId;
  String? role;

  @override
  void initState() {
    super.initState();
    _init(); // run async initialization here
  }

  Future<void> _init() async {
    registerId = await SharedPrefrance.instanc.getRegisterId();
    role = await SharedPrefrance.instanc.getUserRole();

    // بعد ثانية واحدة يبدأ يظهر اللوجو + الكتابة مع بعض
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() {
      showContent = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() {
      showOnBoarding = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showOnBoarding) {
      return registerId != null
          ? HomePage(role: role ?? "patient")
          : OnboardingPage();
    }

    return Center(
      child: SafeArea(
        child: AnimatedOpacity(
          opacity: showContent ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeIn,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  width: 140,
                  height: 44,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 28.r),
                child: Column(
                  children: [
                    Text(
                      'From',
                      style: AppTexts.regular(context)
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      'Alzheimer’s Prediction',
                      style: AppTexts.heading(context).copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
