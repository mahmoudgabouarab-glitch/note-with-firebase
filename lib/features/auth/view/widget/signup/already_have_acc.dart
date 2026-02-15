import 'package:flutter/material.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/extension.dart';

class AlreadyHaveAcc extends StatelessWidget {
  const AlreadyHaveAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have account?",
          style: TextStyle(color: AppColor.textPrimary),
        ),
        TextButton(
          onPressed: () {
            context.popPage();
          },
          child: const Text("Login", style: TextStyle(color: AppColor.primary)),
        ),
      ],
    );
  }
}
