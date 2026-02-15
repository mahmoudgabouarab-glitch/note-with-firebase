import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/utils/speacing.dart';
import 'package:onlyproject/core/widgets/custom_text_filed.dart';
import 'package:onlyproject/features/auth/view_model/login/login_cubit.dart';

class LoginFileds extends StatelessWidget {
  const LoginFileds({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFiled(
            hint: "@email.com",
            keybordtype: TextInputType.emailAddress,
            controller: cubit.email,
            validator: (value) {
              if (value!.isEmpty) {
                return "write your email";
              }
              return null;
            },
          ),
          spaceH(10),
          CustomTextFiled(
            hint: "********",
            obscureText: true,
            controller: cubit.password,
            validator: (value) {
              if (value!.isEmpty) {
                return "write your password";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
