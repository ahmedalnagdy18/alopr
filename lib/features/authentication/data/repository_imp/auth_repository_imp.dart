import 'package:alopr/features/authentication/data/data_source/auth_data_source.dart';
import 'package:alopr/features/authentication/domain/entity/login_input.dart';
import 'package:alopr/features/authentication/domain/entity/register_input.dart';
import 'package:alopr/features/authentication/domain/repository/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthDataSource remoteDataSource;

  AuthRepositoryImp({required this.remoteDataSource});

  @override
  Future<void> register(RegisterInput input) async {
    await remoteDataSource.register(input);
  }

  @override
  Future<void> login(LoginInput input) async {
    await remoteDataSource.login(input);
  }

  @override
  Future<void> deleteAccount() async {
    await remoteDataSource.deleteAccount();
  }

  @override
  Future<bool> checkEmail(String email) async {
    return await remoteDataSource.checkIfEmailExists(email);
  }

  @override
  Future<void> setNewPassword(String email, String newPassword) async {
    return await remoteDataSource.updatePassword(email, newPassword);
  }
}
