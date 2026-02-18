part of 'count_notes_cubit.dart';

sealed class HomeNotesState {}

final class HomeNotesInitial extends HomeNotesState {}

final class HomeNotesLoading extends HomeNotesState {}

final class HomeNotesSuccess extends HomeNotesState {
  final List<int> count;

  HomeNotesSuccess({required this.count});
}

final class HomeNotesFailure extends HomeNotesState {
  final String message;
  HomeNotesFailure({required this.message});
}
