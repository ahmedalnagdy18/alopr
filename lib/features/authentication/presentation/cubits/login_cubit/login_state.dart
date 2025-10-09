part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucsess extends LoginState {}

class LoginError extends LoginState {
  final String message;

  const LoginError({required this.message});
}
