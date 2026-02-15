import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/app_styles.dart';
import 'package:onlyproject/core/utils/speacing.dart';

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color backgroundColor;
    Icon icon;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = AppColor.success;
        icon = const Icon(Icons.check_circle, color: AppColor.textSecondary);
        break;
      case SnackBarType.error:
        backgroundColor = AppColor.error;
        icon = const Icon(Icons.error, color: AppColor.textSecondary);
        break;
      case SnackBarType.warning:
        backgroundColor = AppColor.primary;
        icon = const Icon(Icons.warning, color: AppColor.textSecondary);
        break;
      default:
        backgroundColor = AppColor.textSecondary;
        icon = const Icon(Icons.info, color: AppColor.textSecondary);
    }

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      duration: duration,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      content: Row(
        children: [
          icon,
          spaceW(12),
          Expanded(
            child: Text(
              message,
              style: Styles.s16_500.copyWith(color: AppColor.textSecondary),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

enum SnackBarType { success, error, warning, info }
