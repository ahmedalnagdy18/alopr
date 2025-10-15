part of 'patients_cubit.dart';

sealed class PatientsState extends Equatable {
  const PatientsState();

  @override
  List<Object> get props => [];
}

final class PatientsInitial extends PatientsState {}

class LoadingPatients extends PatientsState {}

class SuccessPatients extends PatientsState {
  final List<UserDataModel> data;

  const SuccessPatients({required this.data});
}

class EmptyPatients extends PatientsState {}

class ErrorPatients extends PatientsState {
  final String message;

  const ErrorPatients({required this.message});
}
