part of 'business_note_cubit.dart';

sealed class BusinessNoteState {}

final class BusinessNoteInitial extends BusinessNoteState {}

final class BusinessNoteLoading extends BusinessNoteState {}

final class BusinessNoteSuccess extends BusinessNoteState {
  final List<QueryDocumentSnapshot<Object?>> data;
  BusinessNoteSuccess({required this.data});
}

final class BusinessNoteFailure extends BusinessNoteState {
  final String massage;
  BusinessNoteFailure({required this.massage});
}
