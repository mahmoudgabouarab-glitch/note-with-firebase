import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/network/constant_collection_fb.dart';

part 'family_note_state.dart';

class FamilyNoteCubit extends Cubit<FamilyNoteState> {
  FamilyNoteCubit() : super(FamilyNoteInitial());
  TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();

  Future<void> getnotes() async {
    emit(FamilyNoteLoading());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(FB.notes)
          .doc(FB.dFamily)
          .collection(FB.cFamily)
          .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .orderBy("createdAt", descending: true)
          .get();
      emit(FamilyNoteSuccess(data: querySnapshot.docs));
    } on FirebaseException catch (e) {
      emit(FamilyNoteFailure(massage: e.code.replaceAll(RegExp(r'-'), ' ')));
    }
  }

  Future<void> addNote() async {
    var notes = FirebaseFirestore.instance
        .collection(FB.notes)
        .doc(FB.dFamily)
        .collection(FB.cFamily);
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
        .doc(FB.dFamily)
        .collection(FB.cFamily)
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
