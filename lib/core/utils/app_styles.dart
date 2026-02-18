import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/utils/app_color.dart';

abstract class Styles {
  static TextStyle s16_500 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s28_500 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle s22_600 = TextStyle(
    color: AppColor.textPrimary,
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle s16_600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
  );
  static TextStyle s14_600 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.textSubTitle,
  );
}
