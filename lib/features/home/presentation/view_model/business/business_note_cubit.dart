import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/network/constant_collection_fb.dart';
import 'package:onlyproject/core/network/fire_base_helper.dart';

part 'business_note_state.dart';

class BusinessNoteCubit extends Cubit<BusinessNoteState> {
  BusinessNoteCubit() : super(BusinessNoteInitial());
  TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();
  TextEditingController editTitle = TextEditingController();
  TextEditingController editSubTitle = TextEditingController();

  Future<void> getnotes() async {
    emit(BusinessNoteLoading());
    try {
      var querySnapshot = await FBHelper.getNote(
        fBD: FB.dBusiness,
        fBC: FB.cBusiness,
      );
      emit(BusinessNoteSuccess(data: querySnapshot));
    } on FirebaseException catch (e) {
      emit(BusinessNoteFailure(massage: e.code.replaceAll(RegExp(r'-'), ' ')));
    }
  }

  Future<void> addNote() async {
    await FBHelper.addNote(
      title: title.text,
      subTitle: subTitle.text,
      fBD: FB.dBusiness,
      fBC: FB.cBusiness,
    );
    await getnotes();
    title.clear();
    subTitle.clear();
  }

  Future<void> deletenote(String id) async {
    await FBHelper.deleteNote(id: id, fBD: FB.dBusiness, fBC: FB.cBusiness);
    await getnotes();
  }

  Future<void> updatenote(String id) async {
    await FBHelper.updateNote(
      editTitle: editTitle.text,
      editSubTitle: editSubTitle.text,
      fBD: FB.dBusiness,
      fBC: FB.cBusiness,
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
