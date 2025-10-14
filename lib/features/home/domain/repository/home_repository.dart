import 'package:alopr/features/home/domain/entity/inputs/complete_profile_input.dart';
import 'package:alopr/features/home/domain/entity/model/user_data_model.dart';

abstract class HomeRepository {
  Future<void> completeProfile(CompleteProfileInput input);
  Future<List<UserDataModel>> getPatients();
}
