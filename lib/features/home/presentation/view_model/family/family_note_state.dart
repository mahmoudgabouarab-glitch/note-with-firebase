part of 'family_note_cubit.dart';

sealed class FamilyNoteState {}

final class FamilyNoteInitial extends FamilyNoteState {}

final class FamilyNoteLoading extends FamilyNoteState {}

final class FamilyNoteSuccess extends FamilyNoteState {
  final List<QueryDocumentSnapshot<Object?>> data;
  FamilyNoteSuccess({required this.data});
}

final class FamilyNoteFailure extends FamilyNoteState {
  final String massage;
  FamilyNoteFailure({required this.massage});
}
