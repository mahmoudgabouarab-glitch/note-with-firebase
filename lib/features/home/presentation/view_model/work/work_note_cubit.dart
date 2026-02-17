import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/network/constant_collection_fb.dart';

part 'work_note_state.dart';

class WorkNoteCubit extends Cubit<WorkNoteState> {
  WorkNoteCubit() : super(WorkNoteInitial());

  TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();

  Future<void> getnotes() async {
    emit(WorkNoteLoading());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(FB.notes)
          .doc(FB.dWork)
          .collection(FB.cWork)
          .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .orderBy("createdAt", descending: true)
          .get();
      emit(WorkNoteSuccess(data: querySnapshot.docs));
    } on FirebaseException catch (e) {
      emit(WorkNoteFailure(massage: e.code.replaceAll(RegExp(r'-'), ' ')));
    }
  }

  Future<void> addNote() async {
    var notes = FirebaseFirestore.instance
        .collection(FB.notes)
        .doc(FB.dWork)
        .collection(FB.cWork);
    await notes.add({
      "id": FirebaseAuth.instance.currentUser!.uid,
      "title": title.text,
      "subtitle": subTitle.text,
      "createdAt": FieldValue.serverTimestamp(),
    });
    await getnotes();
  }

  Future<void> deletenote(String id) async {
    await FirebaseFirestore.instance
        .collection(FB.notes)
        .doc(FB.dWork)
        .collection(FB.cWork)
        .doc(id)
        .delete();
    await getnotes();
  }

  @override
  Future<void> close() {
    title.dispose();
    subTitle.dispose();
    return super.close();
  }
}
