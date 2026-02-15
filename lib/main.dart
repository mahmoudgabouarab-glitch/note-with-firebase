import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlyproject/addnote.dart';
import 'package:onlyproject/features/splash/splash.dart';
import 'package:onlyproject/homepage.dart';
import 'package:onlyproject/login.dart';
import 'package:onlyproject/register2.dart';
import 'package:onlyproject/verifty.dart';
import 'register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: "Roboto",
          scaffoldBackgroundColor: Color(0xffE5E5E5),
        ),
        home:
            (FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified)
            ? Homepage()
            : Splash(),
        routes: {
          "add": (context) => Add(),
          "fristpage": (context) => Splash(),
          "login": (context) => Login(),
          "register": (context) => Register(),
          "register2": (context) => Signupsuccess(),
          "verifty": (context) => Verifty(),
          "homepage": (context) => Homepage(),
        },
      ),
    );
  }
}
