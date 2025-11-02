import 'package:alopr/features/authentication/domain/repository/auth_repository.dart';

class CheckEmailUsecase {
  final AuthRepository repository;

  CheckEmailUsecase({required this.repository});

  Future<bool> execute(String email) async {
    return await repository.checkEmail(email);
  }
}
