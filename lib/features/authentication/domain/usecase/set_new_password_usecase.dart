import 'package:alopr/features/authentication/domain/repository/auth_repository.dart';

class SetNewPasswordUsecase {
  final AuthRepository repository;

  SetNewPasswordUsecase({required this.repository});

  Future<void> execute(
      {required String email, required String newPassword}) async {
    return await repository.setNewPassword(email, newPassword);
  }
}
