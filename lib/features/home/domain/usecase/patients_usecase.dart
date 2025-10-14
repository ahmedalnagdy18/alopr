import 'package:alopr/features/home/domain/entity/model/user_data_model.dart';
import 'package:alopr/features/home/domain/repository/home_repository.dart';

class PatientsUsecase {
  final HomeRepository repository;

  PatientsUsecase({required this.repository});

  Future<List<UserDataModel>> excute() async {
    return await repository.getPatients();
  }
}
