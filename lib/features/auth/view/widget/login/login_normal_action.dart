import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/widgets/custom_button.dart';
import 'package:onlyproject/features/auth/view_model/login/login_cubit.dart';

class LoginNormalAction extends StatelessWidget {
  const LoginNormalAction({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return Btn(
      text: "Login",
      ontap: () {
        if (cubit.key.currentState!.validate()) {
          cubit.loginWithEmailAndPassword();
        }
      },
    );
  }
}
