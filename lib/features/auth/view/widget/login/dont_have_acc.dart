import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/extension.dart';
import 'package:onlyproject/features/auth/view/signup_view.dart';
import 'package:onlyproject/generated/locale_keys.g.dart';

class DontHaveAcc extends StatelessWidget {
  const DontHaveAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.dont_have_account.tr(),
          style: TextStyle(color: AppColor.textPrimary),
        ),
        TextButton(
          onPressed: () => context.push(SignupView()),
          child: Text(
            LocaleKeys.sign_up.tr(),
            style: TextStyle(color: AppColor.primary),
          ),
        ),
      ],
    );
  }
}
