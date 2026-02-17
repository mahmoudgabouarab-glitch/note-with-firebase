part of 'work_note_cubit.dart';

sealed class WorkNoteState {}

final class WorkNoteInitial extends WorkNoteState {}

final class WorkNoteLoading extends WorkNoteState {}

final class WorkNoteSuccess extends WorkNoteState {
  final List<QueryDocumentSnapshot<Object?>> data;
  WorkNoteSuccess({required this.data});
}

final class WorkNoteFailure extends WorkNoteState {
  final String massage;
  WorkNoteFailure({required this.massage});
}
