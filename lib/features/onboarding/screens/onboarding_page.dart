import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/shared_prefrances/shared_prefrances.dart';
import 'package:alopr/features/authentication/presentation/screens/login_page.dart';
import 'package:alopr/features/authentication/presentation/screens/register_page.dart';
import 'package:alopr/features/onboarding/widgets/onboarding_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/fonts/app_text.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with TickerProviderStateMixin {
  late AnimationController _bgController;
  late Animation<double> _bgScale;
  final PageController _pageController = PageController();
  bool revealContent = false;
  bool hideIcon = false;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();

    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    )..addListener(() {
        setState(() {});
      });

    _bgScale = Tween<double>(begin: 5.0, end: 0.0).animate(
      CurvedAnimation(
          parent: _bgController, curve: Curves.fastEaseInToSlowEaseOut),
    );

    _bgController.forward().whenComplete(() {
      setState(() {
        revealContent = true;
        hideIcon = true;
      });
    });
  }

  @override
  void dispose() {
    _bgController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          /// الصفحة الأصلية اللي هتظهر بعد الريڤيل
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: currentIndex == 7
                            ? Alignment.center
                            : Alignment.topLeft,
                        child: SizedBox(
                          height: 56.h,
                          width: 56.w,
                          child: Image.asset("images/icon.png"),
                        ),
                      ),
                      if (currentIndex != 7 && currentIndex != 0)
                        Padding(
                          padding: EdgeInsets.only(right: 16).r,
                          child: InkWell(
                            onTap: () async {
                              await SharedPrefrance.instanc
                                  .setOnboardingShown(true);
                              if (!context.mounted) return;
                              Navigator.of(context).pushAndRemoveUntil(
                                CupertinoPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: Text(
                              'Skip',
                              style: AppTexts.regular(context)
                                  .copyWith(color: AppColors.primaryLight),
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (currentIndex == 7)
                    Text(
                      'Congratulations!',
                      style: AppTexts.heading(context).copyWith(
                          fontSize: 24.sp, color: AppColors.headingLight),
                      textAlign: TextAlign.center,
                    ),
                  SizedBox(height: 32.h),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            onPageChanged: (index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            controller: _pageController,
                            itemCount: onboardingData.length,
                            itemBuilder: (context, index) {
                              final data = onboardingData[index];
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 280.h,
                                    width: 375.w,
                                    child: SvgPicture.asset(
                                      data.image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  Text(
                                    data.mainTitle,
                                    style: AppTexts.regular(context).copyWith(
                                        color: AppColors.headingLight),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    data.title,
                                    style: AppTexts.heading(context).copyWith(
                                        fontSize: 20.sp,
                                        color: AppColors.headingLight),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 16.h),
                                  Text(
                                    data.subTitle,
                                    style: AppTexts.regular(context).copyWith(
                                        color: AppColors.paragraphLight),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        if (currentIndex != 0 && currentIndex != 7) ...[
                          SizedBox(height: 16.h),
                          Padding(
                            padding: EdgeInsets.only(bottom: 40.h),
                            child: DotsIndicator(
                              decorator: DotsDecorator(
                                  spacing: EdgeInsets.all(4).r,
                                  size: Size(6, 6),
                                  activeColor: AppColors.primaryLight,
                                  activeSize: Size(8, 8)),
                              dotsCount: 6,
                              position: currentIndex.toDouble() - 1,
                            ),
                          ),
                        ],
                        SizedBox(height: 16.h),
                        if (currentIndex == 0 || currentIndex == 7) ...[
                          MainAppButton(
                            bouttonWidth: 196.w,
                            onPressed: () async {
                              if (currentIndex == 7) {
                                await SharedPrefrance.instanc
                                    .setOnboardingShown(true);

                                if (!context.mounted) return;
                                Navigator.of(context).push(
                                  CupertinoPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                );
                              } else {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            text: currentIndex == 7
                                ? "Register Now"
                                : "Let's get started!",
                            icon: currentIndex == 7
                                ? null
                                : const Icon(Icons.arrow_forward_rounded,
                                    size: 16, color: Colors.white),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'I already have an account, ',
                                style: AppTexts.regular(context).copyWith(
                                  color: AppColors.headingLight
                                      .withValues(alpha: 0.35),
                                ),
                              ),
                              InkwellWidget(
                                onTap: () {
                                  Navigator.of(context).push(
                                    CupertinoPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Login',
                                  style: AppTexts.regular(context)
                                      .copyWith(color: AppColors.primaryLight),
                                ),
                              ),
                            ],
                          ),
                        ],
                        if (currentIndex != 0 && currentIndex != 7) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 16).r,
                                child: InkWell(
                                  onTap: () {
                                    _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Text(
                                    'Back',
                                    style: AppTexts.regular(context).copyWith(
                                        color: AppColors.primaryLight),
                                  ),
                                ),
                              ),
                              MaterialButton(
                                minWidth: 0,
                                elevation: 0,
                                onPressed: () async {
                                  if (currentIndex == 6) {
                                    await SharedPrefrance.instanc
                                        .setOnboardingShown(true);
                                  }

                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                color: AppColors.primaryLight,
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Icon(Icons.arrow_forward_rounded,
                                    size: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// الـ Overlay الأزرق اللي هيصغر لحد ما يختفي

          if (!hideIcon)
            Positioned(
                left: -115 * _bgController.value,
                top: -50 * _bgController.value,
                child: Center(
                  child: Transform.scale(
                    scale: (4 * _bgScale.value),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.blue,
                      ),
                      child: Image.asset(
                        'images/icon.png',
                      ),
                    ),
                  ),
                )),
        ],
      ),
    );
  }
}
