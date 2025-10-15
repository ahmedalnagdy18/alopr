import 'package:alopr/features/home/domain/entity/inputs/complete_profile_input.dart';
import 'package:alopr/features/home/domain/usecase/complete_profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  final CompleteProfileUsecase completeProfileUsecase;

  CompleteProfileCubit({required this.completeProfileUsecase})
      : super(CompleteProfileInitial());

  Future<void> completeProfileFuc({required CompleteProfileInput input}) async {
    try {
      emit(LoadingCompleteProfile());

      // ✅ لو id فاضي → المستخدم أول مرة بيكمّل البروفايل → POST
      // ✅ لو id موجود → تعديل البروفايل الحالي → PUT
      if (input.id == null || input.id!.isEmpty) {
        await completeProfileUsecase.excute(input);
      } else {
        await completeProfileUsecase.update(input);
      }

      emit(SuccessCompleteProfile());
    } catch (e) {
      emit(ErrorCompleteProfile(message: e.toString()));
    }
  }
}
