import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/network/constant_collection_fb.dart';
import 'package:onlyproject/core/network/fire_base_helper.dart';

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
      var querySnapshot = await FBHelper.getNote(
        fBD: FB.dAcademic,
        fBC: FB.cAcademic,
      );
      emit(AcademicNoteSuccess(data: querySnapshot));
    } on FirebaseException catch (e) {
      emit(AcademicNoteFailure(massage: e.code.replaceAll(RegExp(r'-'), ' ')));
    }
  }

  Future<void> addNote() async {
    await FBHelper.addNote(
      title: title.text,
      subTitle: subTitle.text,
      fBD: FB.dAcademic,
      fBC: FB.cAcademic,
    );
    await getnotes();
    title.clear();
    subTitle.clear();
  }

  Future<void> deletenote(String id) async {
    await FBHelper.deleteNote(id: id, fBD: FB.dAcademic, fBC: FB.cAcademic);
    await getnotes();
  }

  Future<void> updatenote(String id) async {
    await FBHelper.updateNote(
      editTitle: editTitle.text,
      editSubTitle: editSubTitle.text,
      fBD: FB.dAcademic,
      fBC: FB.cAcademic,
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
