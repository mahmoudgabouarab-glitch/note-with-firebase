import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/network/constant_collection_fb.dart';
import 'package:onlyproject/core/network/fire_base_helper.dart';
import 'package:onlyproject/core/network/local_notification_service.dart';

part 'presonal_note_state.dart';

class PresonalNoteCubit extends Cubit<PresonalNoteState> {
  PresonalNoteCubit() : super(PresonalNoteInitial());

  TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();
  TextEditingController editTitle = TextEditingController();
  TextEditingController editSubTitle = TextEditingController();

  Future<void> getnotes() async {
    emit(PresonalNoteLoading());
    try {
      var querySnapshot = await FBHelper.getNote(
        fBD: FB.dPresonal,
        fBC: FB.cPresonal,
      );
      emit(PresonalNoteSuccess(data: querySnapshot));
    } on FirebaseException catch (e) {
      emit(PresonalNoteFailure(massage: e.code.replaceAll(RegExp(r'-'), ' ')));
    }
  }

  Future<void> addNote() async {
    await FBHelper.addNote(
      title: title.text,
      subTitle: subTitle.text,
      fBD: FB.dPresonal,
      fBC: FB.cPresonal,
    );
    await getnotes();
    title.clear();
    subTitle.clear();
  }

  Future<void> deletenote(String id, int noteId) async {
    await FBHelper.deleteNote(id: id, fBD: FB.dPresonal, fBC: FB.cPresonal);
    await getnotes();
    await LocalNotificationService.cancelNotification(id: noteId);
  }

  Future<void> updatenote(String id) async {
    await FBHelper.updateNote(
      editTitle: editTitle.text,
      editSubTitle: editSubTitle.text,
      fBD: FB.dPresonal,
      fBC: FB.cPresonal,
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
