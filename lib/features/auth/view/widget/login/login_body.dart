import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/utils/app_assets.dart';
import 'package:onlyproject/core/utils/speacing.dart';
import 'package:onlyproject/features/auth/view/widget/login/dont_have_acc.dart';
import 'package:onlyproject/features/auth/view/widget/login/forget_password.dart';
import 'package:onlyproject/features/auth/view/widget/login/login_fileds.dart';
import 'package:onlyproject/features/auth/view/widget/login/login_google_action.dart';
import 'package:onlyproject/features/auth/view/widget/login/login_listen.dart';
import 'package:onlyproject/features/auth/view/widget/login/login_normal_action.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(AppAssets.authLogo, height: 150.h)),
              spaceH(20),
              const LoginFileds(),
              spaceH(20),
              const ForgetPassword(),
              spaceH(20),
              const LoginNormalAction(),
              spaceH(20),
              const LoginGoogleAction(),
              spaceH(20),
              const DontHaveAcc(),
              const LoginListen(),
            ],
          ),
        ),
      ),
    );
  }
}
