import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
class GlobalButton extends StatelessWidget {
  const GlobalButton({Key? key, required this.title, required this.onTap, required this.color, required this.borderColor, required this.textColor})
      : super(key: key);

  final String title;
  final VoidCallback onTap;
  final Color color;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.w),
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor,width: 2),
          borderRadius: BorderRadius.circular(10.sp),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: textColor,
              fontSize: 18.sp,
              fontFamily: "LeagueSpartan",
            ),
          ),
        ),
      ),
    );
  }
}