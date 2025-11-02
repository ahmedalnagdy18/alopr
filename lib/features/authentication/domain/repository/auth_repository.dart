import 'package:alopr/features/authentication/domain/entity/login_input.dart';
import 'package:alopr/features/authentication/domain/entity/register_input.dart';

abstract class AuthRepository {
  Future<void> register(RegisterInput input);
  Future<void> login(LoginInput input);
  Future<void> deleteAccount();
  Future<bool> checkEmail(String email);
  Future<void> setNewPassword(String email, String newPassword);
}
