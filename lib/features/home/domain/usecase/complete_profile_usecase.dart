import 'package:alopr/features/home/domain/entity/inputs/complete_profile_input.dart';
import 'package:alopr/features/home/domain/repository/home_repository.dart';

class CompleteProfileUsecase {
  final HomeRepository repository;

  CompleteProfileUsecase({required this.repository});

  Future<void> excute(CompleteProfileInput input) async {
    return await repository.completeProfile(input);
  }
}
