import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'customs/appbutton.dart';
import 'customs/basescreen.dart';
class Verifty extends StatefulWidget {
  const Verifty({super.key});

  @override
  State<Verifty> createState() => _VeriftyState();
}

class _VeriftyState extends State<Verifty> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "",
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            color: Color(0xffFFFFFF),
            padding: EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Column(
              children: [
                Image.asset("image/Graphic2.png"),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text(
                        "Verify your account",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff232440),
                        ),
                      ),
                      Text(
                        "please check your email",
                        style: TextStyle(color: Color(0xFF6E6E82)),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsetsGeometry.all(10)),
                //Pinput(length: 4),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 35, right: 35),
            child: AppButton(
              text: "Confirm",
              onPressed: () async {
                await FirebaseAuth.instance.currentUser!.reload();
                FirebaseAuth.instance.currentUser!.emailVerified
                    ? Navigator.of(context).pushNamed("homepage")
                    : AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.rightSlide,
                        title: 'Verify your email',
                        desc: 'Check to continue',
                      ).show();
              },
            ),
          ),
        ],
      ),
    );
  }
}
