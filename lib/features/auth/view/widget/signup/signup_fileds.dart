import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/utils/speacing.dart';
import 'package:onlyproject/core/widgets/custom_text_filed.dart';
import 'package:onlyproject/features/auth/view_model/signup/signup_cubit.dart';

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
            hint: "user name",
            keybordtype: TextInputType.name,
            validator: (value) {
              if (value!.isEmpty) {
                return "write your name";
              }
              return null;
            },
          ),
          spaceH(10),
          CustomTextFiled(
            controller: cubit.email,
            hint: "@email.com",
            keybordtype: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return "write your email";
              }
              return null;
            },
          ),
          spaceH(10),
          CustomTextFiled(
            controller: cubit.password,
            hint: "********",
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return "write your password";
              }
              return null;
            },
          ),
          spaceH(10),
          CustomTextFiled(
            controller: cubit.confirmPassword,
            hint: "********",
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return "write your password";
              }
              if (value != cubit.password.text) {
                return "not the same ";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
