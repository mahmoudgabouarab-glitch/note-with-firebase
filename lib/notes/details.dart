import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlyproject/customs/appbutton.dart';
import 'package:onlyproject/customs/apptextfield.dart';
import 'package:onlyproject/customs/basescreen.dart';
import 'package:onlyproject/notes/veiw.dart';

class Details extends StatefulWidget {
  final String notesid;
  const Details({super.key, required this.notesid});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Detailsnotes() async {
    CollectionReference notes = FirebaseFirestore.instance
        .collection('notes')
        .doc(widget.notesid)
        .collection("Details");
    if (Details.text != "") {
      try {
        await notes.add({"name": Details.text});
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NotePage(notesid: widget.notesid),
          ),
        );
      } catch (e) {}
    }
  }

  TextEditingController Details = TextEditingController();
  GlobalKey textEditingController = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Details",
      body: Form(
        key: textEditingController,
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            AppTextField(
              title: "enter here",
              hintText: "what do u think",
              controller: Details,
            ),
            SizedBox.fromSize(size: Size(10, 10)),
            AppButton(
              text: "click",
              onPressed: () {
                Detailsnotes();
              },
            ),
          ],
        ),
      ),
    );
  }
}
