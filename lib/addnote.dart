import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlyproject/customs/appbutton.dart';
import 'package:onlyproject/customs/apptextfield.dart';
import 'package:onlyproject/customs/basescreen.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  Future<void> addnotes() async {
    if (add.text != "") {
      try {
        await notes.add({"name": add.text ,"id":FirebaseAuth.instance.currentUser!.uid});

        Navigator.of(context).pushNamedAndRemoveUntil('homepage',(route) => false,);
      } catch (e) {}
    }
  }

  TextEditingController add = TextEditingController();
  GlobalKey textEditingController = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Add",
      body: Form(
        key: textEditingController,
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            AppTextField(
              title: "enter here",
              hintText: "what do u think",
              controller: add,
            ),
            SizedBox.fromSize(size: Size(10, 10),),
            AppButton(
              text: "click",
              onPressed: () {
                addnotes();
              },
            ),
          ],
        ),
      ),
    );
  }
}
