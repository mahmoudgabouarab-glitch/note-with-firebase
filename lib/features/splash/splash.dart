import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/utils/app_assets.dart';
import 'package:onlyproject/core/utils/extension.dart';
import 'package:onlyproject/core/utils/speacing.dart';
import 'package:onlyproject/core/widgets/custom_button.dart';
import 'package:onlyproject/login.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.splash),
            spaceH(120),
            Btn(
              ontap: () {
                context.pushAndRemoveUntil(Login());
              },
              text: "Get Started",
            ),
          ],
        ),
      ),
    );
  }
}
