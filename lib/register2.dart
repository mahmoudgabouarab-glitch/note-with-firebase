
import 'package:flutter/material.dart';
import 'package:onlyproject/customs/appbutton.dart';
import 'package:onlyproject/customs/basescreen.dart';

class Signupsuccess extends StatefulWidget {
  const Signupsuccess({super.key});

  @override
  State<Signupsuccess> createState() => _SignupsuccessState();
}

class _SignupsuccessState extends State<Signupsuccess> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "",
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffFFFFFF),
        padding: EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Column(
          children: [
            Image.asset("assets/image/Frame.png"),

            Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text(
                    "Sign up successfully",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff232440),
                    ),
                  ),
                  Text(
                    "Everyting will be fine !",
                    style: TextStyle(color: Color(0xFF6E6E82)),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsetsGeometry.all(15)),

            AppButton(
              color: Color(0xff3DAB25),
              text: "Get Started",
              onPressed: () {
                Navigator.of(context).pushNamed("verifty");
              },
            ),
          ],
        ),
      ),
    );
  }
}
