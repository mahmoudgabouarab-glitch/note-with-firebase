import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlyproject/core/network/constant_collection_fb.dart';
import 'package:onlyproject/core/network/fire_base_helper.dart';
import 'package:onlyproject/core/network/local_notification_service.dart';

part 'work_note_state.dart';

class WorkNoteCubit extends Cubit<WorkNoteState> {
  WorkNoteCubit() : super(WorkNoteInitial());

  TextEditingController title = TextEditingController();
  TextEditingController subTitle = TextEditingController();
  TextEditingController editTitle = TextEditingController();
  TextEditingController editSubTitle = TextEditingController();

  Future<void> getnotes() async {
    emit(WorkNoteLoading());
    try {
      var querySnapshot = await FBHelper.getNote(fBD: FB.dWork, fBC: FB.cWork);
      emit(WorkNoteSuccess(data: querySnapshot));
    } on FirebaseException catch (e) {
      emit(WorkNoteFailure(massage: e.code.replaceAll(RegExp(r'-'), ' ')));
    }
  }

  Future<void> addNote() async {
    await FBHelper.addNote(
      title: title.text,
      subTitle: subTitle.text,
      fBD: FB.dWork,
      fBC: FB.cWork,
    );
    await getnotes();
    title.clear();
    subTitle.clear();
  }

  Future<void> deletenote(String id, int noteId) async {
    await FBHelper.deleteNote(id: id, fBD: FB.dWork, fBC: FB.cWork);
    await getnotes();
    await LocalNotificationService.cancelNotification(id: noteId);
  }

  Future<void> updatenote(String id) async {
    await FBHelper.updateNote(
      editTitle: editTitle.text,
      editSubTitle: editSubTitle.text,
      fBD: FB.dWork,
      fBC: FB.cWork,
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
