import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/addnote.dart';
import 'package:onlyproject/core/utils/app_color.dart';
import 'package:onlyproject/features/auth/view/login_view.dart';
import 'package:onlyproject/features/auth/view/signup_view.dart';
import 'package:onlyproject/features/splash/splash.dart';
import 'package:onlyproject/homepage.dart';
import 'package:onlyproject/register2.dart';
import 'package:onlyproject/verifty.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: AppColor.background),
          brightness: Brightness.light,
          fontFamily: "Roboto",
          scaffoldBackgroundColor: AppColor.background,
        ),
        home:
            (FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified)
            ? Homepage()
            : Splash(),
        routes: {
          "add": (context) => Add(),
          "fristpage": (context) => Splash(),
          "login": (context) => LoginView(),
          "register": (context) => SignupView(),
          "register2": (context) => Signupsuccess(),
          "verifty": (context) => Verifty(),
          "homepage": (context) => Homepage(),
        },
      ),
    );
  }
}
