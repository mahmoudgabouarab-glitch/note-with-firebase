import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/core/utils/extension.dart';
import 'package:onlyproject/core/widgets/custom_snakbar.dart';
import 'package:onlyproject/features/auth/view_model/login/login_cubit.dart';
import 'package:onlyproject/features/home/presentation/view/home_view.dart';
import 'package:onlyproject/generated/locale_keys.g.dart';

class LoginListen extends StatelessWidget {
  const LoginListen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LoginInitial():
          case LoginLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
            );
          case LoginSuccess():
            context.popPage();
            CustomSnackBar.show(
              context,
              message: LocaleKeys.login_successfully.tr(),
              type: SnackBarType.success,
            );
            context.pushAndRemoveUntil(HomeView());
          case LoginFailure():
            context.popPage();
            CustomSnackBar.show(
              context,
              message: state.message,
              type: SnackBarType.error,
            );
          case ForgetPasswordLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.primary),
              ),
            );
          case ForgetPasswordSuccess():
            context.popPage();
            CustomSnackBar.show(
              context,
              message: LocaleKeys.check_your_email.tr(),
              type: SnackBarType.success,
            );
          case ForgetPasswordFailure():
            context.popPage();
            CustomSnackBar.show(
              context,
              message: state.message == "channel-error"
                  ? LocaleKeys.please_write_your_email.tr()
                  : state.message,
              type: SnackBarType.error,
            );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
