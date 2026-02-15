// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:onlyproject/customs/appbutton.dart';
// import 'package:onlyproject/customs/apptextfield.dart';
// import 'package:onlyproject/customs/basescreen.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
  


//   String? account;
//   String? password;

  

//   @override
//   Widget build(BuildContext context) {
//     return BaseScreen(
//       title: "Login",
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
     
         
            
//           TextButton(
//             onPressed: () async {
//               try {
//                 if (emailController.text.isEmpty) {
//                   return AwesomeDialog(
//                     context: context,
//                     dialogType: DialogType.error,
//                     animType: AnimType.rightSlide,
//                     title: 'error',
//                     desc: 'write your email',
//                   ).show();
//                 }
//                 await FirebaseAuth.instance.sendPasswordResetEmail(
//                   email: emailController.text,
//                 );
//                 {
//                   AwesomeDialog(
//                     context: context,
//                     dialogType: DialogType.success,
//                     animType: AnimType.rightSlide,
//                     title: 'Done',
//                     desc: 'check your email',
//                   ).show();
//                 }
//               } on FirebaseAuthException catch (e) {
//                 if (e.code == 'invalid-email') {
//                   AwesomeDialog(
//                     context: context,
//                     dialogType: DialogType.error,
//                     title: 'Error',
//                     desc: 'Email not found',
//                   ).show();
//                 }
//               }
//             },
//             child: Text("forget password?"),
//           ),
            
//           Center(
//             child: AppButton(
//               text: "Login",
//               onPressed: () async {
//                 if (email.currentState!.validate()) {
//                   try {
//                     await FirebaseAuth.instance
//                         .signInWithEmailAndPassword(
//                           email: emailController.text,
//                           password: passwordController.text,
//                         );
//                     Navigator.of(
//                       context,
//                     ).pushReplacementNamed("homepage");
//                   } on FirebaseAuthException catch (e) {
//                     if (e.code == 'invalid-email') {
//                       AwesomeDialog(
//                         context: context,
//                         dialogType: DialogType.warning,
//                         animType: AnimType.rightSlide,
//                         title: 'user not found',
//                         desc: 'No user found for that email.',
//                       ).show();
//                     } else if (e.code == 'invalid-credential') {
//                       AwesomeDialog(
//                         context: context,
//                         dialogType: DialogType.warning,
//                         animType: AnimType.rightSlide,
//                         title: 'wrong-password',
//                         desc: 'Wrong password provided for that user.',
//                       ).show();
//                     }
//                   }
//                 } else {
//                   print('erroe');
//                 }
//               },
//             ),
//           ),
//           const SizedBox(height: 10),
//           Center(
//             child: AppButton(
//               text: "LogIn with Google",
//               onPressed: () {
               
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Don't have account?",
//                 style: TextStyle(color: Color(0xff232440)),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pushNamed("register");
//                 },
//                 child: Text(
//                   "Sign Up",
//                   style: TextStyle(color: Color(0xff665AF0)),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
