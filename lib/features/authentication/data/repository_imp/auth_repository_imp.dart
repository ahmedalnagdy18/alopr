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
}
