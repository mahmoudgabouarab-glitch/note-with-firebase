import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/core/utils/app_assets.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/app_styles.dart';
import 'package:onlyproject/core/utils/extension.dart';
import 'package:onlyproject/core/utils/function.dart';
import 'package:onlyproject/core/utils/speacing.dart';
import 'package:onlyproject/core/widgets/custom_button.dart';
import 'package:onlyproject/core/widgets/custom_snakbar.dart';
import 'package:onlyproject/features/home/presentation/view/home_view.dart';
import 'package:onlyproject/generated/locale_keys.g.dart';

class VerifyBody extends StatelessWidget {
  const VerifyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.verify),
              spaceH(100),
              Text(
                LocaleKeys.verify_your_account.tr(),
                style: Styles.s28_500.copyWith(color: AppColor.textPrimary),
              ),
              Text(
                LocaleKeys.please_check_your_email.tr(),
                style: Styles.s16_500.copyWith(color: AppColor.textSubTitle),
              ),
              Btn(
                text: LocaleKeys.verify.tr(),
                ontap: () async {
                  await FirebaseAuth.instance.currentUser!.reload();
                  if (isVerify) {
                    if (context.mounted) context.pushAndRemoveUntil(HomeView());
                  } else {
                    CustomSnackBar.show(
                      context,
                      message: LocaleKeys.check_your_email.tr(),
                      type: SnackBarType.error,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
