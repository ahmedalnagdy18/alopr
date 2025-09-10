import 'package:alopr/features/onboarding/screens/splash_screen.dart';
import 'package:alopr/features/setting/cubits/theme_cubit/theme_cubit.dart';
import 'package:alopr/features/setting/cubits/theme_cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone 13 mini design size
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          // BlocProvider(
          //   create: (context) => SubjectBloc(),
          // ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              theme: state.themeData,
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}
