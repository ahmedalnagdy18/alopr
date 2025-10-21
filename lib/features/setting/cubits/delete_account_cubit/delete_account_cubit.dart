import 'package:alopr/features/authentication/domain/usecase/delete_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteUsecase deleteUsecase;
  DeleteAccountCubit({required this.deleteUsecase})
      : super(DeleteAccountInitial());

  void deletAccountFunc() async {
    emit(LoadingDeleteAccount());
    try {
      await deleteUsecase.execute();
      emit(SucsessDeleteAccount());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorDeleteAccount(message: e.message));
      }
      emit(ErrorDeleteAccount(
          message: e.toString().replaceFirst('Exception: ', '')));
    }
  }
}
