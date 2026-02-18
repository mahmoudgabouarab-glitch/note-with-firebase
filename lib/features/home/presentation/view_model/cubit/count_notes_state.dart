part of 'count_notes_cubit.dart';

sealed class CountNotesState {}

final class CountNotesInitial extends CountNotesState {}

final class CountNotesLoading extends CountNotesState {}

final class CountNotesSuccess extends CountNotesState {
  final List <int> count;

  CountNotesSuccess({required this.count});
}

final class CountNotesFailure extends CountNotesState {
  final String message;
  CountNotesFailure({required this.message});
}
