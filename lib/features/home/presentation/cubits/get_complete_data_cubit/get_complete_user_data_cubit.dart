import 'package:alopr/features/home/domain/entity/model/user_data_model.dart';
import 'package:alopr/features/home/domain/usecase/get_user_completed_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_complete_user_data_state.dart';

class GetCompleteUserDataCubit extends Cubit<GetCompleteUserDataState> {
  final GetUserCompletedData getUserCompletedData;
  GetCompleteUserDataCubit({required this.getUserCompletedData})
      : super(GetCompleteUserDataInitial());

  Future<void> getUserData({required String registerId}) async {
    emit(LoadingUserCompleteProfile());
    try {
      final data = await getUserCompletedData.excute(registerId: registerId);
      if (data != null) {
        emit(SuccessUserCompleteProfile(data: data));
      } else {
        emit(ErrorUserCompleteProfile(message: "No data found"));
      }
    } catch (e) {
      emit(ErrorUserCompleteProfile(message: "$e"));
    }
  }
}
