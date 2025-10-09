import 'package:alopr/features/authentication/domain/entity/login_input.dart';
import 'package:alopr/features/authentication/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase({required this.repository});

  Future<void> execute(LoginInput input) async {
    return await repository.login(input);
  }
}
