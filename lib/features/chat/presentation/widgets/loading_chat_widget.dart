import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoadingChatWidget extends StatelessWidget {
  const LoadingChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 30.r,
            width: 40.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset("images/ai_icon.svg"),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            width: 60.r,
            child: Image.asset(
              "images/loading.gif",
            ),
          ),
        ],
      ),
    );
  }
}
