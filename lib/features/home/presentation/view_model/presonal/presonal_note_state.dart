part of 'presonal_note_cubit.dart';

sealed class PresonalNoteState {}

final class PresonalNoteInitial extends PresonalNoteState {}

final class PresonalNoteLoading extends PresonalNoteState {}

final class PresonalNoteSuccess extends PresonalNoteState {
  final List<QueryDocumentSnapshot<Object?>> data;
  PresonalNoteSuccess({required this.data});
}

final class PresonalNoteFailure extends PresonalNoteState {
  final String massage;

  PresonalNoteFailure({required this.massage});
}
