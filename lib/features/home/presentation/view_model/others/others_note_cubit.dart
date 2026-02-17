import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/network/constant_collection_fb.dart';

part 'others_note_state.dart';

class OthersNoteCubit extends Cubit<OthersNoteState> {
  OthersNoteCubit() : super(OthersNoteInitial());

  TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();

  Future<void> getnotes() async {
    emit(OthersNoteLoading());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(FB.notes)
          .doc(FB.dOthers)
          .collection(FB.cOthers)
          .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .orderBy("createdAt", descending: true)
          .get();
      emit(OthersNoteSuccess(data: querySnapshot.docs));
    } on FirebaseException catch (e) {
      emit(OthersNoteFailure(massage: e.code.replaceAll(RegExp(r'-'), ' ')));
    }
  }

  Future<void> addNote() async {
    var notes = FirebaseFirestore.instance
        .collection(FB.notes)
        .doc(FB.dOthers)
        .collection(FB.cOthers);
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
        .doc(FB.dOthers)
        .collection(FB.cOthers)
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
