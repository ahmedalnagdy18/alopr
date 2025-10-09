import 'package:alopr/features/authentication/domain/entity/register_input.dart';
import 'package:alopr/features/authentication/domain/usecase/register_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase registerUsecase;
  RegisterCubit({required this.registerUsecase}) : super(RegisterInitial());
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
}
