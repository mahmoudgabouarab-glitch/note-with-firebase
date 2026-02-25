import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/utils/app_assets.dart';
import 'package:onlyproject/core/utils/extension.dart';
import 'package:onlyproject/core/utils/speacing.dart';
import 'package:onlyproject/core/widgets/custom_button.dart';
import 'package:onlyproject/features/auth/view/login_view.dart';
import 'package:onlyproject/generated/locale_keys.g.dart';
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
                context.pushAndRemoveUntil(LoginView());
              },
              text: LocaleKeys.get_started.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
