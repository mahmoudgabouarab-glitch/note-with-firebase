import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlyproject/customs/appbutton.dart';
import 'package:onlyproject/customs/apptextfield.dart';
import 'package:onlyproject/customs/basescreen.dart';
import 'package:onlyproject/notes/veiw.dart';

class Editdetails extends StatefulWidget {
  final String docdetailsid;

  ///قيمه الاي دي الخاص بالقسم
  final String docid; // الاي دي الخاص بالملاحظه
  final String oldnote;
  const Editdetails({
    super.key,
    required this.docid,
    required this.oldnote,
    required this.docdetailsid,
  });

  @override
  State<Editdetails> createState() => _EditdetailsState();
}

class _EditdetailsState extends State<Editdetails> {
  Editdetailsnotes() async {
    CollectionReference notes = FirebaseFirestore.instance
        .collection('notes')
        .doc(widget.docdetailsid)
        .collection("Details");
    if (Editdetails.text != "") {
      try {
        await notes.doc(widget.docid).update({"name": Editdetails.text});
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => NotePage(notesid: widget.docdetailsid),
          ),
          (Route) => false,
        );
      } catch (e) {}
    }
  }

  @override
  void initState() {
    Editdetails.text = widget.oldnote;
    super.initState();
  }

  TextEditingController Editdetails = TextEditingController();
  GlobalKey textEditdetailsingController = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Editdetails",
      body: Form(
        key: textEditdetailsingController,
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            AppTextField(
              title: "Editdetails",
              hintText: "",
              controller: Editdetails,
            ),
            SizedBox.fromSize(size: Size(10, 10)),
            AppButton(
              text: "Change",
              onPressed: () {
                print("=====================================");
                print(widget.docid);
                Editdetailsnotes();
              },
            ),
          ],
        ),
      ),
    );
  }
}
