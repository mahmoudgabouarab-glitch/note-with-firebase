part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
}

final class ForgetPasswordLoading extends LoginState {}

final class ForgetPasswordSuccess extends LoginState {}

final class ForgetPasswordFailure extends LoginState {
  final String message;
  ForgetPasswordFailure({required this.message});
}
