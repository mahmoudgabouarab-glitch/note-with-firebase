import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onlyproject/core/utils/app_styles.dart';
import 'package:onlyproject/core/utils/extension.dart';
import 'package:onlyproject/features/auth/view/login_view.dart';
import 'package:onlyproject/features/auth/view_model/cubit/info_user_cubit.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocBuilder<InfoUserCubit, InfoUserState>(
        builder: (context, state) {
          if (state is InfoUserSuccess) {
            return Text("Hello ${state.user.name}", style: Styles.s22_600);
          } else if (state is InfoUserLoading) {
            return Text("Loading...", style: Styles.s22_600);
          } else {
            return Text("Hello World", style: Styles.s22_600);
          }
        },
      ),
      actions: [
        IconButton(
          onPressed: () async {
            GoogleSignIn googleSignIn = GoogleSignIn();
            googleSignIn.disconnect();
            await FirebaseAuth.instance.signOut();
            if (!context.mounted) return;
            context.pushAndRemoveUntil(LoginView());
          },
          icon: Icon(Icons.exit_to_app, color: Color(0xff665AF0)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
