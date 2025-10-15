part of 'get_complete_user_data_cubit.dart';

sealed class GetCompleteUserDataState extends Equatable {
  const GetCompleteUserDataState();

  @override
  List<Object> get props => [];
}

final class GetCompleteUserDataInitial extends GetCompleteUserDataState {}

class LoadingUserCompleteProfile extends GetCompleteUserDataState {}

class SuccessUserCompleteProfile extends GetCompleteUserDataState {
  final UserDataModel data;

  const SuccessUserCompleteProfile({required this.data});
}

class ErrorUserCompleteProfile extends GetCompleteUserDataState {
  final String message;

  const ErrorUserCompleteProfile({required this.message});
}
