import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/utils/app_color.dart';

class CustomLoading extends StatelessWidget {
  final double? size;
  final Color? color;
  const CustomLoading({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color ?? AppColor.primary,
        radius: size?.r ?? 20.r,
      ),
    );
  }
}
