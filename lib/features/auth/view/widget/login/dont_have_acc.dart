import 'package:flutter/material.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/extension.dart';
import 'package:onlyproject/register.dart';

class DontHaveAcc extends StatelessWidget {
  const DontHaveAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have account?",
          style: TextStyle(color: AppColor.textPrimary),
        ),
        TextButton(
          onPressed: () => context.push(Register()),
          child: Text("Sign Up", style: TextStyle(color: AppColor.primary)),
        ),
      ],
    );
  }
}
