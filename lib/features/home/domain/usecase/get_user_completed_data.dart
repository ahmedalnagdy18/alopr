import 'package:alopr/features/home/domain/entity/model/user_data_model.dart';
import 'package:alopr/features/home/domain/repository/home_repository.dart';

class GetUserCompletedData {
  final HomeRepository repository;

  GetUserCompletedData({required this.repository});

  Future<UserDataModel?> excute({required String registerId}) async {
    return await repository.getUserCompleteProfile(registerId);
  }
}
