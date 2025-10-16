import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8,
      icon: Icon(
        Icons.warning_amber_rounded,
        color: Colors.amber,
        size: 40.r,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.current.completeYourProfileFirst,
            textAlign: TextAlign.center,
            style: AppTexts.heading(context),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () => Navigator.pop(context),
              child: Text(
                S.current.ok,
                style: AppTexts.regular(context).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
