import 'package:alopr/features/home/data/data_source/home_data_source.dart';
import 'package:alopr/features/home/domain/entity/inputs/complete_profile_input.dart';
import 'package:alopr/features/home/domain/entity/model/user_data_model.dart';
import 'package:alopr/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImp({required this.homeDataSource});

  @override
  Future<void> completeProfile(CompleteProfileInput input) async {
    return await homeDataSource.completeProfile(input);
  }

  @override
  Future<List<UserDataModel>> getPatients() async {
    return await homeDataSource.getPatients();
  }
}
