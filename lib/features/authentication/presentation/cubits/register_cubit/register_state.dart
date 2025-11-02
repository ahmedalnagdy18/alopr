part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSucsess extends RegisterState {}

class RegisterError extends RegisterState {
  final String message;

  const RegisterError({required this.message});
}

class LoadingCheckEmail extends RegisterState {}

class SucsessCheckEmail extends RegisterState {}

class EmailNotFound extends RegisterState {}

class ErrorCheckEmail extends RegisterState {
  final String message;
  const ErrorCheckEmail(this.message);
}
