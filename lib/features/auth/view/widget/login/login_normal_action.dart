import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/widgets/custom_button.dart';
import 'package:onlyproject/features/auth/view_model/login/login_cubit.dart';
import 'package:onlyproject/generated/locale_keys.g.dart';

class LoginNormalAction extends StatelessWidget {
  const LoginNormalAction({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return Btn(
      text: LocaleKeys.login.tr(),
      ontap: () {
        if (cubit.key.currentState!.validate()) {
          cubit.loginWithEmailAndPassword();
        }
      },
    );
  }
}
