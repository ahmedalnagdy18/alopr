part of 'complete_profile_cubit.dart';

sealed class CompleteProfileState extends Equatable {
  const CompleteProfileState();

  @override
  List<Object> get props => [];
}

final class CompleteProfileInitial extends CompleteProfileState {}

class LoadingCompleteProfile extends CompleteProfileState {}

class SuccessCompleteProfile extends CompleteProfileState {}

class ErrorCompleteProfile extends CompleteProfileState {
  final String message;

  const ErrorCompleteProfile({required this.message});
}
