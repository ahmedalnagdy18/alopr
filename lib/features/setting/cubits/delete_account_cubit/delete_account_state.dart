part of 'delete_account_cubit.dart';

sealed class DeleteAccountState extends Equatable {
  const DeleteAccountState();

  @override
  List<Object> get props => [];
}

final class DeleteAccountInitial extends DeleteAccountState {}

class LoadingDeleteAccount extends DeleteAccountState {}

class SucsessDeleteAccount extends DeleteAccountState {}

class ErrorDeleteAccount extends DeleteAccountState {
  final String message;

  const ErrorDeleteAccount({required this.message});
}
