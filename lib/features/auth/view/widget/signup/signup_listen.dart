import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/extension.dart';
import 'package:onlyproject/core/widgets/custom_snakbar.dart';
import 'package:onlyproject/features/auth/view/widget/verify_view.dart';
import 'package:onlyproject/features/auth/view_model/signup/signup_cubit.dart';
import 'package:onlyproject/generated/locale_keys.g.dart';

class SignupListen extends StatelessWidget {
  const SignupListen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        switch (state) {
          case SignupInitial():
          case SignupLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
            );
          case SignupSuccess():
            context.popPage();
            CustomSnackBar.show(
              context,
              message: LocaleKeys.signup_successfully.tr(),
              type: SnackBarType.success,
            );
            context.push(VerifyView());
          case SignupFailure():
            context.popPage();
            CustomSnackBar.show(
              context,
              message: state.message,
              type: SnackBarType.error,
            );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
