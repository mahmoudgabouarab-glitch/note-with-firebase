import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/network/constant_collection_fb.dart';

part 'business_note_state.dart';

class BusinessNoteCubit extends Cubit<BusinessNoteState> {
  BusinessNoteCubit() : super(BusinessNoteInitial());
  TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();

  Future<void> getnotes() async {
    emit(BusinessNoteLoading());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(FB.notes)
          .doc(FB.dBusiness)
          .collection(FB.cBusiness)
          .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .orderBy("createdAt", descending: true)
          .get();
      emit(BusinessNoteSuccess(data: querySnapshot.docs));
    } on FirebaseException catch (e) {
      emit(BusinessNoteFailure(massage: e.code.replaceAll(RegExp(r'-'), ' ')));
    }
  }

  Future<void> addNote() async {
    var notes = FirebaseFirestore.instance
        .collection(FB.notes)
        .doc(FB.dBusiness)
        .collection(FB.cBusiness);
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
        .doc(FB.dBusiness)
        .collection(FB.cBusiness)
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
