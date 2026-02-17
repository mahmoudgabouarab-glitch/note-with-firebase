part of 'others_note_cubit.dart';

sealed class OthersNoteState {}

final class OthersNoteInitial extends OthersNoteState {}

final class OthersNoteLoading extends OthersNoteState {}

final class OthersNoteSuccess extends OthersNoteState {
  final List<QueryDocumentSnapshot<Object?>> data;
  OthersNoteSuccess({required this.data});
}

final class OthersNoteFailure extends OthersNoteState {
  final String massage;
  OthersNoteFailure({required this.massage});
}
