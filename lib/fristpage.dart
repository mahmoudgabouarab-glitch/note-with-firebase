import 'package:flutter/material.dart';
import 'customs/appbutton.dart';
import 'customs/basescreen.dart';

class Fristpage extends StatefulWidget {
  const Fristpage({super.key});

  @override
  State<Fristpage> createState() => _FristpageState();
}

class _FristpageState extends State<Fristpage> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffE5E5E5),
        padding: EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Column(
          children: [
            Image.asset("image/Graphic.png"),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Image.asset("image/Icon.png"),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "NOTE",
                          style: TextStyle(
                            color: Color(0xff232440),
                            fontSize: 24,
                            height: 2,
                          ),
                        ),
                        TextSpan(
                          style: TextStyle(
                            color: Color(0xFF6E6E82),
                            height: 2,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          style: TextStyle(
                            color: Color(0xFF6E6E82),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsetsGeometry.all(15)),
            AppButton(
              text: "Get Started",
              onPressed: () {
                Navigator.of(context).pushNamed("login");
              },
            ),
          ],
        ),
      ),
    );
  }
}
