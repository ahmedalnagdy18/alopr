import 'package:alopr/features/authentication/domain/usecase/set_new_password_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'set_new_password_state.dart';

class SetNewPasswordCubit extends Cubit<SetNewPasswordState> {
  final SetNewPasswordUsecase setNewPasswordUsecase;
  SetNewPasswordCubit({required this.setNewPasswordUsecase})
      : super(SetNewPasswordInitial());

  void setNewPassword(
      {required String email, required String newPassword}) async {
    emit(LoadingNewPassword());
    try {
      await setNewPasswordUsecase.execute(
          email: email, newPassword: newPassword);
      emit(SucsessNewPassword());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorNewPassword(
            message: e.toString().replaceFirst('Exception: ', '')));
      }
      emit(ErrorNewPassword(
          message: e.toString().replaceFirst('Exception: ', '')));
    }
  }
}
