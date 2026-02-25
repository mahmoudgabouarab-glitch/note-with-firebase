import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/utils/speacing.dart';
import 'package:onlyproject/core/widgets/custom_text_filed.dart';
import 'package:onlyproject/features/auth/view_model/signup/signup_cubit.dart';
import 'package:onlyproject/generated/locale_keys.g.dart';

class SignupFileds extends StatelessWidget {
  const SignupFileds({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Form(
      key: cubit.key,
      child: Column(
        children: [
          CustomTextFiled(
            controller: cubit.userName,
            hint: LocaleKeys.user_name.tr(),
            keybordtype: TextInputType.name,
            validator: (value) {
              if (value!.isEmpty) {
                return LocaleKeys.write_your_name.tr();
              }
              return null;
            },
          ),
          spaceH(10),
          CustomTextFiled(
            controller: cubit.phone,
            hint: LocaleKeys.phone.tr(),
            keybordtype: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return LocaleKeys.write_your_phone.tr();
              }
              return null;
            },
          ),
          spaceH(10),
          CustomTextFiled(
            controller: cubit.address,
            hint: LocaleKeys.address.tr(),
            keybordtype: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return LocaleKeys.write_your_address.tr();
              }
              return null;
            },
          ),
          spaceH(10),
          CustomTextFiled(
            controller: cubit.email,
            hint: LocaleKeys.email_hint.tr(),
            keybordtype: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return LocaleKeys.write_your_email.tr();
              }
              return null;
            },
          ),
          spaceH(10),
          CustomTextFiled(
            controller: cubit.password,
            hint: LocaleKeys.password_hint.tr(),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return LocaleKeys.write_your_password.tr();
              }
              return null;
            },
          ),
          spaceH(10),
          CustomTextFiled(
            controller: cubit.confirmPassword,
            hint: LocaleKeys.password_hint.tr(),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return LocaleKeys.write_your_password.tr();
              }
              if (value != cubit.password.text) {
                return LocaleKeys.not_the_same.tr();
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
