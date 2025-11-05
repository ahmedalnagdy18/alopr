import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';

class ImagePerviewrWidget extends StatelessWidget {
  const ImagePerviewrWidget({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return InkwellWidget(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.black,
            child: Stack(
              children: [
                PhotoView(
                  imageProvider: NetworkImage(imageUrl),
                  backgroundDecoration:
                      const BoxDecoration(color: Colors.black),
                ),
                Positioned(
                  top: 40.r,
                  right: 20.r,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white, size: 30.r),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 300.h,
          maxWidth: double.infinity,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.error_outline);
          },
        ),
      ),
    );
  }
}
