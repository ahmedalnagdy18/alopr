import 'package:alopr/features/authentication/domain/entity/register_input.dart';
import 'package:alopr/features/authentication/domain/repository/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase({required this.repository});

  Future<void> execute(RegisterInput input) async {
    return await repository.register(input);
  }
}
