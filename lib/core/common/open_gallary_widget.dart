import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpenGallaryWidget extends StatelessWidget {
  const OpenGallaryWidget({
    super.key,
    required this.photosTap,
    required this.cameraTap,
  });
  final Function()? photosTap;
  final Function()? cameraTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))
            .r,
        color: Colors.white,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upload',
                    style: AppTexts.heading(context),
                  ),
                  InkwellWidget(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: 24.r,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              const Divider(),
              SizedBox(height: 16.h),
              InkwellWidget(
                onTap: photosTap,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.photo,
                      size: 24.r,
                    ),
                    SizedBox(width: 14.w),
                    Text(
                      'photos',
                      style: AppTexts.regular(context),
                    )
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              InkwellWidget(
                onTap: cameraTap,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 24.r,
                    ),
                    SizedBox(width: 14.w),
                    Text(
                      'camera',
                      style: AppTexts.regular(context),
                    )
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
