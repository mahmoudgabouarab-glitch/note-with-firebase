import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onlyproject/core/utils/extension.dart';
import 'package:onlyproject/features/home/data/model/title_card.dart';
import 'package:onlyproject/features/home/presentation/view/widget/home/one_item_of_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World"),
        actions: [
          IconButton(
            onPressed: () async {
              GoogleSignIn momo = GoogleSignIn();
              momo.disconnect();
              Navigator.of(context).pushReplacementNamed("fristpage");
              await FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.exit_to_app, color: Color(0xff665AF0)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: GridView.builder(
          itemCount: titleCard.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => context.push(titleCard[index].screen),
              child: OneItemOfCard(titleCard: titleCard[index]),
            );
          },
        ),
      ),
    );
  }
}
