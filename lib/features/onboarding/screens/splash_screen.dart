import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/features/onboarding/screens/splash_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool showBackground = false;

  final double initialSize = 55.0;
  final double holdSize = 200.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900), // 🔥 أقل من الأول
    );

    double holdScale = holdSize / initialSize; // 200/64 ≈ 3.125
    double finalScale = 80.0;

    _scaleAnimation = TweenSequence<double>([
      // Phase 1: يوصل لحد 200px بهدوء
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: holdScale)
            .chain(CurveTween(curve: Curves.fastEaseInToSlowEaseOut)),
        weight: 85, // معظم الوقت للجزء الأول
      ),
      // Phase 2: من 200 → full expand بسرعة جدًا 🚀
      TweenSequenceItem(
        tween: Tween(begin: holdScale, end: finalScale)
            .chain(CurveTween(curve: Curves.ease)), // Curve سريع
        weight: 15, // وقت قليل جدًا للجزء التاني
      ),
    ]).animate(_controller);

    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward().whenComplete(() {
        setState(() {
          showBackground = true;
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: !showBackground ? Colors.white : Colors.black,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor:
            showBackground ? AppColors.primaryLight : AppColors.white,
        body: Center(
          child: showBackground
              ? const SplashScreen2()
              : ScaleTransition(
                  scale: _scaleAnimation,
                  child: SizedBox(
                    width: initialSize.r,
                    height: initialSize.r,
                    child: Image.asset('images/icon.png'),
                  ),
                ),
        ),
      ),
    );
  }
}
