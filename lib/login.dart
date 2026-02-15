import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onlyproject/customs/appbutton.dart';
import 'package:onlyproject/customs/apptextfield.dart';
import 'package:onlyproject/customs/basescreen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushReplacementNamed("homepage");
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? account;
  String? password;
  bool state = false;
  GlobalKey<FormState> email = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Login",
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Form(
            key: email,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                  controller: emailController,
                  title: "Email",
                  hintText: "@email.com",
                  onSaved: (Val) {
                    account = Val;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "you must write your email";
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(padding: EdgeInsetsGeometry.all(10)),
                AppTextField(
                  controller: passwordController,
                  obscureText: true,
                  title: "password",
                  hintText: "At least 8 characters",
                  onSaved: (val) {
                    password = val;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "you must wirte your password";
                    }
                    return null;
                  },
                ),

                TextButton(
                  onPressed: () async {
                    try {
                      if (emailController.text.isEmpty) {
                        return AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'error',
                          desc: 'write your email',
                        ).show();
                      }
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: emailController.text,
                      );
                      {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.rightSlide,
                          title: 'Done',
                          desc: 'check your email',
                        ).show();
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'invalid-email') {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          title: 'Error',
                          desc: 'Email not found',
                        ).show();
                      }
                    }
                  },
                  child: Text("forget password?"),
                ),

                Padding(padding: EdgeInsetsGeometry.only(top: 40)),
                Center(
                  child: AppButton(
                    text: "Login",
                    onPressed: () async {
                      if (email.currentState!.validate()) {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                          Navigator.of(
                            context,
                          ).pushReplacementNamed("homepage");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'invalid-email') {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              animType: AnimType.rightSlide,
                              title: 'user not found',
                              desc: 'No user found for that email.',
                            ).show();
                          } else if (e.code == 'invalid-credential') {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              animType: AnimType.rightSlide,
                              title: 'wrong-password',
                              desc: 'Wrong password provided for that user.',
                            ).show();
                          }
                        }
                      } else {
                        print('erroe');
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: AppButton(
                    text: "LogIn with Google",
                    onPressed: () {
                      signInWithGoogle();
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account?",
                      style: TextStyle(color: Color(0xff232440)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("register");
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Color(0xff665AF0)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
