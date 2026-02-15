import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/widgets/custom_button.dart';
import 'package:onlyproject/features/auth/view_model/signup/signup_cubit.dart';

class SignupAction extends StatelessWidget {
  const SignupAction({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Btn(
      ontap: () {
        if (cubit.key.currentState!.validate()) {
          cubit.signupWithEmailAndPassword();
        }
      },
      text: "Sign Up",
    );
  }
}
