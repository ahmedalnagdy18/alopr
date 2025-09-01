import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/features/onboarding/screens/onboarding_page.dart';
import 'package:flutter/material.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  bool showContent = false;
  bool showOnBoarding = false;

  @override
  void initState() {
    super.initState();

    // بعد ثانية واحدة يبدأ يظهر اللوجو + الكتابة مع بعض
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        showContent = true;
      });

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          showOnBoarding = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showOnBoarding) {
      return OnboardingPage();
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
              Column(
                children: [
                  Text(
                    'From',
                    style: AppTexts.regular.copyWith(color: Colors.white),
                  ),
                  Text(
                    'Alzheimer’s Prediction',
                    style: AppTexts.heading.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
