import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final void Function()? ontap;
  final double radius;
  final String? text;
  final double? minWidth;
  final Color? color;
  final Widget? child;

  const Btn({
    super.key,
    required this.ontap,
    required this.radius,
    this.text,
    this.minWidth,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      
      minWidth: minWidth,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      onPressed: ontap,
    //  color: color ?? AppColor.btn,
      child: child ?? Center(child: Text(text ?? "")),
    );
  }
}