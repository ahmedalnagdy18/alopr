part of 'set_new_password_cubit.dart';

sealed class SetNewPasswordState extends Equatable {
  const SetNewPasswordState();

  @override
  List<Object> get props => [];
}

final class SetNewPasswordInitial extends SetNewPasswordState {}

class LoadingNewPassword extends SetNewPasswordState {}

class SucsessNewPassword extends SetNewPasswordState {}

class ErrorNewPassword extends SetNewPasswordState {
  final String message;

  const ErrorNewPassword({required this.message});
}
