import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/customs/appbutton.dart';
import 'package:onlyproject/features/auth/view_model/login/login_cubit.dart';

class LoginGoogleAction extends StatelessWidget {
  const LoginGoogleAction({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: "LogIn with Google",
      onPressed: () => context.read<LoginCubit>().loginWithGoogle(),
    );
  }
}
