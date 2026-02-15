import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onlyproject/customs/basescreen.dart';
import 'package:onlyproject/notes/details.dart';
import 'package:onlyproject/notes/editdetails.dart';

class NotePage extends StatefulWidget {
  final String notesid;
  const NotePage({super.key, required this.notesid});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  bool showdata = true;
  List data = [];
  getnotes() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("notes")
        .doc(widget.notesid)
        .collection("Details")
        .get();
    data.addAll(querySnapshot.docs);
    showdata = false;

    setState(() {});
  }

  @override
  void initState() {
    getnotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff665AF0),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Details(notesid: widget.notesid),
            ),
          );
        },
        child: Icon(Icons.add, color: Color(0xffffffff)),
      ),
      showBack: false,
      title: "Notes",
      action: [
        IconButton(
          onPressed: () async {
            GoogleSignIn momo = GoogleSignIn();
            momo.disconnect(); //دي بتفصل التسجيل بجوجل علشان لما تسجل بجوجل تاني يديك الخيارات من الاول تاني هتسجل بانهي اكونت
            Navigator.of(context).pushReplacementNamed("fristpage");
            await FirebaseAuth.instance.signOut();
          },
          icon: Icon(Icons.exit_to_app, color: Color(0xff665AF0)),
        ),
      ],

      // ignore: deprecated_member_use
      body: WillPopScope(
        child: showdata == true
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    onLongPress: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.question,
                        animType: AnimType.rightSlide,
                        title: 'What do you want?',
                        //desc: 'are you sure?',
                        btnCancelText: "Delete",
                        btnOkText: "Edit",
                        btnCancelOnPress: () async {
                          /////////////////////علشان امسح اللى عامله
                          await FirebaseFirestore.instance
                              .collection("notes")
                              .doc(widget.notesid).collection("Details").doc(data[index].id)
                              .delete();
                           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>NotePage(notesid: widget.notesid,)));
                        },
                        btnOkOnPress: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Editdetails(
                                docid: data[index].id,
                                oldnote: data[index]["name"],
                                docdetailsid: widget.notesid,
                              ),
                            ),
                          );
                        },
                      ).show();
                    },
                    child: Card(
                      margin: EdgeInsets.all(5),
                      elevation: 4,
                      color: Color.fromARGB(67, 102, 90, 240),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Center(
                          child: Text(
                            data[index]["name"],
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
        onWillPop: () {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil("homepage", (Route) => false);
          return Future.value(false);
        },
      ),
    );
  }
}
