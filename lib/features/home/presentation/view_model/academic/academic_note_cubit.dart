import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/network/constant_collection_fb.dart';

part 'academic_note_state.dart';

class AcademicNoteCubit extends Cubit<AcademicNoteState> {
  AcademicNoteCubit() : super(AcademicNoteInitial());
    TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();
 TextEditingController editTitle = TextEditingController();
  TextEditingController editSubTitle = TextEditingController();

  Future<void> getnotes() async {
    emit(AcademicNoteLoading());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(FB.notes)
          .doc(FB.dAcademic)
          .collection(FB.cAcademic)
          .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .orderBy("createdAt", descending: true)
          .get();
      emit(AcademicNoteSuccess(data: querySnapshot.docs));
    } on FirebaseException catch (e) {
      emit(AcademicNoteFailure(massage: e.code.replaceAll(RegExp(r'-'), ' ')));
    }
  }

  Future<void> addNote() async {
    var notes = FirebaseFirestore.instance
        .collection(FB.notes)
        .doc(FB.dAcademic)
        .collection(FB.cAcademic);
    await notes.add({
      "id": FirebaseAuth.instance.currentUser!.uid,
      "title": title.text,
      "subtitle": subTitle.text,
      "createdAt": FieldValue.serverTimestamp(),
    });
    await getnotes();title.clear();
    subTitle.clear();
  }

  Future<void> deletenote(String id) async {
    await FirebaseFirestore.instance
        .collection(FB.notes)
        .doc(FB.dAcademic)
        .collection(FB.cAcademic)
        .doc(id)
        .delete();
    await getnotes();
  }
  Future<void> updatenote(String id) async {
    await FirebaseFirestore.instance
        .collection(FB.notes)
        .doc(FB.dAcademic)
        .collection(FB.cAcademic)
        .doc(id)
        .update({"title": editTitle.text, "subtitle": editSubTitle.text});
    await getnotes();
    editTitle.clear();
    editSubTitle.clear();
  }

  @override
  Future<void> close() {
    title.dispose();
    subTitle.dispose();
    editTitle.dispose();
    editSubTitle.dispose();
    return super.close();
  }
}
