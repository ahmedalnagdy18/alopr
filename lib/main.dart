import 'package:alopr/features/onboarding/screens/splash_screen.dart';
import 'package:alopr/features/setting/cubits/language_cubit/local_cubit.dart';
import 'package:alopr/features/setting/cubits/language_cubit/local_state.dart';
import 'package:alopr/features/setting/cubits/theme_cubit/theme_cubit.dart';
import 'package:alopr/features/setting/cubits/theme_cubit/theme_state.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          BlocProvider(
            create: (context) => LocaleCubit()..getSavedLanguage(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return BlocBuilder<LocaleCubit, ChangeLocaleState>(
              builder: (context, state) {
                return MaterialApp(
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  locale: state.locale,
                  supportedLocales: S.delegate.supportedLocales,
                  theme: themeState.themeData,
                  debugShowCheckedModeBanner: false,
                  home: const SplashScreen(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
