part of 'info_user_cubit.dart';

sealed class InfoUserState {}

final class InfoUserInitial extends InfoUserState {}

final class InfoUserSuccess extends InfoUserState {
  final UserModel user;
  InfoUserSuccess({required this.user});
}

final class InfoUserFailure extends InfoUserState {
  final String message;
  InfoUserFailure({required this.message});
}

final class InfoUserLoading extends InfoUserState {}
