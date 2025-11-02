import 'package:alopr/features/authentication/domain/entity/register_input.dart';
import 'package:alopr/features/authentication/domain/usecase/check_email_usecase.dart';
import 'package:alopr/features/authentication/domain/usecase/register_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase registerUsecase;
  final CheckEmailUsecase checkEmailUsecase;
  RegisterCubit(
      {required this.registerUsecase, required this.checkEmailUsecase})
      : super(RegisterInitial());
  void registerFuc({
    required RegisterInput input,
  }) async {
    try {
      emit(RegisterLoading());

      await registerUsecase.execute(input);
      emit(RegisterSucsess());
    } catch (e) {
      if (e is FormatException) {
        emit(RegisterError(
            message: e.toString().replaceFirst('Exception: ', '')));
      }
      emit(
          RegisterError(message: e.toString().replaceFirst('Exception: ', '')));
    }
  }

  Future<void> checkEmail(String email) async {
    emit(LoadingCheckEmail());

    try {
      final exists = await checkEmailUsecase.execute(email);

      if (exists) {
        emit(SucsessCheckEmail());
      } else {
        emit(EmailNotFound());
      }
    } catch (e) {
      emit(ErrorCheckEmail(e.toString()));
    }
  }
}
