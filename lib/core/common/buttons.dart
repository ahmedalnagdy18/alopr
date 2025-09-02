import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:flutter/material.dart';

class MainAppButton extends StatelessWidget {
  const MainAppButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.icon,
      this.bouttonWidth});
  final void Function() onPressed;
  final String? text;
  final Widget? icon;
  final double? bouttonWidth;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
          minimumSize: WidgetStatePropertyAll(Size(bouttonWidth ?? 0, 40)),
          backgroundColor: WidgetStatePropertyAll(AppColors.primaryLight),
          iconColor: WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16)))),
      onPressed: onPressed,
      label: Text(
        text ?? "",
        style: AppTexts.regular.copyWith(color: Colors.white),
      ),
      icon: icon,
      iconAlignment: IconAlignment.end,
    );
  }
}
