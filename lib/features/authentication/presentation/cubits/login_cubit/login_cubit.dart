import 'package:alopr/features/authentication/domain/entity/login_input.dart';
import 'package:alopr/features/authentication/domain/usecase/login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginCubit({required this.loginUsecase}) : super(LoginInitial());

  void loginFuc({
    required LoginInput input,
  }) async {
    try {
      emit(LoginLoading());

      await loginUsecase.execute(input);
      emit(LoginSucsess());
    } catch (e) {
      if (e is FormatException) {
        emit(LoginError(message: e.message));
      }
      emit(LoginError(message: e.toString().replaceFirst('Exception: ', '')));
    }
  }
}
