import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/extension.dart';
import 'package:onlyproject/generated/locale_keys.g.dart';

class AlreadyHaveAcc extends StatelessWidget {
  const AlreadyHaveAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.already_have_account.tr(),
          style: TextStyle(color: AppColor.textPrimary),
        ),
        TextButton(
          onPressed: () {
            context.popPage();
          },
          child: Text(
            LocaleKeys.login.tr(),
            style: TextStyle(color: AppColor.primary),
          ),
        ),
      ],
    );
  }
}
