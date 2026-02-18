import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/network/constant_collection_fb.dart';
import 'package:onlyproject/core/network/fire_base_helper.dart';

part 'family_note_state.dart';

class FamilyNoteCubit extends Cubit<FamilyNoteState> {
  FamilyNoteCubit() : super(FamilyNoteInitial());
  TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();
  TextEditingController editTitle = TextEditingController();
  TextEditingController editSubTitle = TextEditingController();

  Future<void> getnotes() async {
    emit(FamilyNoteLoading());
    try {
      var querySnapshot = await FBHelper.getNote(
        fBD: FB.dFamily,
        fBC: FB.cFamily,
      );
      emit(FamilyNoteSuccess(data: querySnapshot));
    } on FirebaseException catch (e) {
      emit(FamilyNoteFailure(massage: e.code.replaceAll(RegExp(r'-'), ' ')));
    }
  }

  Future<void> addNote() async {
    await FBHelper.addNote(
      title: title.text,
      subTitle: subTitle.text,
      fBD: FB.dFamily,
      fBC: FB.cFamily,
    );
    await getnotes();
    title.clear();
    subTitle.clear();
  }

  Future<void> deletenote(String id) async {
    await FBHelper.deleteNote(id: id, fBD: FB.dFamily, fBC: FB.cFamily);
    await getnotes();
  }

  Future<void> updatenote(String id) async {
    await FBHelper.updateNote(
      editTitle: editTitle.text,
      editSubTitle: editSubTitle.text,
      fBD: FB.dFamily,
      fBC: FB.cFamily,
      id: id,
    );
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
