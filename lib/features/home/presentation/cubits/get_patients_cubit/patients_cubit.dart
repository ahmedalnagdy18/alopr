import 'package:alopr/features/home/domain/entity/model/user_data_model.dart';
import 'package:alopr/features/home/domain/usecase/patients_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'patients_state.dart';

class PatientsCubit extends Cubit<PatientsState> {
  final PatientsUsecase patientsUsecase;
  PatientsCubit({required this.patientsUsecase}) : super(PatientsInitial());

  Future<void> getPatients() async {
    emit(LoadingPatients());
    try {
      final data = await patientsUsecase.excute();

      if (data.isEmpty) {
        emit(EmptyPatients());
      } else if (data.isNotEmpty) {
        emit(SuccessPatients(data: data));
      }
    } catch (e) {
      emit(ErrorPatients(message: '$e'));
    }
  }
}
