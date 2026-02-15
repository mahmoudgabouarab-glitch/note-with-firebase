import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/utils/app_assets.dart';
import 'package:onlyproject/core/utils/speacing.dart';
import 'package:onlyproject/features/auth/view/widget/signup/already_have_acc.dart';
import 'package:onlyproject/features/auth/view/widget/signup/signup_action.dart';
import 'package:onlyproject/features/auth/view/widget/signup/signup_fileds.dart';
import 'package:onlyproject/features/auth/view/widget/signup/signup_listen.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            children: [
              Center(child: Image.asset(AppAssets.authLogo, height: 150.h)),
              spaceH(20),
              const SignupFileds(),
              spaceH(20),
              const SignupAction(),
              spaceH(20),
              const AlreadyHaveAcc(),
              spaceH(20),
              const SignupListen(),
            ],
          ),
        ),
      ),
    );
  }
}
