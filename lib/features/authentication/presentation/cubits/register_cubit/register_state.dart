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
