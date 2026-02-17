part of 'academic_note_cubit.dart';

sealed class AcademicNoteState {}

final class AcademicNoteInitial extends AcademicNoteState {}

final class AcademicNoteLoading extends AcademicNoteState {}

final class AcademicNoteSuccess extends AcademicNoteState {
  final List<QueryDocumentSnapshot<Object?>> data;
  AcademicNoteSuccess({required this.data});
}

final class AcademicNoteFailure extends AcademicNoteState {
  final String massage;
  AcademicNoteFailure({required this.massage});
}
