import 'package:alopr/features/authentication/domain/repository/auth_repository.dart';

class DeleteUsecase {
  final AuthRepository repository;

  DeleteUsecase({required this.repository});

  Future<void> execute() async {
    return await repository.deleteAccount();
  }
}
