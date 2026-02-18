import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/widgets/custom_button.dart';
import 'package:onlyproject/features/auth/view_model/login/login_cubit.dart';

class LoginGoogleAction extends StatelessWidget {
  const LoginGoogleAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Btn(
      text: "LogIn with Google",
      ontap: () => context.read<LoginCubit>().loginWithGoogle(),
    );
  }
}
