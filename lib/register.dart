import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onlyproject/customs/appbutton.dart';
import 'package:onlyproject/customs/apptextfield.dart';
import 'package:onlyproject/customs/basescreen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? username;
  String? account;

  bool state = false;

  @override
  void dispose() {
    // لازم نستدعي dispose على الكنترولرز
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Register",
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                  title: "Username",
                  hintText: "User name",
                  onSaved: (val) {
                    username = val;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "you must write your username";
                    }
                    if (value.length > 15) {
                      return "your username is failed ";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                AppTextField(
                  controller: emailController,
                  title: "email",
                  hintText: "@email.com",
                  onSaved: (val) {
                    setState(() {
                      account = val;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "you must write your phone";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                AppTextField(
                  title: "password",
                  hintText: "At least 8 characters",
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "you must write your password";
                    }
                    if (value.length < 8) {
                      return "your password not strong ";
                    }
                    return null;
                  },
                  onSaved: (Val) {},
                ),
                const SizedBox(height: 10),
                AppTextField(
                  title: "confirm password",
                  hintText: "must be the same",
                  controller: confirmPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "you must confirm your password";
                    }
                    if (value != passwordController.text) {
                      return "not the same ";
                    }
                    return null;
                  },
                  onSaved: (Val) {},
                ),

                const SizedBox(height: 10),
                Center(
                  child: AppButton(
                    text: "Register",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                         await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                          await FirebaseAuth.instance.currentUser!
                              .sendEmailVerification();

                          Navigator.of(context).pushNamed("register2");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              animType: AnimType.rightSlide,
                              title: 'weak-password',
                              desc: 'The password provided is too weak.',
                            ).show();
                          } else if (e.code == 'email-already-in-use') {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              animType: AnimType.rightSlide,
                              title: 'email already in use',
                              desc:
                                  'The account already exists for that email.',
                            ).show();
                          }
                        } catch (e) {
                          print(e);
                        }
                      } else {
                        print("Form not valid");
                      }
                    },
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have account?",
                      style: TextStyle(color: Color(0xff232440)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop("login");
                      },
                      child: const Text(
                        "Login",
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
