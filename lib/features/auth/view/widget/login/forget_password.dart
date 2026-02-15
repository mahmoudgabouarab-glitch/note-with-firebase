import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/features/auth/view_model/login/login_cubit.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.read<LoginCubit>().sendPasswordResetEmail(),
      child: Text("forget password?"),
    );
  }
}
