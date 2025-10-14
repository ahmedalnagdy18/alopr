import 'package:alopr/features/home/domain/entity/inputs/complete_profile_input.dart';
import 'package:alopr/features/home/domain/usecase/complete_profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  final CompleteProfileUsecase completeProfileUsecase;
  CompleteProfileCubit({required this.completeProfileUsecase})
      : super(CompleteProfileInitial());

  void completeProfileFuc({required CompleteProfileInput input}) async {
    try {
      emit(LoadingCompleteProfile());
      await completeProfileUsecase.excute(input);
      emit(SuccessCompleteProfile());
    } catch (e) {
      emit(ErrorCompleteProfile(message: '$e'));
    }
  }
}
