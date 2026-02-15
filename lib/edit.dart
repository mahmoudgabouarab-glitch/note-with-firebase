import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlyproject/customs/appbutton.dart';
import 'package:onlyproject/customs/apptextfield.dart';
import 'package:onlyproject/customs/basescreen.dart';

class Edit extends StatefulWidget {
  final String docid;
  final String oldnote;
  const Edit({super.key, required this.docid, required this.oldnote});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  editnotes() async {
    if (edit.text != "") {
      try {
        await notes.doc(widget.docid).set({"name": edit.text}, SetOptions(merge: true));
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil('homepage', (route) => false);
      } catch (e) {}
    }
  }

  @override
  void initState() {
    edit.text = widget.oldnote;
    super.initState();
  }

  TextEditingController edit = TextEditingController();
  GlobalKey textEditingController = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Edit",
      body: Form(
        key: textEditingController,
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            AppTextField(title: "Edit", hintText: "", controller: edit),
            SizedBox.fromSize(size: Size(10, 10)),
            AppButton(
              text: "Change",
              onPressed: () {
                editnotes();
              },
            ),
          ],
        ),
      ),
    );
  }
}
