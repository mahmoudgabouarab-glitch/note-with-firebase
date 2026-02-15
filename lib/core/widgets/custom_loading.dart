import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomLoading extends StatelessWidget {
  final double? size;
  final Color? color;
  const CustomLoading({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
      //  color: color ?? AppColor.btn,
        radius: size?.r ?? 10.r,
      ),
    );
  }
}